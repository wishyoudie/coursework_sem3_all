// find.c
#include "find.h"

unsigned find_order_statistic( unsigned *array, size_t array_length, unsigned k ) {
	for (size_t j = 0; j < array_length; j++) {
		for (size_t i = 1; i < array_length; i++) {
			if (array[i] < array[i - 1]) {
				const unsigned t = array[i - 1];
				array[i - 1] = array[i];
				array[i] = t;
			}
		}
	}
	
	return array[k - 1];
}