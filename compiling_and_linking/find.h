// find.h
#ifndef __FIND_H_
#define __FIND_H_
#include <stddef.h>
unsigned find_order_statistic( unsigned *array, size_t array_length, unsigned k );
void test( unsigned *array, size_t array_length, unsigned k );
#endif /*__FIND_H_*/