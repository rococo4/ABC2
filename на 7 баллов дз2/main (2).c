#include <stdio.h>
#include <stdlib.h>
#include <string.h>
int Task(int N,int* s, int count);
int main(int argc, char *argv[]) {
	// input string.
    int in[400];
    // count of letters.
    int N;
    // code of char.
    int ch;
    //result from Task.
    int res;
    // iterator.
    int i = 0;
    if (argc >= 2) {
        N = atoi(argv[1]);
        FILE *input = fopen(argv[2], "r");
        do {
            ch = fgetc(input);
            in[i++] = ch;
        } while(ch != -1 && i < 100);
        fclose(input);
        res = Task(N, in, i);
        FILE *output = fopen(argv[3], "w");
        if (res == -1) {
        	fprintf(output, "%s ", "No such subsequence");
        } else {
            for (i = res; i < res + N; i++) {
                char c = in[i];
                fprintf(output,"%c", c);
            }
        }
        fclose(output);
    } else {
        i = 0;
        printf(" Enter N:");
        scanf("%d", &N);
        do {
            ch = fgetc(stdin);
            in[i++] = ch;
        } while(ch != -1 && i < 100);
        res = Task(N, in, i); //
        if (res == -1) {
            fprintf( stdout,"%s ", "No such subsequence");
        } else {
            for (i = res; i < res + N; i++) {
                char c = in[i];
                fprintf(stdout,"%c", c);
            }
        }
    }
}
