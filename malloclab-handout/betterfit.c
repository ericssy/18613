static block_t *find_better_fit_target(block_t * root, size_t size)
{
    block_t *current = find_next_free(root);
    while (current != root && get_size(current) <= size)
    {
        current = find_next_free(current);
    }

    return find_prev_free(current);
}