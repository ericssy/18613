/* Name: Siyuan Shen
 * Andrew ID: siyuans
 *
 */

#include <getopt.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#include "cachelab.h"

long hit_count = 0;
long miss_count = 0;
long eviction_count = 0;
long dirty_bytes_in_cache_count = 0;
long dirty_bytes_evicted_count = 0;
long instruction_num = 0;

typedef struct cache_line {
  int valid_bit;
  int dirty;
  unsigned long tag;
  int most_recent_access;
  unsigned long address;
  unsigned long address_end;
} cache_line;


void load_into_cache(cache_line *cache, int t, int s, int b, int E,
                        unsigned long address, int size, short verbose_flag,
                        char op) {
  unsigned long tag_bits;
  unsigned long set_index;
  unsigned long block_offset;

  unsigned long allOnes = ~0L;
  unsigned long b_mask = ~(allOnes << b);
  block_offset = b_mask & address;
  unsigned long s_mask = ~((allOnes << (s + b)) | b_mask);
  set_index = (s_mask & address) >> b;
  tag_bits = address >> (s + b) << (s + b); // tag bits without shifted to the right

  // printf("address 0x%lx\n", address);
  // printf("tag bits 0x%lx\n", tag_bits);
  // printf("set index 0x%lx\n", set_index);
  // printf("block offset 0x%lx\n", block_offset);

  cache_line *line_ptr;
  line_ptr = &*(cache + set_index * E);

  // (cache + set_index * E)->valid_bit = 9;

  instruction_num++;
  // printf("cache in-function %d\n", (cache + set_index * E)->valid_bit);
  // printf("line_ptr in-function %d\n", (line_ptr)->valid_bit);
  // printf("%d\n", sizeof(*cache));

  for (int i = 0; i < E; i++) {
      if ((line_ptr + i)->tag == tag_bits) {
        if ((line_ptr + i)->valid_bit == 1) {
          if ((address - block_offset) >= (line_ptr + i)->address && (address - block_offset + (1 << b)) <= (line_ptr + i)->address_end) {
            hit_count++;
            (line_ptr + i)->most_recent_access = instruction_num; // update the array to the most recent accessed
                                  // block
          if (op == 'S' && (line_ptr + i)->dirty == 0) {
            (line_ptr + i)->dirty = 1;
            dirty_bytes_in_cache_count += (1 << b);
          }
          if (verbose_flag == 1) {
            printf("%c %lx,%d hit\n", op, address, size);
            printf("dirty bytes:%ld  dirty evicted:%ld\n",
            dirty_bytes_in_cache_count, dirty_bytes_evicted_count);
          }
          return;
          } else { // address out of bound
            miss_count++;
            eviction_count++;
            (line_ptr + i)->address = address - block_offset;
            (line_ptr + i)->address = address - block_offset + (1 << b);
            (line_ptr + i)->most_recent_access = instruction_num;
            if (op == 'S') {
              if ((line_ptr + i)->dirty == 1) {
                  dirty_bytes_evicted_count += (1 << b);
              } else {
                  (line_ptr + i)->dirty = 1;
                  dirty_bytes_in_cache_count += (1 << b);
              }
            }
            if (op == 'L' && (line_ptr + i)->dirty == 1) {
              (line_ptr + i)->dirty = 0;
              dirty_bytes_evicted_count += (1 << b);
              dirty_bytes_in_cache_count -= (1 << b);
            }

            if (verbose_flag == 1) {
              printf("%c %lx,%d miss eviction\n", op, address, size);
            }
            printf("dirty bytes:%ld  dirty evicted:%ld\n",
            dirty_bytes_in_cache_count, dirty_bytes_evicted_count);
            return;
          }
        }
      }
  }

  // (matching tag and valid bit) = false

  int least_recent_access = line_ptr->most_recent_access;
  int least_recent_access_index = 0;

  for (int j = 0; j < E; j++) {
    if ( (line_ptr + j)->most_recent_access < least_recent_access) {
      least_recent_access = (line_ptr + j)->most_recent_access;
      least_recent_access_index = j;
    }
    if ( (line_ptr + j)->valid_bit == 0) {
      (line_ptr + j)->tag = tag_bits;
      (line_ptr + j)->valid_bit = 1;
      (line_ptr + j)->address = address - block_offset;
      (line_ptr + j)->address_end = address - block_offset + (1 << b);
      (line_ptr + j)->most_recent_access = instruction_num;
      miss_count++;
      
      if (op == 'S') {
        if ((line_ptr + j)->dirty == 1) {
        dirty_bytes_evicted_count += (1 << b);
        } else {
        (line_ptr + j)->dirty = 1;
        dirty_bytes_in_cache_count += (1 << b);
        }
      }
      if (op == 'L' && (line_ptr + j)->dirty == 1) {
        (line_ptr + j)->dirty = 0;
        dirty_bytes_evicted_count += (1 << b);
        dirty_bytes_in_cache_count -= (1 << b);
      }
      if (verbose_flag == 1) {
        printf("%c %lx,%d miss\n", op, address, size);
      }
      printf("dirty bytes:%ld  dirty evicted:%ld\n", dirty_bytes_in_cache_count, dirty_bytes_evicted_count);
      return;
    }
  }


  // printf("initial dirty bit: %d\n", (line_ptr +least_recent_access_index)->dirty);
  (line_ptr + least_recent_access_index)->valid_bit = 1;
  (line_ptr + least_recent_access_index)->tag = tag_bits;
  (line_ptr + least_recent_access_index)->address = address - block_offset;
  (line_ptr + least_recent_access_index)->address_end = address - block_offset + (1 << b);
  (line_ptr + least_recent_access_index)->most_recent_access = instruction_num;
  miss_count++;
  eviction_count++;
  if (op == 'S') {
    if ((line_ptr + least_recent_access_index)->dirty == 1) {
    dirty_bytes_evicted_count += (1 << b);
    } else if ((line_ptr + least_recent_access_index)->dirty == 0) {
    (line_ptr + least_recent_access_index)->dirty = 1;
    dirty_bytes_in_cache_count += (1 << b);
    }
  }
  if (op == 'L' && (line_ptr + least_recent_access_index)->dirty == 1) {
    (line_ptr + least_recent_access_index)->dirty = 0;
    dirty_bytes_evicted_count += (1 << b);
    dirty_bytes_in_cache_count -= (1 << b);
  }
  if (verbose_flag == 1) {
    printf("%c %lx,%d miss eviction\n", op, address, size);
    printf("start%lx, end%lx", (line_ptr + least_recent_access_index)->address, (line_ptr + least_recent_access_index)->address_end);
  }
  // printf("dirty bytes:%ld  dirty evicted:%ld\n", dirty_bytes_in_cache_count, dirty_bytes_evicted_count); 
  // printf("least recent %d\n", least_recent_access_index);
  return;
}

