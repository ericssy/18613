/*
 * Code for basic C skills diagnostic.
 * Developed for courses 15-213/18-213/15-513 by R. E. Bryant, 2017
 * Modified to store strings, 2018
 */

/*
 * This program implements a queue supporting both FIFO and LIFO
 * operations.
 *
 * It uses a singly-linked list to represent the set of queue elements
 */

#include <stdlib.h>
#include <stdio.h>
#include <string.h>

/* #include "harness.h" */
#include "queue.h"

/*
  Create empty queue.
  Return NULL if could not allocate space.
*/
queue_t *q_new()
{
    queue_t *q =  malloc(sizeof(queue_t));
    /* What if malloc returned NULL? */
    q->head = NULL;
    q->tail = q->head;
    q->size = 0;
    return q;
}

/* Free all storage used by queue */
void q_free(queue_t *q)
{
    if (q == NULL) {
      return;
    }
    /* How about freeing the list elements and the strings? */    
    list_ele_t *ptr;
    ptr = q->head; /* ptr is a temporary pointer */
    while (q->head != NULL) {
      ptr = ptr->next;
      free(q->head->value);
      free(q->head);
      q->head = ptr;
    }
    /* Free queue structure */
    free(q);
}

/*
  Attempt to insert element at head of queue.
  Return true if successful.
  Return false if q is NULL or could not allocate space.
  Argument s points to the string to be stored.
  The function must explicitly allocate space and copy the string into it.
 */
bool q_insert_head(queue_t *q, char *s)
{
    /* What should you do if the q is NULL? */
    if (q == NULL) {
      return false;
    }
    list_ele_t *newh;
    newh = malloc(sizeof(list_ele_t));
    /* Don't forget to allocate space for the string and copy it */
    /* What if either call to malloc returns NULL? */

    /*
    char *string;
    string = malloc(sizeof(s));
    strcpy(string, s);
    newh->value = string;
    */

    newh->value = malloc(strlen(s) + 1);
    strcpy(newh->value, s);

    if (q->size == 0) {
      newh->next = q->head;
      q->head = newh;
      q->tail = newh;
      q->size++;
      return true;
    }

    newh->next = q->head;
    q->head = newh;
    q->size++;
    return true;
}


/*
  Attempt to insert element at tail of queue.
  Return true if successful.
  Return false if q is NULL or could not allocate space.
  Argument s points to the string to be stored.
  The function must explicitly allocate space and copy the string into it.
 */
bool q_insert_tail(queue_t *q, char *s)
{
    /* You need to write the complete code for this function */
    /* Remember: It should operate in O(1) time */
    if (q == NULL) {
      return false;
    }

    list_ele_t *newh;
    newh = malloc(sizeof(list_ele_t));

    /*
    char *string;
    string = malloc(sizeof(s));
    strcpy(string, s);
    newh->value = string;
    */
    newh->value = malloc(strlen(s) + 1);
    strcpy(newh->value, s);

    if (q->size == 0) {
      q->head = newh;
      q->tail = newh;
      newh->next = NULL;
      q->size++;
      return true;
    }
    q->tail->next = newh;
    q->tail = newh;
    newh->next = NULL;
    q->size++;
    return true;
}

/*
  Attempt to remove element from head of queue.
  Return true if successful.
  Return false if queue is NULL or empty.
  If sp is non-NULL and an element is removed, copy the removed string to *sp
  (up to a maximum of bufsize-1 characters, plus a null terminator.)
  The space used by the list element and the string should be freed.
*/
bool q_remove_head(queue_t *q, char *sp, size_t bufsize)
{
    /* You need to fix up this code. */
    if (q == NULL || q->head == NULL) {
      return false;
    }

    list_ele_t *removed;
    removed = q->head;
    q->head = q->head->next;
    q->size --;
    if (sp != NULL) {
      //sp = (char *)malloc(bufsize);
      strncpy(sp, removed->value, bufsize - 1);
      *(sp + bufsize - 1) = '\0';
      // printf("%s\n", "test");
      // for (int i = 0; i < bufsize; i++) {
      //   printf("%c\n", sp[i]);
      // }
      
    //   int i;
    //   for (i = 0; i < bufsize; i++) {
    //     if (*(removed->value + i) == '\0') {
    //       *(sp + i) = '\0';
    //     } else {
    //       *(sp + i) = *(removed->value + i);
    //     }
    //   }
    }

    free(removed->value);
    free(removed);
    return true;
}

/*
  Return number of elements in queue.
  Return 0 if q is NULL or empty
 */
int q_size(queue_t *q)
{
    /* You need to write the code for this function */
    /* Remember: It should operate in O(1) time */
    if (q == NULL) {
      return 0;
    }
    return q->size;
}

/*
  Reverse elements in queue
  No effect if q is NULL or empty
  This function should not allocate or free any list elements
  (e.g., by calling q_insert_head, q_insert_tail, or q_remove_head).
  It should rearrange the existing ones.
 */
void q_reverse(queue_t *q)
{
    /* You need to write the code for this function */
    if (q != NULL && q->head != NULL) {
      /* do nothing when the size of queue is 1 */
      if (q->size > 1) {
        list_ele_t *prev = q->head;
        list_ele_t *current = prev->next;
        list_ele_t *next;
        prev->next = NULL;
        q->tail = prev;
        while (current != NULL) {
          next = current->next;
          current->next = prev;
          prev = current;
          current = next;
        }
        q->head = prev;
      }
    }
}
