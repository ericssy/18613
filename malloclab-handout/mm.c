/*
<<<<<<< HEAD
 * Siyuan Shen 
 * siyuans
 * 
 * Overview Header Comment
 * 
 *  1) Structure of blocks
 *      Each block has one header, a previous and a next pointer. each of them 
 *      is one word size. Free blocks greater than 16 bytes have a footer.
 *      Blocks with size of 16 bytes are considered as mini blocks and they only
 *      have a header and a next pointer. 
 * 
 *  2) Free blocks
 *      Free blocks have header, next, prev, and footer. They are stored in segeregated 
 *      lists. Mini block olny contains a header and a next pointer
 * 
 *  3) Allocated blocks
 *      Allocated blocks have header and payload, but no footer. 
 * 
 *  4) Organization of freed list
 *      1. non-mini free blocks are stored in segregated list. The seg list is implemented
 *          as an array of block pointers. Each sublist in the
 *          segregated list is a double linked list and it contains blocks with a 
 *          certain range in size. There are 11 sublists in total. The number of 
 *          sublists can be modified through the seg_list_size constant. 
 *          Whenever the malloc is invoked, the segregated list will be searched 
 *          according to the size specified by the malloc function. The search will 
 *          start from the sublist with smallest size range and only proceeds to the 
 *          element inside the sublist when the asize matches the range (asize smaller
 *          than the free block).
 *          Once the desired sublist was found, we started from the node of that sublist
 *          to find the block with the right size. If no block in the sublist mathces, we
 *          proceed to the next sublist with greater size range and repeat until we find a
 *          match. 
 *      2. mini free blocks are stored in a list independent from the segregated list. 
 *          It has the structure of a single linked list. All the blocks in the list are
 *          16 bytes in size. When a malloc method is called and the desired allocated size
 *          is 16 bytes, the mini block list will be searched instead of the segregated list.
 *          Since all the blocks in the list are 16 bytes, we just take the root free block 
 *          for the malloc. Nevertheless, when the mini block list is empty, we proceed to
 *          the segregated list. 
 *          
 *      
 *       
 * 
=======
>>>>>>> 456b5d169f97c7be74e5a37aec8b854435fe5d57
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
<<<<<<< HEAD
#include <math.h>
=======
>>>>>>> 456b5d169f97c7be74e5a37aec8b854435fe5d57

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
<<<<<<< HEAD
static const size_t min_block_size = dsize;
=======
static const size_t min_block_size = 2 * dsize;
>>>>>>> 456b5d169f97c7be74e5a37aec8b854435fe5d57

// TODO: explain what chunksize is
// (Must be divisible by dsize)
static const size_t chunksize = (1 << 12);

// TODO: explain what alloc_mask is
static const word_t alloc_mask = 0x1;
<<<<<<< HEAD
static const word_t prev_alloc_mask = 0x2;
static const word_t prev_mini_block_mask = 0x4;
=======
>>>>>>> 456b5d169f97c7be74e5a37aec8b854435fe5d57

// TODO: explain what size_mask is
static const word_t size_mask = ~(word_t)0xF;

<<<<<<< HEAD
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





=======
/* Represents the header and payload of one block in the heap */
typedef struct block {
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
  char payload[0];

  /*
   * TODO: delete or replace this comment once you've thought about it.
   * Why can't we declare the block footer here as part of the struct?
   * Why do we even have footers -- will the code work fine without them?
   * which functions actually use the data contained in footers?
   */
} block_t;

>>>>>>> 456b5d169f97c7be74e5a37aec8b854435fe5d57
/* Global variables */

// Pointer to first block
static block_t *heap_start = NULL;
<<<<<<< HEAD
static block_t *free_block_root = NULL;
static block_t *target_block = NULL;
static int global_index = -1;
static block_t *segregated_list[seg_list_size];
static block_t *mini_block_list = NULL;
=======

>>>>>>> 456b5d169f97c7be74e5a37aec8b854435fe5d57
/* Function prototypes for internal helper routines */

bool mm_checkheap(int lineno);

static block_t *extend_heap(size_t size);
<<<<<<< HEAD
static block_t *find_fit(size_t asize, block_t * free_block_root);
=======
static block_t *find_fit(size_t asize);
>>>>>>> 456b5d169f97c7be74e5a37aec8b854435fe5d57
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

<<<<<<< HEAD
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
static bool mm_check_seg_list_consistency(int line);
static bool mm_check_heap_header_footer(int line);
static bool mm_check_mini_block_list(int line);

// functions for eliminating footers in allocated blocks
static void write_header_eliminating_footer(block_t *block, size_t size, bool alloc, bool prev_alloc, bool prev_mini_block);
static bool get_prev_alloc(block_t * block);
static word_t pack_eliminating_footer(size_t size, bool alloc, bool prev_alloc, bool prev_mini_block);

// functions for mini block
static block_t *find_prev_mini_block(block_t *block);
static block_t *find_fit_mini_block(size_t size);
static bool get_prev_mini_block(block_t *block);
static void delete_from_mini_block_list(block_t *block);


/*
 * <What does this function do?>
 *      Initialze heap area
 *      The mini block list and the segregated list are initialized to NULL after
 *          the method, no matter what their values before the init. 
 *      The heap is extended with a size of constant chuncksize.
 *      Epilogue and prologue blocks are created. 
 * <What are the function's arguments?>
 *      No argument
 * <What is the function's return value?>
 *      return true if initialized successfully, return false if failed
 * <Are there any preconditions or postconditions?>
 *      the mini block list and the segregated list are initialized to NULL after
 *      the method, no matter what their values before the init. 
 *      The heap is extended with a size of constant chuncksize.
 */ 