int main(int argc, char **argv) {
  int c;
  int s;
  int E;
  int b;
  char *t_flag;
  short verbose_flag = 0;

  while ((c = getopt(argc, argv, "s:E:b:t:v")) != -1) {
    switch (c) {
    case 's':
      s = atoi(optarg);
      break;
    case 'E':
      E = atoi(optarg);
      break;
    case 'b':
      b = atoi(optarg);
      break;
    case 't':
      t_flag = optarg;
      break;
    case 'v':
      verbose_flag = 1;
      break;
    default:
      printf("wrong argument\n");
      break;
    }
  }

  int t;
  t = 64 - s - b;

  // initialize the cache
  cache_line *cache = calloc(E << s, sizeof(cache_line)); // E * 2^s

  // read the trace file
  FILE *file_pointer;
  file_pointer = fopen(t_flag, "r");

  char identifier;
  unsigned long address;
  int size;

  while (fscanf(file_pointer, " %c %lx,%d", &identifier, &address, &size) > 0) {
    switch (identifier) {
    case 'L':
      load_into_cache(cache, t, s, b, E, address, size, verbose_flag, 'L');
      printf("\n");
      break;
    case 'S':
      load_into_cache(cache, t, s, b, E, address, size, verbose_flag, 'S');
      printf("\n");
      break;
    }
  }
  fclose(file_pointer);

  printSummary(hit_count, miss_count, eviction_count,
               dirty_bytes_in_cache_count, dirty_bytes_evicted_count);
  return 0;
}