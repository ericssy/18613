#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#include "queue.h"


int main(void) {

    queue_t *q = q_new();
    printf("%d\n", q->size);
    char *e1 = "dolphin";
    char *e2 = "bear";
    char *e3 = "gerbil";
    char *e4 = "meerkat";
    q_insert_head(q, e1);
    q_insert_head(q, e2);
    q_insert_head(q, e3);
    q_insert_tail(q, e4);

    printf("%d\n", q->size);
    printf("%d\n", 1000);

    q_reverse(q);
    char *sp = "meerkat";
    q_remove_head(q, sp, strlen(sp) + 1);
    printf("%s\n", sp);
    /*printf("%s\n", q->head->value);*/

    
    list_ele_t *ptr;
    ptr = q->head; 
    printf("%s\n", "queue");
    while (ptr != NULL) {
        printf("%s\n", ptr->value);
        ptr = ptr->next;
    }
    
    q_free(q);
    return 0;
}