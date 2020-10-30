* chunk size





*extend_heap(size_t size)



what is dsize 



why dbg_assert used to mark the block as free?

dbg_ensures



why split the block 



asize is the adjusted (rounded up) size of the block 





case 3  in coalesce_block 

​	why it's 



pre and post conditions



chunk size 



为什么 epilogue 是allocated ？



为什么 block struct 没有 footer 







static block_t *extend_heap(size_t size);

static block_t *find_fit(size_t asize);

static block_t *coalesce_block(block_t *block);

static void split_block(block_t *block, size_t asize);





- print /x *((unsigned long *) bp - 1)

1. Maximizing throughput requires making sure your allocator finds a suitable block quickly







为什么 extend_heap 没有 create dummy footer？ 

​		因为增加， heap  加在原来下面 



\#define GET(p) (* (unsigned long *) (p));

\#define PUT(p, val) (* (unsigned long *) (p) = (val))









expand heap

* if 只有新的block 是第一个free block
  * block -> next = block
  * block -> prev = block 
* if 已经有free block 
  * find next free (free block foot) 
  * 

​				



`run -c traces/syn-mix-short.rep`

`run -c traces/bdd-aa4.rep`



`run -c traces/syn-string-short.rep`

`run -c traces/bdd-aa32.rep`



`run -c traces/syn-array-short.rep`



`run -c  traces/ngram-fox1.rep`

`run -c traces/syn-mix-realloc.rep`





coalesce 