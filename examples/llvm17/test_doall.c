#include <stdio.h>
#include <stdlib.h>

// DOALL parallelizable loop
void vec_add(int *a, int *b, int *c, int n) {
    for (int i = 0; i < n; i++) {
        c[i] = a[i] + b[i];
    }
}

int main() {
    int n = 1000;
    int *a = (int*)malloc(n * sizeof(int));
    int *b = (int*)malloc(n * sizeof(int));
    int *c = (int*)malloc(n * sizeof(int));

    for (int i = 0; i < n; i++) {
        a[i] = i;
        b[i] = i * 2;
    }

    // This loop should be parallelized by DOALLTask
    vec_add(a, b, c, n);

    printf("Result[10]: %d\n", c[10]); // Expected: 10 + 20 = 30

    free(a);
    free(b);
    free(c);
    return 0;
}

