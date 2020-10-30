/*
 * Siyuan Shen 
 * siyuans
 ******************************************************************************
 *                                   mm.c                                     *
 *           64-bit struct-based implicit free list memory allocator          *
 *                  15-213: Introduction to Computer Systems                  *
 *                                                                            *
 *  ************************************************************************  *
 *                  TODO: insert your documentation here. :)                  *
 *                                                                            *
 *  ************************************************************************  *
 *  ** ADVICE FOR STUDENTS. **                                                *
 *  Step 0: Please read the writeup!                                          *
 *  Step 1: Write your heap checker. Write. Heap. checker.                    *
 *  Step 2: Place your contracts / debugging assert statements.               *
 *  Good luck, and have fun!                                                  *
 *                                                                            *
 ******************************************************************************
 */

#include <assert.h>
#include <inttypes.h>
#include <stdbool.h>
#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <math.h>

#include "memlib.h"
#include "mm.h"

/* Do not change the following! */

#ifdef DRIVER
/* create aliases for driver tests */
#define malloc mm_malloc
#define free mm_free
#define realloc mm_realloc
#define calloc mm_calloc
#define memset mem_memset
#define memcpy mem_memcpy
#endif /* def DRIVER */

/* You can change anything from here onward */

/*
 * If DEBUG is defined (such as when running mdriver-dbg), these macros
 * are enabled. You can use them to print debugging output and to check
 * contracts only in debug mode.
 *
 * Only debugging macros with names beginning "dbg_" are allowed.
 * You may not define any other macros having arguments.
 */
#ifdef DEBUG
/* When DEBUG is defined, these form aliases to useful functions */
#define dbg_printf(...) printf(__VA_ARGS__)
#define dbg_requires(expr) assert(expr)
#define dbg_assert(expr) assert(expr)
#define dbg_ensures(expr) assert(expr)
#define dbg_printheap(...) print_heap(__VA_ARGS__)
#else
/* When DEBUG is not defined, no code gets generated for these */
/* The sizeof() hack is used to avoid "unused variable" warnings */
#define dbg_printf(...) (sizeof(__VA_ARGS__), -1)
#define dbg_requires(expr) (sizeof(expr), 1)
#define dbg_assert(expr) (sizeof(expr), 1)
#define dbg_ensures(expr) (sizeof(expr), 1)
#define dbg_printheap(...) ((void)sizeof(__VA_ARGS__))
#endif

/* Basic constants */

typedef uint64_t word_t;

// Word and header size (bytes)
static const size_t wsize = sizeof(word_t);

// Double word size (bytes)
static const size_t dsize = 2 * wsize;

// Minimum block size (bytes)
static const size_t min_block_size = 2 * dsize;

// TODO: explain what chunksize is
// (Must be divisible by dsize)
static const size_t chunksize = (1 << 12);

// TODO: explain what alloc_mask is
static const word_t alloc_mask = 0x1;

// TODO: explain what size_mask is
static const word_t size_mask = ~(word_t)0xF;

static const int seg_list_size = 11;

/* Represents the header and payload of one block in the heap */
typedef struct prev_next
{
    word_t * next;
    word_t * prev;
}prev_next_t;

typedef struct block
{
    /* Header contains size + allocation flag */
    word_t header;

    /*
     * TODO: feel free to delete this comment once you've read it carefully.
     * We don't know what the size of the payload will be, so we will declare
     * it as a zero-length array, which is a GCC compiler extension. This will
     * allow us to obtain a pointer to the start of the payload.
     *
     * WARNING: A zero-length array must be the last element in a struct, so
     * there should not be any struct fields after it. For this lab, we will
     * allow you to include a zero-length array in a union, as long as the
     * union is the last field in its containing struct. However, this is
     * compiler-specific behavior and should be avoided in general.
     *
     * WARNING: DO NOT cast this pointer to/from other types! Instead, you
     * should use a union to alias this zero-length array with another struct,
     * in order to store additional types of data in the payload memory.
     */
    union
    {
        prev_next_t free_payload;
        char alloc_payload[0];
    } payload;


    /*
     * TODO: delete or replace this comment once you've thought about it.
     * Why can't we declare the block footer here as part of the struct?
     * Why do we even have footers -- will the code work fine without them?
     * which functions actually use the data contained in footers?
     */
} block_t;





/* Global variables */

// Pointer to first block
static block_t *heap_start = NULL;
static block_t *free_block_root = NULL;
static block_t *target_block = NULL;
static int global_index = -1;
static block_t *segregated_list[seg_list_size];
/* Function prototypes for internal helper routines */

bool mm_checkheap(int lineno);

static block_t *extend_heap(size_t size);
static block_t *find_fit(size_t asize, block_t * free_block_root);
static block_t *coalesce_block(block_t *block);
static void split_block(block_t *block, size_t asize);

static size_t max(size_t x, size_t y);
static size_t round_up(size_t size, size_t n);
static word_t pack(size_t size, bool alloc);

static size_t extract_size(word_t header);
static size_t get_size(block_t *block);
static size_t get_payload_size(block_t *block);

static bool extract_alloc(word_t header);
static bool get_alloc(block_t *block);

static void write_header(block_t *block, size_t size, bool alloc);
static void write_footer(block_t *block, size_t size, bool alloc);