bool mm_init(void)
{
    // Create the initial empty heap
    // mem_sbrk(2 * wsize) expands the heap by 2 * wsize
    // Expands the heap by incr bytes, where incr is a non- negative integer, 
    // and returns a generic pointer to the first byte of the newly allocated heap area.
    word_t *start = (word_t *)(mem_sbrk(2 * wsize)); 


    // check if the start is the invalid address 
    if (start == (void *)-1)
    {
        return false;
    }

    // footer -> (header -> payload -> footer) -> (header-> ...)
    // pack: returns a header reflecting a specified size and its alloc status.
    // If the block is allocated, the lowest bit is set to 1, and 0 otherwise.
    start[0] = pack(0, true); // Heap prologue (block footer) set the lowest bit to 1 if the block is allocated
    //start[1] = pack(0, true); // Heap epilogue (block header)
    start[1] = pack_eliminating_footer(0, true, true, false);
    free_block_root = NULL;
    mini_block_list = NULL;
    // Heap starts with first "block header", currently the epilogue
    heap_start = (block_t *)&(start[1]);
    
    // initialize the segregated list
    init_seg_list();

    // Extend the empty heap with a free block of chunksize bytes
    if (extend_heap(chunksize) == NULL)
    {
        return false;
    }
    return true;
}

/*
 * <What does this function do?>
 *      The malloc function allocated a block with at least the size
 *          specified by the size parameter  The entire allocated block should lie within the 
 *          heap region and should not overlap with any other allocated block.
 *      The function first searched the mini block list, and the segregated list for available
 *          free blocks. If there's a matching free block, the block is used for allocation. However,
 *          if no matching free blocks are found, we extend the heap.
 * <What are the function's arguments?>
 *      size: the size needed to be allocated
 * <What is the function's return value?>
 *      return a pointer with void type. The pointer points to the payload of the newly allocated
 *      block
 * <Are there any preconditions or postconditions?>
 *      The malloc function invoked the mm_init() method to initialize the heap if the heap was
 *          not initialized.
 */
