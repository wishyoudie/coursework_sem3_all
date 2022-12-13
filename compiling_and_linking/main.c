// main.c
#include <stdio.h>
#include "find.h"

void test( unsigned *array, size_t array_length, unsigned k ) {
	printf("%d-th order statistic of { ", k);
	for (size_t i = 0; i < array_length; i++) {
		printf("%d ", array[i]);
	}
	printf("} is %d\n", find_order_statistic(array, array_length, k));
}

int main( void ) {
	unsigned array[] = {4, 3, 5, 7, 2, 8};
	unsigned array_s[] = {11, 7, -4, 0};
	const unsigned array_length = sizeof(array) / sizeof(array[0]);
	const unsigned array_length_s = sizeof(array_s) / sizeof(array_s[0]);

    test(array, array_length, /*k*/3);
    test(array_s, array_length_s, /*k*/1);
    return 0;
}