static block_t *payload_to_header(void *bp);
static void *header_to_payload(block_t *block);
static word_t *header_to_footer(block_t *block);

static block_t *find_next(block_t *block);
static word_t *find_prev_footer(block_t *block);
static block_t *find_prev(block_t *block);

static void write_next(block_t *block, block_t *next_free_block);
static void write_prev(block_t *block, block_t *prev_free_block);
static block_t *find_next_free(block_t *block);
static block_t *find_prev_free(block_t *block);
static block_t *LIFO_free(block_t *block, int index);
static block_t *find_fit_original(size_t asize);
static void allocate_and_split(block_t *block, size_t asize, int index);
static void delete_from_list(block_t * block, int index);

// functions for segregate list
static block_t * seg_size_to_root(size_t size);
static void init_seg_list();
static block_t * find_fit_seg_list(size_t asize);
static int seg_size_to_index(size_t size);
static bool check_if_seg_list_empty();
// functions for mm_checkheap
static bool mm_check_dummy(int line);
static bool mm_check_header_footer(block_t * block, int line);


/*
 * <What does this function do?>
 * Initialze heap area
 * <What are the function's arguments?>
 * <What is the function's return value?>
 * <Are there any preconditions or postconditions?>
 */
bool mm_init(void)
{
    // Create the initial empty heap
    // mem_sbrk(2 * wsize) expands the heap by 2 * wsize
    // Expands the heap by incr bytes, where incr is a non- negative integer, 
    // and returns a generic pointer to the first byte of the newly allocated heap area.
    word_t *start = (word_t *)(mem_sbrk(2 * wsize)); 


    // check if the start is the invalid address 0xFFFFFFFFFFFFFFFF
    if (start == (void *)-1)
    {
        return false;
    }

    /*
     * TODO: delete or replace this comment once you've thought about it.
     * Think about why we need a heap prologue and epilogue. Why do
     * they correspond to a block footer and header respectively?
     */

    // footer -> (header -> payload -> footer) -> (header-> ...)
    // pack: returns a header reflecting a specified size and its alloc status.
    // If the block is allocated, the lowest bit is set to 1, and 0 otherwise.
    start[0] = pack(0, true); // Heap prologue (block footer) set the lowest bit to 1 if the block is allocated
    start[1] = pack(0, true); // Heap epilogue (block header)
    free_block_root = NULL;
    // Heap starts with first "block header", currently the epilogue
    heap_start = (block_t *)&(start[1]);

    // initialize the segregated list
    init_seg_list();

    // Extend the empty heap with a free block of chunksize bytes
    if (extend_heap(chunksize) == NULL)
    {
        return false;
    }
    dbg_printf("INIT\n");
    return true;
}

/*
 * <What does this function do?>
 * The malloc routine returns a pointer to an allocated block payload 
 * of at least "size" bytes. The entire allocated block should lie within the 
 * heap region and should not overlap with any other allocated block.
 * <What are the function's arguments?>
 * <What is the function's return value?>
 * <Are there any preconditions or postconditions?>
 */
void *malloc(size_t size)
{   
    
    dbg_printf("\n\n\n MALLOC size: %lu ", size);
    dbg_printf("\n ROOT: %p ", free_block_root);
    // dbg_printf("\n ROOT next: %p ", find_next_free(free_block_root));
    // dbg_printf("\n ROOT prev: %p ", find_prev_free(free_block_root));

    size_t asize;      // Adjusted block size
    size_t extendsize; // Amount to extend heap if no fit is found
    block_t *block;
    void *bp = NULL;

    //printf("MALLOC: %lu", size);
    if (heap_start == NULL) // Initialize heap if it isn't initialized
    {
        mm_init();
        

    }

    if (size == 0) // Ignore spurious request
    {
        dbg_ensures(mm_checkheap(__LINE__));
        return bp;
    }

    // Adjust block size to include overhead and to meet alignment requirements
    // round_up: Rounds size up to next multiple of dsize
    // dsize - 16 byte
    // ensure 16 byte alignment requirement
    asize = round_up(size + dsize, dsize);
    dbg_printf( "  asize: %lu", asize);
    // Search the free list for a fit
    // get global index 

    if (asize == 46812739120)
    {
        dbg_requires(mm_checkheap(__LINE__));
    }

    block = find_fit_seg_list(asize);


    block = target_block;
    // If no fit is found, request more memory, and then and place the block
    if (block == NULL)
    {
        dbg_printf("global_index: %d", global_index);
        // Always request at least chunksize
        extendsize = max(asize, chunksize);
        dbg_printf("\nexpand  \n");
        
        //update global_index
        block = extend_heap(extendsize);
        if (block == NULL) // extend_heap returns an error
        {
            return bp;
        }
        
    }
    
    dbg_printf("\nSTART OF BLOCK by find fit : %p\n", block);
    dbg_printf("\n target index  : %d\n", global_index);
    dbg_printf(" Size from find fit: %lu\n", get_size(block) );
    
    // The block should be marked as free
    // get_alloc checks whether the block is allocated or free
    // here, it should be free
    dbg_assert(!get_alloc(block));

    // Try to split the block if too large

    allocate_and_split(block, asize, global_index);

    // header_to_payload: given a block pointer, returns a pointer to the
    // corresponding payload.
    bp = header_to_payload(block);
    
    
    // dbg_printf("malloc size: %lu, %p \n\n", size, block);
    dbg_printf("MALLOC HEADER: %p ", block);
    dbg_printf("MALLOC FOOTER: %p \n", header_to_footer(block));
    // dbg_printf("AFTER MALLOC ROOT: %p \n", free_block_root);
    // dbg_printf("AFTER MALLOC ROOT Footer: %p \n", header_to_footer(free_block_root));
    // dbg_printf("AFTER MALLOC ROOT NEXT: %p \n", find_next_free(free_block_root));
    // dbg_printf("AFTER MALLOC ROOT PREV: %p \n", find_prev_free(free_block_root));
    //dbg_ensures(mm_checkheap(__LINE__));
    dbg_printf("MALLOC END\n \n");
    
    return bp;
}

