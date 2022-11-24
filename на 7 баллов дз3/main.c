#include <stdio.h>
#include <string.h>
double Task(int x);
int main(int argc, char *argv[])
{
    // Result
    float result;
    // Input param.
    int x;
    // Input
    if(argc == 1 || strcmp(argv[1], "1") == 0){
        scanf("%d",&x);
    } else if(strcmp(argv[1], "2") == 0){
        FILE *fread = fopen(argv[2], "r");
        if(fread == NULL){
            printf("File doesn't exist.");
            return 0;
        } else{
            fscanf(fread,"%d",&x);
        }
        fclose(fread);
    }
    if(x > 100 || x <= 0){
        printf("X must be >0 && <=100");
        return 0;
    }
    result = Task(x);

    //вывод
    printf("Result = %lf",result);
    if(argc > 1 && strcmp(argv[1], "2") == 0){
        FILE *fwrite = fopen(argv[3], "w");
        if(fwrite == NULL){
            printf("File doesn't exist.");
            return 1;
        }
        else{
            fprintf(fwrite, "%lf\n", result);
        }
        fclose(fwrite);
    }
    return 0;
}