void *malloc(size_t size)
{   
    size_t asize;      // Adjusted block size
    size_t extendsize; // Amount to extend heap if no fit is found
    block_t *block;
    void *bp = NULL;

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
    asize = round_up(size + wsize, dsize);

    // special case: the allocated size required is 16 bytes, so the mini block size
        // will be searched first in this case. 
    if (asize <= dsize)
    {
        block = find_fit_mini_block(asize);
        if (block == NULL)  // if no block found in mini block, proceed to segregated list
        {
            block = find_fit_seg_list(asize);
            block = target_block;   
        }
    }
    else 
    {
        block = find_fit_seg_list(asize);
        block = target_block;
    }
    
    // If no fit is found, request more memory, and then and place the block
    if (block == NULL)
    {
        // Always request at least chunksize
        extendsize = max(asize, chunksize);
        //update global_index
        block = extend_heap(extendsize);
        if (block == NULL) // extend_heap returns an error
        {
            return bp;
        } 
    }
    
    // The block should be marked as free
    // get_alloc checks whether the block is allocated or free
    // here, it should be free
    dbg_assert(!get_alloc(block));

    // Allocate the block. Try to split the block if too large
    // The global_index is a global variable that specifies the index of which sublist in
    // the segregated list the program is currently dealing with
    allocate_and_split(block, asize, global_index);

    // header_to_payload: given a block pointer, returns a pointer to the
    // corresponding payload.
    bp = header_to_payload(block);
    
    dbg_ensures(mm_checkheap(__LINE__));
    return bp;
=======
/*
 * <What does this function do?>
 * <What are the function's arguments?>
 * <What is the function's return value?>
 * <Are there any preconditions or postconditions?>
 */
bool mm_init(void) {
  // Create the initial empty heap
  word_t *start = (word_t *)(mem_sbrk(2 * wsize));

  if (start == (void *)-1) {
    return false;
  }

  /*
   * TODO: delete or replace this comment once you've thought about it.
   * Think about why we need a heap prologue and epilogue. Why do
   * they correspond to a block footer and header respectively?
   */

  start[0] = pack(0, true); // Heap prologue (block footer)
  start[1] = pack(0, true); // Heap epilogue (block header)

  // Heap starts with first "block header", currently the epilogue
  heap_start = (block_t *)&(start[1]);

  // Extend the empty heap with a free block of chunksize bytes
  if (extend_heap(chunksize) == NULL) {
    return false;
  }

  return true;
>>>>>>> 456b5d169f97c7be74e5a37aec8b854435fe5d57
}

/*
 * <What does this function do?>
<<<<<<< HEAD
 *      Free the block with payload pointed by pointer bp
 *      It invokes the LIFO_free method for possible coalescing 
 * <What are the function's arguments?>
 *      void *bp is a pointer with thype void, it points to the payload of the
 *          block needs to be freed from memory
 * <What is the function's return value?>
 *      no return value
 * <Are there any preconditions or postconditions?>
 */
void free(void *bp) 
{
    dbg_requires(mm_checkheap(__LINE__));

    if (bp == NULL)
    {
        return;
    }

    block_t *block = payload_to_header(bp);
    size_t size = get_size(block);
    // The block should be marked as allocated
    dbg_assert(get_alloc(block));

    // Mark the block as free
    write_header_eliminating_footer(block, size, false, get_prev_alloc(block), get_prev_mini_block(block));
    write_footer(block, size, false);

    // The global_index is a global variable that specifies the index of which sublist in
    // the segregated list the program is currently dealing with
    global_index = seg_size_to_index(size);
    // coalescing
    block = LIFO_free(block, global_index);
}

/*
 * <What does this function do?>
 *      The realloc routine returns a pointer to an allocated region 
 *          of at least size bytes
 *      If ptr is NULL, equivalent to malloc(size)
 *      If size is equal to zero, equivalent to free(ptr)
 * <What are the function's arguments?>
 *      void *ptr: the pointer to an allocated region that is to be reallocated
 *      size: the minimum size of the newly reallocated block
 * <What is the function's return value?>
 *      returns a pointer to an allocated region of at least size bytes
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
    copysize = get_payload_size(block); // gets size of old payloadf
    if (size < copysize)
    {
        copysize = size;
    }
    memcpy(newptr, ptr, copysize);

    // Free the old block
    free(ptr);

    return newptr;
=======
 * <What are the function's arguments?>
 * <What is the function's return value?>
 * <Are there any preconditions or postconditions?>
 */
void *malloc(size_t size) {
  dbg_requires(mm_checkheap(__LINE__));

  size_t asize;      // Adjusted block size
  size_t extendsize; // Amount to extend heap if no fit is found
  block_t *block;
  void *bp = NULL;

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
  asize = round_up(size + dsize, dsize);

  // Search the free list for a fit
  block = find_fit(asize);

  // If no fit is found, request more memory, and then and place the block
  if (block == NULL) {
    // Always request at least chunksize
    extendsize = max(asize, chunksize);
    block = extend_heap(extendsize);
    if (block == NULL) // extend_heap returns an error
    {
      return bp;
    }
  }

  // The block should be marked as free
  dbg_assert(!get_alloc(block));

  // Mark block as allocated
  size_t block_size = get_size(block);
  write_header(block, block_size, true);
  write_footer(block, block_size, true);

  // Try to split the block if too large
  split_block(block, asize);

  bp = header_to_payload(block);

  dbg_ensures(mm_checkheap(__LINE__));
  return bp;
>>>>>>> 456b5d169f97c7be74e5a37aec8b854435fe5d57
}

/*
 * <What does this function do?>
<<<<<<< HEAD
 *      Allocates memory for an array of nmemb elements of size bytes each 
 *      and returns a pointer to the allocated memory. The memory is set to zero 
 *      before returning.
 * <What are the function's arguments?>
 *      elements: number of elements in the array
 *      size: the size of each element
 * <What is the function's return value?>
 *      returns a pointer points to the payload of the allocated block
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
 *      Extend the heap by size
 *      Coalesce the newly added free block
 * <What are the function's arguments?>
 *      size: the size to be extended, it will be rounded according to the alignment 
 *      requirement
 * <What is the function's return value?>
 *      returns the newly extended block
 * <Are there any preconditions or postconditions?>
 *      precondition: the heap must have prologue and epilogue
 */
static block_t *extend_heap(size_t size)
{
    void *bp;
    // Allocate an even number of words to maintain alignment
    size = round_up(size, dsize);
   
    // Expands the heap by incr bytes, where incr is a non- negative integer, 
    // and returns a generic pointer to the first byte of the newly allocated heap area.
    if ((bp = mem_sbrk(size)) == (void *)-1)
    {
        return NULL;
    }

    global_index = seg_size_to_index(size);

    // Initialize free block header/footer
    block_t *block = payload_to_header(bp);

    // determine if prev block on heap is empty
    bool prev_alloc_on_heap = get_prev_alloc(block);

    write_header_eliminating_footer(block, size, false, prev_alloc_on_heap, get_prev_mini_block(block));
    write_footer(block, size, false);

    // if the seg list is empty
    if (check_if_seg_list_empty()) {
        // no need to coalesce
        segregated_list[global_index] = block;
        write_next(block, block);
        write_prev(block, block);
        block_t *block_next = find_next(block);
        write_header_eliminating_footer(block_next, 0, true, false, false);
    } else {
        // if the seg list is not empty 
        block_t *block_next = find_next(block);
        write_header_eliminating_footer(block_next, 0, true, false, false);
        block = LIFO_free(block, global_index);
    }
    return block;
}


/*
 * <What does this function do?>
 *      allocate the block specified in malloc and split if possible
 *      special case for mini block  
 * <What are the function's arguments?>
 *      block_t *block: the block in malloc
 *      asize: the size of the allocated block 
 *      index: the index of the sublist in seg list of that block
 * <What is the function's return value?>
 *      no return value
 * <Are there any preconditions or postconditions?>
 *      precondition: the global_index variable should be set by the body 
 *      of the malloc funtion 
 */

static void allocate_and_split(block_t *block, size_t asize, int index) {
    dbg_ensures(!get_alloc(block));

    size_t block_size = get_size(block);
    global_index = index;

    // if the block size is mini block, it means there's no need to split and no coalesce
    if (block_size <= dsize)
    {
        delete_from_mini_block_list(block);
        write_header_eliminating_footer(block, block_size, true, true, get_prev_mini_block(block));
        block_t * block_next = find_next(block);
        write_header_eliminating_footer(block_next, get_size(block_next), get_alloc(block_next), true, true);
        return;
    }

    // if there is space for one additonal block, split and coalesce
    if ((block_size - asize) >= min_block_size)
    {
        delete_from_list(block, global_index);
        bool block_mini = false;
        // if the block is mini block
        if (asize <= dsize)
        {
            block_mini = true;
            write_header_eliminating_footer(block, asize, true, true, get_prev_mini_block(block));
            block_t * block_next = find_next(block);
            write_header_eliminating_footer(block_next, get_size(block_next), get_alloc(block_next), false, true);
        }
        else
        // normal split
        {
            write_header_eliminating_footer(block, asize, true, true, get_prev_mini_block(block));
            block_t * block_next = find_next(block);
            write_header_eliminating_footer(block_next, block_size - asize, false, true, false);
        }
        
        block_t * block_next = find_next(block);
        
        // if the next block is a mini block
        if (get_size(block_next) <= dsize)
        {
            write_header_eliminating_footer(block_next, block_size - asize, false, true, block_mini);
            block_t *block_next_next = find_next(block_next);
            write_header_eliminating_footer(block_next_next, get_size(block_next_next), get_alloc(block_next_next), false, true);
        }
        else 
        {
            write_header_eliminating_footer(block_next, block_size - asize, false, true, block_mini);
            write_footer(block_next, block_size - asize, false);
            block_t *block_next_next = find_next(block_next);
            write_header_eliminating_footer(block_next_next, get_size(block_next_next), get_alloc(block_next_next), false, false);
            
        }
        
        // free and coalesce 
        block_next = LIFO_free(block_next, seg_size_to_index(block_size - asize));


    } else {
        delete_from_list(block, global_index);
        block_t * block_next = find_next(block);
        write_header_eliminating_footer(block, block_size, true, true, get_prev_mini_block(block));
        write_header_eliminating_footer(block_next, get_size(block_next), get_alloc(block_next), true, false);
    }
}


/*
 * <What does this function do?>
 *      Find a matching block from a sublist of the segregated list
 * <What are the function's arguments?>
 *      asize: the minimum size required 
 *      block_root: the root block of the sublist
 * <What is the function's return value?>
 *      return a matching block that can be used for the allocation 
 *      if no available, return NULL
 * <Are there any preconditions or postconditions?>
 *      
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

/*
 * <What does this function do?>
 *      Find a matching block from a segregated list
 * <What are the function's arguments?>
 *      asize: the minimum size required 
 * <What is the function's return value?>
 *      return a matching block that can be used for the allocation 
 *      if no available, return NULL
 * <Are there any preconditions or postconditions?>
 *      if no block found, it returns NULL and the global_index is set to -1
 *      if a block is found, the global index will be set to the index of the
 *      sublist the block located
 *      
 */
static block_t * find_fit_seg_list(size_t asize)
{
    
    target_block = NULL;

    for (int i = 0; i < 11; i++)
    {
        if ( asize <= (1L << (i+5)) || i == seg_list_size - 1)
        {
            if (segregated_list[i] != NULL)
            {
                
                target_block = find_fit(asize, segregated_list[i]);
                if (target_block != NULL)
                {
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
 * <What does this function do?>
 *      Check the heap for debug purpose
 * <What are the function's arguments?>
 *      line: line number of the code invoking the checkheap method
 * <What is the function's return value?>
 *      return true if no error found
 *      return false if there's an error 
 * <Are there any preconditions or postconditions?>
 *      preconditions: The heap must be initialized
 *      postconditions: nothing in the heap and seg list will be modified by this method
 */
bool mm_checkheap(int line)
{

    if (!mm_check_seg_list_consistency(line))
    {
        return false;
    }

    if (!mm_check_mini_block_list(line))
    {
        return false;
    }

    return true;
}


/*
 * <What does this function do?>
 *      helper function for mm_check_heap_header_footer
 * <What are the function's arguments?>
 *      block: the block need to be checked 
 *      line: line number of the code invoking the checkheap method
 * <What is the function's return value?>
 *      return true if no error found
 *      return false if there's an error 
 * <Are there any preconditions or postconditions?>
 *      preconditions: The heap must be initialized
 *      postconditions: nothing in the heap and seg list will be modified by this method
 */ 
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
 * <What does this function do?>
 *      check the consistency of the header and footer of each block 
 * <What are the function's arguments?>
 *      line: line number of the code invoking the checkheap method
 * <What is the function's return value?>
 *      return true if no error found
 *      return false if there's an error 
 * <Are there any preconditions or postconditions?>
 *      preconditions: The heap must be initialized
 *      postconditions: nothing in the heap and seg list will be modified by this method
 */ 
bool mm_check_heap_header_footer(int line)
{

    block_t *block;
    bool prev_free = false;
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

        // checks coalescing
        if (extract_alloc(block->header) == 0)
        {
            if (prev_free == true)
            {
                dbg_printf("Line: %d, More than one consecutive free blocks in the heap \n", line);
                return false;
            }
        }
        prev_free = !extract_alloc(block->header);

    }

    return true;
}


/*
 * <What does this function do?>
 *      check the epilogue and prologue blocks
 * <What are the function's arguments?>
 *      line: line number of the code invoking the checkheap method
 * <What is the function's return value?>
 *      return true if no error found
 *      return false if there's an error 
 * <Are there any preconditions or postconditions?>
 *      preconditions: The heap must be initialized
 *      postconditions: nothing in the heap and seg list will be modified by this method
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
 * <What does this function do?>
 *      check the consistency of the seg list 
 * <What are the function's arguments?>
 *      line: line number of the code invoking the checkheap method
 * <What is the function's return value?>
 *      return true if no error found
 *      return false if there's an error 
 * <Are there any preconditions or postconditions?>
 *      preconditions: The heap must be initialized
 *      postconditions: nothing in the heap and seg list will be modified by this method
 */ 
bool mm_check_seg_list_consistency(int line)
{
    // check seg list
    block_t * block;

    unsigned long count_next = 0;
    unsigned long count_prev = 0;
    for (int i = 0; i < seg_list_size; i++)
    {
        dbg_printf("\n List %d:   ", i);
        dbg_printf(" %p ", segregated_list[i]);
        block = segregated_list[i];
        if (block != NULL)
        {
            count_next++;
            for (block = find_next_free(block); block != segregated_list[i]; block = find_next_free(block))
            {   
                dbg_printf(" %p ", block );
                count_next++;
            }
        }
    }

    dbg_printf("END Loop");

    for (int j = 0; j < seg_list_size; j++)
    {
        block = segregated_list[j];
        if (block != NULL)
        {
            count_prev++;
            for (block = find_prev_free(block); block != segregated_list[j]; block = find_prev_free(block))
            {   
                count_prev ++;
            }
        }
    }

    // numebr of count traversed by Next and Prev should be equal
    if (count_prev != count_next)
    {
        dbg_printf("Line: %d,  Prev and Next total count not consistent \n", line);
        return false;
    }

    return true;
}


/*
 * <What does this function do?>
 *      check the consistency in the mini block list 
 * <What are the function's arguments?>
 *      line: line number of the code invoking the checkheap method
 * <What is the function's return value?>
 *      return true if no error found
 *      return false if there's an error 
 * <Are there any preconditions or postconditions?>
 *      preconditions: The heap must be initialized
 *      postconditions: nothing in the heap and seg list will be modified by this method
 */ 
static bool mm_check_mini_block_list(int line)
{
    dbg_printf("\n Mini Block List: ");
    block_t *block = mini_block_list;
    while (block != NULL)
    {
        dbg_printf(" %p  ", block);
        if (get_size(block) != dsize)
        {
            dbg_printf("Line: %d, Block in Mini Block list not equalt to dsize ", line);
            return false;
        }
        block = find_next_free(block);
        
    }
    dbg_printf("\n\n ");
    return true;
}



=======
 * <What are the function's arguments?>
 * <What is the function's return value?>
 * <Are there any preconditions or postconditions?>
 */
void free(void *bp) {
  dbg_requires(mm_checkheap(__LINE__));

  if (bp == NULL) {
    return;
  }

  block_t *block = payload_to_header(bp);
  size_t size = get_size(block);

  // The block should be marked as allocated
  dbg_assert(get_alloc(block));

  // Mark the block as free
  write_header(block, size, false);
  write_footer(block, size, false);

  // Try to coalesce the block with its neighbors
  block = coalesce_block(block);

  dbg_ensures(mm_checkheap(__LINE__));
}

/*
 * <What does this function do?>
 * <What are the function's arguments?>
 * <What is the function's return value?>
 * <Are there any preconditions or postconditions?>
 */
void *realloc(void *ptr, size_t size) {
  block_t *block = payload_to_header(ptr);
  size_t copysize;
  void *newptr;

  // If size == 0, then free block and return NULL
  if (size == 0) {
    free(ptr);
    return NULL;
  }

  // If ptr is NULL, then equivalent to malloc
  if (ptr == NULL) {
    return malloc(size);
  }

  // Otherwise, proceed with reallocation
  newptr = malloc(size);

  // If malloc fails, the original block is left untouched
  if (newptr == NULL) {
    return NULL;
  }

  // Copy the old data
  copysize = get_payload_size(block); // gets size of old payload
  if (size < copysize) {
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
void *calloc(size_t elements, size_t size) {
  void *bp;
  size_t asize = elements * size;

  if (asize / elements != size) {
    // Multiplication overflowed
    return NULL;
  }

  bp = malloc(asize);
  if (bp == NULL) {
    return NULL;
  }

  // Initialize all bits to 0
  memset(bp, 0, asize);

  return bp;
}

/******** The remaining content below are helper and debug routines ********/

/*
 * <What does this function do?>
 * <What are the function's arguments?>
 * <What is the function's return value?>
 * <Are there any preconditions or postconditions?>
 */
static block_t *extend_heap(size_t size) {
  void *bp;

  // Allocate an even number of words to maintain alignment
  size = round_up(size, dsize);
  if ((bp = mem_sbrk(size)) == (void *)-1) {
    return NULL;
  }

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

  // Create new epilogue header
  block_t *block_next = find_next(block);
  write_header(block_next, 0, true);

  // Coalesce in case the previous block was free
  block = coalesce_block(block);

  return block;
}

/*
 * <What does this function do?>
 * <What are the function's arguments?>
 * <What is the function's return value?>
 * <Are there any preconditions or postconditions?>
 */
static block_t *coalesce_block(block_t *block) {
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

  bool prev_alloc = extract_alloc(*find_prev_footer(block));
  bool next_alloc = get_alloc(block_next);

  if (prev_alloc && next_alloc) // Case 1
  {
    // Nothing to do
  }

  else if (prev_alloc && !next_alloc) // Case 2
  {
    size += get_size(block_next);
    write_header(block, size, false);
    write_footer(block, size, false);
  }

  else if (!prev_alloc && next_alloc) // Case 3
  {
    size += get_size(block_prev);
    write_header(block_prev, size, false);
    write_footer(block_prev, size, false);
    block = block_prev;
  }

  else // Case 4
  {
    size += get_size(block_next) + get_size(block_prev);
    write_header(block_prev, size, false);
    write_footer(block_prev, size, false);
    block = block_prev;
  }

  dbg_ensures(!get_alloc(block));

  return block;
}

/*
 * <What does this function do?>
 * <What are the function's arguments?>
 * <What is the function's return value?>
 * <Are there any preconditions or postconditions?>
 */
static void split_block(block_t *block, size_t asize) {
  dbg_requires(get_alloc(block));
  /* TODO: Can you write a precondition about the value of asize? */

  size_t block_size = get_size(block);

  if ((block_size - asize) >= min_block_size) {
    block_t *block_next;
    write_header(block, asize, true);
    write_footer(block, asize, true);

    block_next = find_next(block);
    write_header(block_next, block_size - asize, false);
    write_footer(block_next, block_size - asize, false);
  }

  dbg_ensures(get_alloc(block));
}

/*
 * <What does this function do?>
 * <What are the function's arguments?>
 * <What is the function's return value?>
 * <Are there any preconditions or postconditions?>
 */
static block_t *find_fit(size_t asize) {
  block_t *block;

  for (block = heap_start; get_size(block) > 0; block = find_next(block)) {

    if (!(get_alloc(block)) && (asize <= get_size(block))) {
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
bool mm_checkheap(int line) {
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

  return true;
}
>>>>>>> 456b5d169f97c7be74e5a37aec8b854435fe5d57

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
<<<<<<< HEAD
static size_t max(size_t x, size_t y)
{
    return (x > y) ? x : y;
}
=======
static size_t max(size_t x, size_t y) { return (x > y) ? x : y; }
>>>>>>> 456b5d169f97c7be74e5a37aec8b854435fe5d57

/*
 * round_up: Rounds size up to next multiple of n
 */
<<<<<<< HEAD
static size_t round_up(size_t size, size_t n)
{
    return n * ((size + (n - 1)) / n);
=======
static size_t round_up(size_t size, size_t n) {
  return n * ((size + (n - 1)) / n);
>>>>>>> 456b5d169f97c7be74e5a37aec8b854435fe5d57
}

/*
 * pack: returns a header reflecting a specified size and its alloc status.
 *       If the block is allocated, the lowest bit is set to 1, and 0 otherwise.
 */
<<<<<<< HEAD
static word_t pack(size_t size, bool alloc)
{
    return alloc ? (size | alloc_mask) : size;
=======
static word_t pack(size_t size, bool alloc) {
  return alloc ? (size | alloc_mask) : size;
>>>>>>> 456b5d169f97c7be74e5a37aec8b854435fe5d57
}

/*
 * extract_size: returns the size of a given header value based on the header
 *               specification above.
 */
<<<<<<< HEAD
static size_t extract_size(word_t word)
{
    return (word & size_mask);
}
=======
static size_t extract_size(word_t word) { return (word & size_mask); }
>>>>>>> 456b5d169f97c7be74e5a37aec8b854435fe5d57

/*
 * get_size: returns the size of a given block by clearing the lowest 4 bits
 *           (as the heap is 16-byte aligned).
 */
<<<<<<< HEAD
static size_t get_size(block_t *block)
{
    return extract_size(block->header);
}
=======
static size_t get_size(block_t *block) { return extract_size(block->header); }
>>>>>>> 456b5d169f97c7be74e5a37aec8b854435fe5d57

/*
 * get_payload_size: returns the payload size of a given block, equal to
 *                   the entire block size minus the header and footer sizes.
 */
<<<<<<< HEAD
static word_t get_payload_size(block_t *block)
{
    size_t asize = get_size(block);
    return asize - wsize;  // changed from asize - dsize to asize - wsize because
    // allocated block doesn't have footer
=======
static word_t get_payload_size(block_t *block) {
  size_t asize = get_size(block);
  return asize - dsize;
>>>>>>> 456b5d169f97c7be74e5a37aec8b854435fe5d57
}

/*
 * extract_alloc: returns the allocation status of a given header value based
 *                on the header specification above.
 */
<<<<<<< HEAD
static bool extract_alloc(word_t word)
{
    return (bool)(word & alloc_mask);
}
=======
static bool extract_alloc(word_t word) { return (bool)(word & alloc_mask); }
>>>>>>> 456b5d169f97c7be74e5a37aec8b854435fe5d57

/*
 * get_alloc: returns true when the block is allocated based on the
 *            block header's lowest bit, and false otherwise.
 */
<<<<<<< HEAD
static bool get_alloc(block_t *block)
{
    return extract_alloc(block->header);
}
=======
static bool get_alloc(block_t *block) { return extract_alloc(block->header); }
>>>>>>> 456b5d169f97c7be74e5a37aec8b854435fe5d57

/*
 * write_header: given a block and its size and allocation status,
 *               writes an appropriate value to the block header.
 * TODO: Are there any preconditions or postconditions?
<<<<<<< HEAD
 * size is the space to be allocated
 */
static void write_header(block_t *block, size_t size, bool alloc)
{
    dbg_requires(block != NULL);
    // pack: returns a header reflecting a specified size and its alloc status.
    // If the block is allocated, the lowest bit is set to 1, and 0 otherwise.
    block->header = pack(size, alloc);
=======
 */
static void write_header(block_t *block, size_t size, bool alloc) {
  dbg_requires(block != NULL);
  block->header = pack(size, alloc);
>>>>>>> 456b5d169f97c7be74e5a37aec8b854435fe5d57
}

/*
 * write_footer: given a block and its size and allocation status,
 *               writes an appropriate value to the block footer by first
 *               computing the position of the footer.
 * TODO: Are there any preconditions or postconditions?
<<<<<<< HEAD
 *      precondition: the block must be a free block since allocated block does not have
 *              footer
 */
static void write_footer(block_t *block, size_t size, bool alloc)
{
    dbg_requires(block != NULL);
    dbg_requires(get_size(block) == size && size > 0);
    word_t *footerp = header_to_footer(block);
    *footerp = pack(size, alloc);
=======
 */
static void write_footer(block_t *block, size_t size, bool alloc) {
  dbg_requires(block != NULL);
  dbg_requires(get_size(block) == size && size > 0);
  word_t *footerp = header_to_footer(block);
  *footerp = pack(size, alloc);
>>>>>>> 456b5d169f97c7be74e5a37aec8b854435fe5d57
}

/*
 * find_next: returns the next consecutive block on the heap by adding the
 *            size of the block.
 */
<<<<<<< HEAD
static block_t *find_next(block_t *block)
{
    dbg_requires(block != NULL);
    dbg_requires(get_size(block) != 0);
    return (block_t *)((char *)block + get_size(block));
=======
static block_t *find_next(block_t *block) {
  dbg_requires(block != NULL);
  dbg_requires(get_size(block) != 0);
  return (block_t *)((char *)block + get_size(block));
>>>>>>> 456b5d169f97c7be74e5a37aec8b854435fe5d57
}

/*
 * find_prev_footer: returns the footer of the previous block.
 */
<<<<<<< HEAD
static word_t *find_prev_footer(block_t *block)
{
    // Compute previous footer position as one word before the header
    return &(block->header) - 1;
=======
static word_t *find_prev_footer(block_t *block) {
  // Compute previous footer position as one word before the header
  return &(block->header) - 1;
>>>>>>> 456b5d169f97c7be74e5a37aec8b854435fe5d57
}

/*
 * find_prev: returns the previous block position by checking the previous
 *            block's footer and calculating the start of the previous block
 *            based on its size.
 */
<<<<<<< HEAD
static block_t *find_prev(block_t *block)
{
    dbg_requires(block != NULL);
    dbg_requires(get_size(block) != 0);
    word_t *footerp = find_prev_footer(block);
    size_t size = extract_size(*footerp);
    return (block_t *)((char *)block - size);
=======
static block_t *find_prev(block_t *block) {
  dbg_requires(block != NULL);
  dbg_requires(get_size(block) != 0);
  word_t *footerp = find_prev_footer(block);
  size_t size = extract_size(*footerp);
  return (block_t *)((char *)block - size);
>>>>>>> 456b5d169f97c7be74e5a37aec8b854435fe5d57
}

/*
 * payload_to_header: given a payload pointer, returns a pointer to the
 *                    corresponding block.
 */
<<<<<<< HEAD
static block_t *payload_to_header(void *bp)
{
    return (block_t *)((char *)bp - offsetof(block_t, payload));
=======
static block_t *payload_to_header(void *bp) {
  return (block_t *)((char *)bp - offsetof(block_t, payload));
>>>>>>> 456b5d169f97c7be74e5a37aec8b854435fe5d57
}

/*
 * header_to_payload: given a block pointer, returns a pointer to the
 *                    corresponding payload.
 */
<<<<<<< HEAD
static void *header_to_payload(block_t *block)
{
    return (void *)(block->payload.alloc_payload);
=======
static void *header_to_payload(block_t *block) {
  return (void *)(block->payload);
>>>>>>> 456b5d169f97c7be74e5a37aec8b854435fe5d57
}

/*
 * header_to_footer: given a block pointer, returns a pointer to the
 *                   corresponding footer.
 */
<<<<<<< HEAD
static word_t *header_to_footer(block_t *block)
{
    return (word_t *)(block->payload.alloc_payload + get_size(block) - dsize);
}

/*
 * write_next: link the next pointer of a free block to another element in the seg list 
 */
static void write_next(block_t *block, block_t *next_free_block)
{
    block->payload.free_payload.next = (word_t* ) next_free_block;
}

/*
 * write_prev: link the prev pointer of a free block to another element in the seg list 
 */
static void write_prev(block_t *block, block_t *prev_next_block)
{
    block->payload.free_payload.prev = (word_t* ) prev_next_block;
}

/*
 * find_prev_free: return the block pointed by the prev pointer in a free block 
 */
static block_t *find_prev_free(block_t *block) {
    // payload_to_header
    return (block_t*) block->payload.free_payload.prev;
}

/*
 * find_next_free: return the block pointed by the next pointer in a free block 
 */
static block_t *find_next_free(block_t *block) {
    return (block_t*) block->payload.free_payload.next;
}


/*
 * <What does this function do?>
 *      The LIFO_free function freed the block specifed in parameter and coaelece if possible
 *      It modified the newly freed block's relation with the seg list and the mini block list
 *      It also modifies the headers and footers 
 * <What are the function's arguments?>
 *      block: block being freed 
 *      index: index of the block's position in the seg list 
 * <What is the function's return value?>
 *      return a pointer with block_t type. The pointer points to the block being freed, after coalescing
 * <Are there any preconditions or postconditions?>
 *      precondition: the heap and the seg list, should be initialized
 */
static block_t* LIFO_free(block_t *block, int index) {
    dbg_requires(!get_alloc(block));

    size_t size = get_size(block);
    
    block_t *block_next = find_next(block);

    bool prev_alloc = get_prev_alloc(block);
    bool prev_mini_block = get_prev_mini_block(block);
    bool if_mini_block = false;
    bool next_mini_block = false;
    if (size <= dsize)
    {
        if_mini_block = true;
    }

    if (get_size(block_next) <= dsize)
    {
        next_mini_block = true;
    }


    block_t *block_prev = NULL;
    // only free block has footer 
    if (!prev_alloc)
    {
        if (prev_mini_block)
        {
            block_prev = find_prev_mini_block(block);
        }
        else
        {
            block_prev = find_prev(block);
        }
    }
    
    bool next_alloc = get_alloc(block_next);

    global_index = index;

    if (prev_alloc && next_alloc) // Case 1     both are allocated
    {
        write_header_eliminating_footer(block, size, false, true, prev_mini_block);
        write_footer(block, size, false);
        // change the header of next block, current alloc, prev free
        write_header_eliminating_footer(block_next, get_size(block_next), true, false, if_mini_block);
        dbg_requires(!get_alloc(block));

        if (if_mini_block) // special case for mini block 
        {
            if (mini_block_list == NULL)
            {
                mini_block_list = block;
                write_next(block, NULL);
            }
            else 
            {
                block_t * root_next = find_next_free(mini_block_list);
                write_next(mini_block_list, block);
                write_next(block, root_next);
            }
            return block;
        }

        if (segregated_list[global_index] == NULL)  // special case for empty sublist
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
        dbg_requires(!get_alloc(block));
        dbg_requires(get_alloc(block_next));
        dbg_requires(mm_checkheap(__LINE__));
    }

    else if (prev_alloc && !next_alloc) // Case 2   prev allocated and next free
    {
        
        size += get_size(block_next);
        
        if (get_size(block_next) > dsize)
        {
            delete_from_list(block_next, seg_size_to_index(get_size(block_next)));
        }
        else
        {
            delete_from_mini_block_list(block_next);
        }
        

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
        write_header_eliminating_footer(block, size, false, true, get_prev_mini_block(block));
        write_footer(block, size, false);
        write_header_eliminating_footer(
                find_next(block), get_size(find_next(block)), true, false, false);
        dbg_requires(!get_alloc(block));
        dbg_requires(get_alloc(find_next(block)));
        dbg_requires(mm_checkheap(__LINE__));
    }

    else if (!prev_alloc && next_alloc) // Case 3   prev free and next allocated
    {
        size += get_size(block_prev);

        if (get_size(block_prev) > dsize)
        {
            delete_from_list(block_prev, seg_size_to_index(get_size(block_prev)));
        }
        else
        {
            delete_from_mini_block_list(block_prev);
        }

        
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
        write_header_eliminating_footer(block_prev, size, false, true, get_prev_mini_block(block_prev));
        write_footer(block_prev, size, false);
        write_header_eliminating_footer(block_next, get_size(block_next), true, false, false);
        block = block_prev;

        dbg_requires(!get_alloc(block));
        dbg_requires(get_alloc(find_next(block)));
        dbg_requires(mm_checkheap(__LINE__));
    }

    else // Case 4      both are free
    {
        
        size += get_size(block_next) + get_size(block_prev);

        if (get_size(block_prev) > dsize)
        {
            delete_from_list(block_prev, seg_size_to_index(get_size(block_prev)));
        }
        else
        {
            delete_from_mini_block_list(block_prev);
        }

        if (get_size(block_next) > dsize)
        {
            delete_from_list(block_next, seg_size_to_index(get_size(block_next)));
        }
        else
        {
            delete_from_mini_block_list(block_next);
        }

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
        write_header_eliminating_footer(block_prev, size, false, true, get_prev_mini_block(block_prev));
        write_footer(block_prev, size, false);
        write_header_eliminating_footer(
                find_next(block_prev), get_size(find_next(block_prev)), true, false, false);
        dbg_requires(!get_alloc(block_prev));
        block = block_prev;
        dbg_requires(!get_alloc(block));
        dbg_requires(get_alloc(find_next(block)));
        dbg_requires(mm_checkheap(__LINE__));
    }

    dbg_ensures(!get_alloc(block));
    return block;
}

/*
 * <What does this function do?>
 *     This method deletes a free block from a seg list, and adjust the prev and next pointers 
 * <What are the function's arguments?>
 *      block: the block being deleted
 * <What is the function's return value?>
 *      return a pointer with void type. The pointer points to the payload of the newly allocated
 *      block
 * <Are there any preconditions or postconditions?>
 *      Precondition: the block must be a free block in the seg list
 *      Postcondition: the block was deleted from the seg list, but the block's headers, footers 
 *      are still a free block 
 */
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


/*
 * <What does this function do?>
 *      This method initializes the seg list
 *      It initialize all the sublist to NULL 
 */

static void init_seg_list()
{
    for (int i = 0; i < seg_list_size; i++)
    {
        segregated_list[i] = NULL;
    }
}

/*
 * <What does this function do?>
 *     This method find the root of the sublist, given the size of a block 
 * <What are the function's arguments?>
 *      size: the size of the block
 * <What is the function's return value?>
 *      return a pointer to a block, the block is a root of a sublist in seg list
 *      return NULL if not found 
 * <Are there any preconditions or postconditions?>
*/
static block_t * seg_size_to_root(size_t size)
{
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

/*
 * <What does this function do?>
 *    Given the size, find the index of the sublist in seg list  
 * <What are the function's arguments?>
 *      size: the size of the block
 * <What is the function's return value?>
 *      return an integer, which is the index of the sublist
 * <Are there any preconditions or postconditions?>
*/
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


/*
 * <What does this function do?>
 *    checks if a seg list is empty
 *    It is empty when all the sublist are empty 
 * <What are the function's arguments?>
 * <What is the function's return value?>
 *      returns true if all empty
 *      false if not
 * <Are there any preconditions or postconditions?>
*/
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

/*
 * <What does this function do?>
 *    write appropriate value to a block header, given a block, size, allocation status, 
 *      previous block allocation status and if the previous block is a mini block 
 * <What are the function's arguments?>
 *      block: the block to be modified
 *      size: size written to the header
 *      alloc: block's allocation status
 *      prev_alloc: previous block allocation status
 *      prev_mini_block: if the previous block is a mini block 
 * <What is the function's return value?>
 * <Are there any preconditions or postconditions?>
*/
static void write_header_eliminating_footer(block_t *block, size_t size, bool alloc, 
                                bool prev_alloc, bool prev_mini_block)
{
    dbg_requires(block != NULL);
    if (prev_alloc)
    {
        block->header = size | (alloc_mask & alloc) | (prev_alloc_mask) 
                            | (prev_mini_block_mask & (prev_mini_block << 2));
    } else 
    {
        block->header = size | (alloc_mask & alloc) | (prev_mini_block_mask & (prev_mini_block << 2));
    }
}


/*
 * <What does this function do?>
 *    given a block, find the allocation status of the block before it
 * <What are the function's arguments?>
 *      block: the block we want to get info from 
*/
static bool get_prev_alloc(block_t *block)
{
    if ( (block->header & prev_alloc_mask) == 0)
    {
        return false;
    } 
    else 
    {
        return true;
    }
}


/*
 * <What does this function do?>
 *    get the appropriate value of a block header, given a block, size, allocation status, 
 *      previous block allocation status and if the previous block is a mini block 
 * <What are the function's arguments?>
 *      block: the block to be modified
 *      size: size written to the header
 *      alloc: block's allocation status
 *      prev_alloc: previous block allocation status
 *      prev_mini_block: if the previous block is a mini block 
 * <What is the function's return value?>
 *      return word_t, the content of the resulting header 
*/
static word_t pack_eliminating_footer(size_t size, bool alloc, bool prev_alloc, bool prev_mini_block)
{
    if (prev_alloc)
    {
        //dbg_printf("ELIMINATING FOOTER %lx", size | (alloc_mask & alloc) | (prev_alloc_mask) );
        return size | (alloc_mask & alloc) | (prev_alloc_mask) 
                        | (prev_mini_block_mask & (prev_mini_block << 2));
    } else 
    {
        return size | (alloc_mask & alloc) | (prev_mini_block_mask & (prev_mini_block << 2));
    }
}


/*
 * <What does this function do?>
 *    find if the previous block in heap is a mini block 
 * <What are the function's arguments?>
 *      block: the block to be modified
 *      size: size written to the header
 *      alloc: block's allocation status
 *      prev_alloc: previous block allocation status
 *      prev_mini_block: if the previous block is a mini block 
 * <What is the function's return value?>
 *      return word_t, the content of the resulting header 
*/
static bool get_prev_mini_block(block_t *block)
{
    if ((block->header & prev_mini_block_mask) == 0)
    {
        return false;
    }
    else 
    {
        return true;
    }
}

/*
 * <What does this function do?>
 *    if the previous block in heap is a mini block, use this method to find the previous block
 * <What are the function's arguments?>
 *      block: the current block in heap 
 * <What is the function's return value?>
 *      return a block pointer, which points to the previous mini block 
 * <Are there any preconditions or postconditions?>
 *      precondition: the previous block has to be a mini block 
*/
static block_t *find_prev_mini_block(block_t *block)
{
    dbg_requires(block != NULL);
    dbg_requires(get_size(block) != 0);
    return (block_t *)((char *)block - dsize);
}


/*
 * <What does this function do?>
 *    delete a free block from the mini block list 
 * <What are the function's arguments?>
 *      block: the block needs to be deleted
 * <What is the function's return value?>
 *      no return value 
 * <Are there any preconditions or postconditions?>
 *      precondition: the block has to be a free and mini block in the mini block list
 *      postcondition: it only deletes the free block from the list, it does not 
 *          modify the header, footer and other properties of the block 
*/
static void delete_from_mini_block_list(block_t *block)
{
    if (block == mini_block_list && find_next_free(mini_block_list) == NULL)
    {
        mini_block_list = NULL;
    }
    else if (block == mini_block_list)
    {
        mini_block_list = find_next_free(mini_block_list);
    }
    else 
    {
        block_t * temp = mini_block_list;
        block_t * cur = find_next_free(mini_block_list);
        while (cur != NULL)
        {
            if (block == cur)
            {
                write_next(temp, find_next_free(cur));
                break;
            }
            cur = find_next_free(cur);
            temp = find_next_free(temp);
        }
    }
}


/*
 * <What does this function do?>
 *    given a size, find a matching value in the mini block list
 *         Since all mini block are 16 bytes, it first checks the size argument
 * <What are the function's arguments?>
 *     size: the size required
 * <What is the function's return value?>
 *      return a matching block if found, 
 *      if the mini block list is empty, return NULL  
*/
static block_t *find_fit_mini_block(size_t size)
{
    dbg_ensures(size <= dsize);
    if (mini_block_list == NULL)
    {
        return NULL;
    }
    return mini_block_list;
}
=======
static word_t *header_to_footer(block_t *block) {
  return (word_t *)(block->payload + get_size(block) - dsize);
}
>>>>>>> 456b5d169f97c7be74e5a37aec8b854435fe5d57