/*
 * <What does this function do?>
 * Free the block pointed by *bp 
 * <What are the function's arguments?>
 * <What is the function's return value?>
 * <Are there any preconditions or postconditions?>
 */
void free(void *bp) // bp points to the payload
{
    //dbg_requires(mm_checkheap(__LINE__));

    if (bp == NULL)
    {
        return;
    }

    block_t *block = payload_to_header(bp);
    dbg_printf("\n FREE: %p \n", block);
    size_t size = get_size(block);
    dbg_printf("\n Freed size %zu", get_size(block));
    if (get_size(block) == 33872)
    {
        dbg_printf("\n garbled bytes %lx", (unsigned long)*(block->payload.alloc_payload));
    }
    // The block should be marked as allocated
    dbg_assert(get_alloc(block));

    // dbg_printf("\n ROOT INITIAL %p", free_block_root);
    // dbg_printf("\n ROOT size %zu", get_size(free_block_root));
    // dbg_printf("\n ROOT INITIAL NEXT %p", find_next_free(free_block_root));
    // dbg_printf("\n ROOT INITIAL PREV %p", find_prev_free(free_block_root));

    // Mark the block as free
    write_header(block, size, false);
    write_footer(block, size, false);

    // LIFO insert freed block at the 
    global_index = seg_size_to_index(size);
    block = LIFO_free(block, global_index);

    // Try to coalesce the block with its neighbors
    // block = coalesce_block(block);

    //dbg_ensures(mm_checkheap(__LINE__));
    // dbg_printf(" ROOT After FREE %p", free_block_root);
    // dbg_printf("\n ROOT NEXT AFTER FREE %p", find_next_free(free_block_root));
    // dbg_printf("\n ROOT PREV AFTER FREE %p\n\n", find_prev_free(free_block_root));
}

/*
 * <What does this function do?>
 * <What are the function's arguments?>
 * <What is the function's return value?>
 * <Are there any preconditions or postconditions?>
 */
void *realloc(void *ptr, size_t size)
{
    block_t *block = payload_to_header(ptr);
    size_t copysize;
    void *newptr;

    // If size == 0, then free block and return NULL
    if (size == 0)
    {
        free(ptr);
        return NULL;
    }

    // If ptr is NULL, then equivalent to malloc
    if (ptr == NULL)
    {
        return malloc(size);
    }

    // Otherwise, proceed with reallocation
    newptr = malloc(size);

    // If malloc fails, the original block is left untouched
    if (newptr == NULL)
    {
        return NULL;
    }

    // Copy the old data
    copysize = get_payload_size(block); // gets size of old payload
    if (size < copysize)
    {
        copysize = size;
    }
    memcpy(newptr, ptr, copysize);

    // Free the old block
    free(ptr);

    return newptr;
}

/*
 * <What does this function do?>
 * <What are the function's arguments?>
 * <What is the function's return value?>
 * <Are there any preconditions or postconditions?>
 */
void *calloc(size_t elements, size_t size)
{
    void *bp;
    size_t asize = elements * size;

    if (asize / elements != size)
    {
        // Multiplication overflowed
        return NULL;
    }

    bp = malloc(asize);
    if (bp == NULL)
    {
        return NULL;
    }

    // Initialize all bits to 0
    memset(bp, 0, asize);

    return bp;
}

/******** The remaining content below are helper and debug routines ********/

/*
 * <What does this function do?>
 * extend the heap
 * <What are the function's arguments?>
 * <What is the function's return value?>
 * <Are there any preconditions or postconditions?>
 */
