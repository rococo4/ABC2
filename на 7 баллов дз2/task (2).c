#include <stdio.h>
#include <stdlib.h>
#include <string.h>
int Task(int N, int* s, int count) {
	// iterator.
    int i;
    // counter of letters. 
    int count1 = 1;
    for (i = count - 1; i > 0; i--) {
        if (s[i] > s[i - 1]) {
            count1++;
            if (count1 == N) {
                return i - 1;
            }
        } else {
            count1 = 1;
        }
    }
    return -1;
}
