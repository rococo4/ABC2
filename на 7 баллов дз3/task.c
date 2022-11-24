#include <math.h>
double Task(int x) {
    // Result of row
    double result = 1;
    // next element of the row
    double temp = 1;
    for (int i = 1; i < 100; i++) {
        // difference between next and previous elements of the row
        double difference = ( (x * 1.0) / i);
        temp *= difference;
        if (i % 2 == 0) {
        	result += temp;
        } else {
        	result -= temp;
        }
    }
    return result;
}