static block_t *extend_heap(size_t size)
{
    void *bp;
    dbg_printf("\nEXTEND:   \n");
    // Allocate an even number of words to maintain alignment
    size = round_up(size, dsize);
    // Expands the heap by incr bytes, where incr is a non- negative integer, 
    // and returns a generic pointer to the first byte of the newly allocated heap area.

    if ((bp = mem_sbrk(size)) == (void *)-1)
    {
        return NULL;
    }

    // free_block_root = seg_size_to_root(size);
    global_index = seg_size_to_index(size);
    /*
     * TODO: delete or replace this comment once you've thought about it.
     * Think about what bp represents. Why do we write the new block
     * starting one word BEFORE bp, but with the same size that we
     * originally requested?
     */

    // Initialize free block header/footer
    block_t *block = payload_to_header(bp);
    write_header(block, size, false);
    write_footer(block, size, false);


    
    // if there is no free block, it means the current expanded block is the first free block
    if (check_if_seg_list_empty()) {
        segregated_list[global_index] = block;
        write_next(block, block);
        write_prev(block, block);
        block_t *block_next = find_next(block);
        dbg_printf("\nwrite dummy header");
        write_header(block_next, 0, true);
        //dbg_ensures(mm_checkheap(__LINE__));
    } else {
        // // if there's already free block
        // block_t *tail = find_prev_free(free_block_root); // the prev of root is the tail
        
        // // tail -> next = block
        // // block -> prev = tail
        // write_next(tail, block);
        // write_prev(block, tail);
        // // block -> next = root
        // // root -> prev = block
        // write_next(block, free_block_root);
        // write_prev(free_block_root, block);

        block_t *block_next = find_next(block);
        dbg_printf("\nwrite dummy header");
        write_header(block_next, 0, true);
        // dbg_printf("expand heap Before LIFO free");
        // dbg_ensures(mm_checkheap(__LINE__));
        block = LIFO_free(block, global_index);
        // dbg_printf("expand heap After LIFO free");
        // dbg_ensures(mm_checkheap(__LINE__));
    }

    

    // block_t *block_next = find_next(block);
    // dbg_printf("\nwrite dummy header");
    // write_header(block_next, 0, true);

    // Coalesce in case the previous block was free
    //block = coalesce_block(block);
    return block;
}

/*
 * <What does this function do?>
 * coalesce the block
 * <What are the function's arguments?>
 * <What is the function's return value?>
 * <Are there any preconditions or postconditions?>
 */
static block_t *coalesce_block(block_t *block)
{
    // check if the block is free.
    dbg_requires(!get_alloc(block));

    size_t size = get_size(block);
    
    /*
     * TODO: delete or replace this comment once you've thought about it.
     * Think about how we find the prev and next blocks. What information
     * do we need to have about the heap in order to do this? Why doesn't
     * "bool prev_alloc = get_alloc(block_prev)" work properly?
     */

    block_t *block_next = find_next(block);
    block_t *block_prev = find_prev(block);
    
    // dbg_printf("block prev: %p", block_prev);
    // dbg_printf(" size of prev block: %lu ", get_size(block_prev));
    // dbg_printf(" size of prev block 2: %lu ", block_prev->header);
    // dbg_printf("block current: %p", block);
    // dbg_printf(" size of current block: %lu ", get_size(block));
    // for prev_alloc, first find the previous footer
    // extract alloc returns the allocation status based on the bits 
    bool prev_alloc = extract_alloc(*find_prev_footer(block));
    bool next_alloc = get_alloc(block_next);
    
    dbg_printf("\n PREV ALLOC %d, NEXT ALLOC %d\n", prev_alloc, next_alloc);
    // dbg_printf("\n prev footer  %lx", (block->header) - 1);
    // dbg_printf("\n prev footer extract size  %lx", extract_size((block->header) - 1));
    // dbg_printf("\n block  %lu", extract_size((block->header) - 1));
    
    // dbg_printf("\n block Next %p", block_next);
    // dbg_printf("\n block Next Header %lx", block_next->header);
    // dbg_printf("\n block Prev footer %lx", (block->header) - 1);
    // dbg_printf("\n block Prev header %p", (block_t *)((char *)(block) - 0x70));
    // block_t * b = (block_t *)((char *)(block) - 0x70);
    // dbg_printf("\n  prev Header Content %lx", b->header);
    // dbg_printf("\n block prev %p", block_prev);
    if (prev_alloc && next_alloc) // Case 1     both are allocated
    {
        // Nothing to do
    }

    else if (prev_alloc && !next_alloc) // Case 2   prev allocated and next free
    {
        size += get_size(block_next);

        if (block_next == free_block_root)
        {
            free_block_root = block;
        }
        write_next(block, find_next_free(block_next));
        // dbg_printf("BLOCK NEXT %p", find_next_free(block_next));
        // dbg_printf("BLOCK  %p", block);
        write_prev(find_next_free(block_next), block);
        // false indicates writing it as free
        // in implicit slides page 39
        write_header(block, size, false);
        write_footer(block, size, false);

        
    }

    else if (!prev_alloc && next_alloc) // Case 3   prev free and next allocated
    {
        size += get_size(block_prev);
        //dbg_requires(mm_checkheap(__LINE__));
        //reset next and prev

        if (block == free_block_root)
        {
            free_block_root = block_prev;
        }
        
        // block_prev -> next = block -> next
        write_next(block_prev, find_next_free(block));
        write_prev(find_next_free(block), block_prev);
        
        
        write_header(block_prev, size, false);
        write_footer(block_prev, size, false);  // it should be block_prev, because the first param is the starting position
        // it means, starting from the header of block_prev, allocate space of size 'size'
        // skips the original header in the middle
        block = block_prev;
    }

    else // Case 4      both are free
    {
        size += get_size(block_next) + get_size(block_prev);
        
        if (block == free_block_root || block_next == free_block_root)
        {
            free_block_root = block_prev;
        }
        write_next(block_prev, find_next_free(block_next));
        write_prev(find_next_free(block_next), block_prev);

        write_header(block_prev, size, false);
        write_footer(block_prev, size, false);
        block = block_prev;
    }


    dbg_ensures(!get_alloc(block));

    return block;
}

/*
 * <What does this function do?>
 * try to split the block if it's too large
 * <What are the function's arguments?>
 * <What is the function's return value?>
 * <Are there any preconditions or postconditions?>
 */
static void split_block(block_t *block, size_t asize)
{
    dbg_requires(get_alloc(block));
    /* TODO: Can you write a precondition about the value of asize? */

    size_t block_size = get_size(block);

    // modified from (block_size - asize) >= min_block_size
    // since free block needs 32 bytes 
    if ((block_size - asize) >= min_block_size + dsize)
    {
        block_t *block_next;
        write_header(block, asize, true);
        write_footer(block, asize, true);
        block_next = find_next(block);
        write_header(block_next, block_size - asize, false);
        write_footer(block_next, block_size - asize, false);
        // if (block == free_block_root)
        // {
        //     free_block_root = block_next;
        //     write_next(block_size, find_next_free(free_block_root));
            
        // }
        dbg_printf("\n SPLIT BLOCK :  %p \n", block_next );
        //LIFO_free(block_next);
        dbg_printf("\n SPLIT BLOCK root:  %p \n", free_block_root);
        dbg_printf("\n SPLIT BLOCK root next :  %p \n", find_next_free(free_block_root));
        coalesce_block(block_next);
        
    }

    dbg_ensures(get_alloc(block));
}


static void allocate_and_split(block_t *block, size_t asize, int index) {
    //dbg_ensures(mm_checkheap(__LINE__));
    dbg_printf("\n Alloc Split %d\n", get_alloc(block));

    size_t block_size = get_size(block);
    // int index = seg_size_to_index(block_size);
    global_index = index;

    if ((block_size - asize) >= min_block_size + dsize)
    {
        delete_from_list(block, global_index);
        write_header(block, asize, true);
        write_footer(block, asize, true);
        
        block_t * block_next = find_next(block);
        // delete from list 
        
        write_header(block_next, block_size - asize, false);
        write_footer(block_next, block_size - asize, false);

        // global index updated in LIFO_free
        dbg_printf("\nTEST\n");
        block_next = LIFO_free(block_next, seg_size_to_index(block_size - asize));


        // if (block == free_block_root)
        // {
        //     free_block_root = block_next;
        // }

        // if (block == find_next_free(block))
        // { // if block is the only block
        //     write_prev(block_next, block_next);
        //     write_next(block_next, block_next);
        // } else 
        // { // if there is more than one block 
        //     write_next(find_prev_free(block), block_next);
        //     write_prev(find_next_free(block), block_next);
        //     write_prev(block_next, find_prev_free(block));
        //     write_next(block_next, find_next_free(block));
        // }


    } else {
        write_header(block, block_size, true);
        write_footer(block, block_size, true);

        delete_from_list(block, global_index);
        // // delete from linked list
        // if (block == free_block_root && find_next_free(free_block_root) == free_block_root)
        // {
        //     // when root is the block being allocated and there's no other nodes in the list
        //     free_block_root = NULL;
        //     extend_heap(chunksize);
        //     return;
        // } else if (block == free_block_root)
        // { 
        //     free_block_root = find_next_free(block);
        // }
        // write_next(find_prev_free(block), find_next_free(block));
        // write_prev(find_next_free(block), find_prev_free(block));
    }
}
/*
 * <What does this function do?>
 * <What are the function's arguments?>
 * <What is the function's return value?>
 * <Are there any preconditions or postconditions?>
 */
static block_t *find_fit(size_t asize, block_t * block_root)
{
    block_t *block;

    if (get_size(block_root) >= asize)
    {
        return block_root;
    }

    for (block = find_next_free(block_root); get_size(block) > 0; block = find_next_free(block))
    {
        if (block == block_root) {
            return NULL;
        }

        if (!(get_alloc(block)) && asize <= get_size(block))
        {
            return block;
        }
    }
    return NULL; // no fit found
}

static block_t * find_fit_seg_list(size_t asize)
{
    
    target_block = NULL;
    dbg_printf("\n find_fit_seg_list invoked \n");

    for (int i = 0; i < 11; i++)
    {
        dbg_printf("\nrange lower: %ld", (1L << (i+4)) );
        dbg_printf("range upper: %ld", (1L << (i+5)) );
        if ( asize <= (1L << (i+5)) || i == seg_list_size - 1)
        {
            dbg_printf("size fit : %zu", asize);
            if (segregated_list[i] != NULL)
            {
                
                target_block = find_fit(asize, segregated_list[i]);
                if (target_block != NULL)
                {
                    dbg_printf("size fit : %zu", asize);
                    global_index = i;
                    return target_block;
                }
            }
        }
    }

    global_index = -1;
    return NULL;



}


/*
 * original find_fit
 */ 
static block_t *find_fit_original(size_t asize)
{
    block_t *block;

    for (block = heap_start; get_size(block) > 0; block = find_next(block))
    {

        if (!(get_alloc(block)) && (asize <= get_size(block)))
        {
            return block;
        }
    }
    return NULL; // no fit found
}

/*
 * <What does this function do?>
 * <What are the function's arguments?>
 * <What is the function's return value?>
 * <Are there any preconditions or postconditions?>
 */
bool mm_checkheap(int line)
{
    /*
     * TODO: Delete this comment!
     *
     * You will need to write the heap checker yourself.
     * Please keep modularity in mind when you're writing the heap checker!
     *
     * As a filler: one guacamole is equal to 6.02214086 x 10**23 guacas.
     * One might even call it...  the avocado's number.
     *
     * Internal use only: If you mix guacamole on your bibimbap,
     * do you eat it with a pair of chopsticks, or with a spoon?
     */
    
    // check the epilogue and prologue blocks
    if (!mm_check_dummy(line))
    {
        dbg_printf("Line: %d, epilogue and prologue error \n", line);
        return false;
    }

    // check alignment
    block_t *block;
    for (block = heap_start; get_size(block) > 0; block = find_next(block))
    {
        word_t *payload_addr = NULL;
        payload_addr = &(block->header) + 1;
        word_t *dummy_footer = find_prev_footer(heap_start);
        if ( (payload_addr - dummy_footer) * wsize % dsize != 0)
        {   
            dbg_printf("Line: %d, Block address not aligned \n", line);
            return false;
        }

        if (!mm_check_header_footer(block, line))
        {
            return false;
        }
    }


    // check seg list

    // int count_next = 0;
    // int count_prev = 0;
    for (int i = 0; i < seg_list_size; i++)
    {
        dbg_printf("\n List %d:   ", i);
        
        dbg_printf(" %p ", segregated_list[i]);
        block = segregated_list[i];
        if (block != NULL)
        {
            for (block = find_next_free(block); block != segregated_list[i]; block = find_next_free(block))
            {   
            dbg_printf(" %p ", block );
            }
        }
        



        // for (block = segregated_list[i]; find_next_free(block) == segregated_list[i] ; block = find_next_free(block))
        // {
        //     // count_next++;
        //     dbg_printf(" %p ", block);
        // }
    }



    return true;
}


bool mm_check_header_footer(block_t * block, int line)
{
    size_t footer_size = extract_size(*header_to_footer(block));
    // dbg_printf(" Footer SIZe: %lu   ", (unsigned long)* header_to_footer(block));

    
    bool header_alloc = extract_alloc(block->header);
    bool footer_alloc = extract_alloc(*header_to_footer(block));


    if (header_alloc != footer_alloc)
    {
        dbg_printf(" Header bit: %d ", header_alloc);
        dbg_printf(" Footer bit: %d \n ", footer_alloc);
        dbg_printf("\nLine: %d, Header and Footer Alloc bit not consistent \n", line);
    }

    if ( extract_size(block->header) != footer_size)
    {
        dbg_printf(" Header SIZE: %lu ", extract_size(block->header));
        dbg_printf(" Footer SIZe: %lu \n", footer_size);
        dbg_printf("\nLine: %d, Header and Footer Size not consistent \n", line);
        return false;
    }
    return true;

}


/*
 * check the epilogue and prologue blocks
 */
bool mm_check_dummy(int line)
{
    // check if heap_start (epilogue) is null
    if (heap_start == NULL)
    {
        printf("Line: %d, heap_start is Null \n", line);
        return false;
    }

    // check if prologue is null
    if (find_prev_footer(heap_start) == NULL)
    {
        printf("Line: %d, heap_start prev footer NULL \n", line);
        return false;
    }

    if (!extract_alloc(*find_prev_footer(heap_start))) // if the prev footer are NOT allocated
    {
        printf("Line: %d, dummy footer not allocated \n", line);
        return false;
    }

    return true;
}


/*
 *****************************************************************************
 * The functions below are short wrapper functions to perform                *
 * bit manipulation, pointer arithmetic, and other helper operations.        *
 *                                                                           *
 * We've given you the function header comments for the functions below      *
 * to help you understand how this baseline code works.                      *
 *                                                                           *
 * Note that these function header comments are short since the functions    *
 * they are describing are short as well; you will need to provide           *
 * adequate details within your header comments for the functions above!     *
 *                                                                           *
 *                                                                           *
 * Do not delete the following super-secret(tm) lines!                       *
 *                                                                           *
 * 53 6f 20 79 6f 75 27 72 65 20 74 72 79 69 6e 67 20 74 6f 20               *
 *                                                                           *
 * 66 69 67 75 72 65 20 6f 75 74 20 77 68 61 74 20 74 68 65 20               *
 * 68 65 78 61 64 65 63 69 6d 61 6c 20 64 69 67 69 74 73 20 64               *
 * 6f 2e 2e 2e 20 68 61 68 61 68 61 21 20 41 53 43 49 49 20 69               *
 *                                                                           *
 * 73 6e 27 74 20 74 68 65 20 72 69 67 68 74 20 65 6e 63 6f 64               *
 * 69 6e 67 21 20 4e 69 63 65 20 74 72 79 2c 20 74 68 6f 75 67               *
 * 68 21 20 2d 44 72 2e 20 45 76 69 6c 0a de ba c1 e1 52 13 0a               *
 *                                                                           *
 *****************************************************************************
 */

/*
 * max: returns x if x > y, and y otherwise.
 */
static size_t max(size_t x, size_t y)
{
    return (x > y) ? x : y;
}

/*
 * round_up: Rounds size up to next multiple of n
 */
static size_t round_up(size_t size, size_t n)
{
    return n * ((size + (n - 1)) / n);
}

/*
 * pack: returns a header reflecting a specified size and its alloc status.
 *       If the block is allocated, the lowest bit is set to 1, and 0 otherwise.
 */
static word_t pack(size_t size, bool alloc)
{
    return alloc ? (size | alloc_mask) : size;
}

/*
 * extract_size: returns the size of a given header value based on the header
 *               specification above.
 */
static size_t extract_size(word_t word)
{
    return (word & size_mask);
}

/*
 * get_size: returns the size of a given block by clearing the lowest 4 bits
 *           (as the heap is 16-byte aligned).
 */
static size_t get_size(block_t *block)
{
    return extract_size(block->header);
}

/*
 * get_payload_size: returns the payload size of a given block, equal to
 *                   the entire block size minus the header and footer sizes.
 */
static word_t get_payload_size(block_t *block)
{
    size_t asize = get_size(block);
    return asize - dsize;
}

/*
 * extract_alloc: returns the allocation status of a given header value based
 *                on the header specification above.
 */
static bool extract_alloc(word_t word)
{
    return (bool)(word & alloc_mask);
}

/*
 * get_alloc: returns true when the block is allocated based on the
 *            block header's lowest bit, and false otherwise.
 */
static bool get_alloc(block_t *block)
{
    return extract_alloc(block->header);
}

/*
 * write_header: given a block and its size and allocation status,
 *               writes an appropriate value to the block header.
 * TODO: Are there any preconditions or postconditions?
 * size is the space to be allocated
 */
static void write_header(block_t *block, size_t size, bool alloc)
{
    dbg_requires(block != NULL);
    // pack: returns a header reflecting a specified size and its alloc status.
    // If the block is allocated, the lowest bit is set to 1, and 0 otherwise.
    block->header = pack(size, alloc);
    dbg_printf("WRITE Header %p \n", block);
}

/*
 * write_footer: given a block and its size and allocation status,
 *               writes an appropriate value to the block footer by first
 *               computing the position of the footer.
 * TODO: Are there any preconditions or postconditions?
 */
static void write_footer(block_t *block, size_t size, bool alloc)
{
    dbg_requires(block != NULL);
    dbg_requires(get_size(block) == size && size > 0);
    word_t *footerp = header_to_footer(block);
    dbg_printf("WRITE FOOTER %p \n", footerp);
    *footerp = pack(size, alloc);
}

/*
 * find_next: returns the next consecutive block on the heap by adding the
 *            size of the block.
 */
static block_t *find_next(block_t *block)
{
    dbg_requires(block != NULL);
    dbg_requires(get_size(block) != 0);
    return (block_t *)((char *)block + get_size(block));
}

/*
 * find_prev_footer: returns the footer of the previous block.
 */
static word_t *find_prev_footer(block_t *block)
{
    // Compute previous footer position as one word before the header
    return &(block->header) - 1;
}

/*
 * find_prev: returns the previous block position by checking the previous
 *            block's footer and calculating the start of the previous block
 *            based on its size.
 */
static block_t *find_prev(block_t *block)
{
    dbg_requires(block != NULL);
    dbg_requires(get_size(block) != 0);
    word_t *footerp = find_prev_footer(block);
    size_t size = extract_size(*footerp);
    return (block_t *)((char *)block - size);
}

/*
 * payload_to_header: given a payload pointer, returns a pointer to the
 *                    corresponding block.
 */
static block_t *payload_to_header(void *bp)
{
    return (block_t *)((char *)bp - offsetof(block_t, payload));
}

/*
 * header_to_payload: given a block pointer, returns a pointer to the
 *                    corresponding payload.
 */
static void *header_to_payload(block_t *block)
{
    return (void *)(block->payload.alloc_payload);
}

/*
 * header_to_footer: given a block pointer, returns a pointer to the
 *                   corresponding footer.
 */
static word_t *header_to_footer(block_t *block)
{
    return (word_t *)(block->payload.alloc_payload + get_size(block) - dsize);
}


static void write_next(block_t *block, block_t *next_free_block)
{
    block->payload.free_payload.next = (word_t* ) next_free_block;
    // dbg_printf("block address:  %p", block);
    // dbg_printf(" %p\n", block->payload.free_payload.next);
    // dbg_printf("next free block %p ", next_free_block);
    // dbg_printf("payload %p ", block->payload);
}


static void write_prev(block_t *block, block_t *prev_next_block)
{
    block->payload.free_payload.prev = (word_t* ) prev_next_block;
}

static block_t *find_prev_free(block_t *block) {
    // payload_to_header
    return (block_t*) block->payload.free_payload.prev;
}

static block_t *find_next_free(block_t *block) {

    return (block_t*) block->payload.free_payload.next;
}

static block_t* LIFO_free(block_t *block, int index) {
    // block_t *tmp = find_next_free(free_block_root);
    // dbg_printf("LIFO root prev : %p  \n", free_block_root->payload.free_payload.prev);
    // dbg_printf("LIFO root next tmp: %p  ", tmp);
    // // root -> next = block
    // write_next(free_block_root, block);
    // //block -> prev = root
    // //blocl -> next = tmp
    // write_prev(block, free_block_root);
    // write_next(block, tmp);
    // // tmp -> prev = block
    // write_prev(tmp, block);
    // dbg_printf("END of LIFO FREE");

    // check if the block is free.
    dbg_requires(!get_alloc(block));

    size_t size = get_size(block);
    
    block_t *block_next = find_next(block);
    block_t *block_prev = find_prev(block);

    bool prev_alloc = extract_alloc(*find_prev_footer(block));
    bool next_alloc = get_alloc(block_next);

    global_index = index;

    dbg_printf("\n PREV ALLOC %d, NEXT ALLOC %d\n", prev_alloc, next_alloc);
    if (prev_alloc && next_alloc) // Case 1     both are allocated
    {
        // Nothing to do
        write_header(block, size, false);
        write_footer(block, size, false);
        dbg_printf("\nTEST\n");

        if (segregated_list[global_index] == NULL)
        {
            segregated_list[global_index] = block;
            write_next(block, block);
            write_prev(block, block);
        } else 
        {
            block_t *root_next = find_next_free(segregated_list[global_index]);
            write_next(segregated_list[global_index], block);
            write_prev(root_next, block);
            write_next(block, root_next);
            write_prev(block, segregated_list[global_index]);
        }

    }

    else if (prev_alloc && !next_alloc) // Case 2   prev allocated and next free
    {
        size += get_size(block_next);
        
        // block_t *root_prev = find_prev_free(free_block_root);
        delete_from_list(block_next, seg_size_to_index(get_size(block_next)));

        // find the location in seg list to add the free block 
        global_index = seg_size_to_index(size);

        if (segregated_list[global_index] == NULL)
        {
            segregated_list[global_index] = block;
            write_next(block, block);
            write_prev(block, block);
        } else {
            block_t *root_next = find_next_free(segregated_list[global_index]);
            write_next(segregated_list[global_index], block);
            write_prev(root_next, block);
            write_next(block, root_next);
            write_prev(block, segregated_list[global_index]);
        }
        write_header(block, size, false);
        write_footer(block, size, false);

    }

    else if (!prev_alloc && next_alloc) // Case 3   prev free and next allocated
    {
        size += get_size(block_prev);
        //dbg_requires(mm_checkheap(__LINE__));

        delete_from_list(block_prev, seg_size_to_index(get_size(block_prev)));

        global_index = seg_size_to_index(size);

        if (segregated_list[global_index] == NULL)
        {
            segregated_list[global_index] = block_prev;
            write_next(block_prev, block_prev);
            write_prev(block_prev, block_prev);
        } else {
            block_t *root_next = find_next_free(segregated_list[global_index]);
            write_next(segregated_list[global_index], block_prev);
            write_prev(root_next, block_prev);
            write_next(block_prev, root_next);
            write_prev(block_prev, segregated_list[global_index]);

        }
        write_header(block_prev, size, false);
        write_footer(block_prev, size, false);
        block = block_prev;
    }

    else // Case 4      both are free
    {
        dbg_printf("BLOCK PREV: %p  ", block_prev);
        dbg_printf("BLOCK NEXT: %p \n", block_next);
        size += get_size(block_next) + get_size(block_prev);

        delete_from_list(block_prev, seg_size_to_index(get_size(block_prev)));
        delete_from_list(block_next, seg_size_to_index(get_size(block_next)));

        global_index = seg_size_to_index(size);

        if (segregated_list[global_index] == NULL)
        {
            segregated_list[global_index] = block_prev;
            write_next(block_prev, block_prev);
            write_prev(block_prev, block_prev);
        } else 
        {
            block_t *root_next = find_next_free(segregated_list[global_index]);
            write_next(segregated_list[global_index], block_prev);
            write_prev(root_next, block_prev);
            write_next(block_prev, root_next);
            write_prev(block_prev, segregated_list[global_index]);
        }
        write_header(block_prev, size, false);
        write_footer(block_prev, size, false);
        block = block_prev;
    }

    dbg_ensures(!get_alloc(block));
    dbg_printf("END of LIFO FREE");
    return block;



}

static void delete_from_list(block_t * block, int index)
{
    // int index = seg_size_to_index(get_size(block));
    if (block == segregated_list[index] && find_next_free(block) == block)
    {
        segregated_list[index] = NULL;
        return;
    }
    else if (block == segregated_list[index])
    {
        segregated_list[index] = find_next_free(segregated_list[index]);
    }
    write_next(find_prev_free(block), find_next_free(block));
    write_prev(find_next_free(block), find_prev_free(block));
}


static void init_seg_list()
{
    for (int i = 0; i < seg_list_size; i++)
    {
        segregated_list[i] = NULL;
    }
}

static block_t * seg_size_to_root(size_t size)
{
    // log((unsigned long) size);
    // int index = log(size)

    if (size > (1L << (seg_list_size + 4 - 1)) )
    {
        return segregated_list[seg_list_size - 1];
    }

    for (int i = 0; i < 11; i++)
    {
        if ( size <= (1L << (i+5)) && size > (1L << (i+4)) )
        {
            return segregated_list[i];
        }
    }

    return NULL;
}


static int seg_size_to_index(size_t size)
{
    // log((unsigned long) size);
    // int index = log(size)

    if (size > (1L << (seg_list_size + 4 - 1)) )
    {
        return seg_list_size - 1;
    }

    for (int i = 0; i < 11; i++)
    {
        if ( size <= (1L << (i+5)) && size > (1L << (i+4)) )
        {
            return i;
        }
    }

    return 0;

}

static bool check_if_seg_list_empty()
{
    for (int i = 0; i < seg_list_size; i++)
    {
        if (segregated_list[i] != NULL)
        {
            return false;
        }
    }
    return true;
}