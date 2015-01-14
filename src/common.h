/*
 * File name: common.h
 * Date:      2013/09/09 13:16
 */

#ifndef __COMMON_H__
#define __COMMON_H__

// coment to switch off assertions:
//#undef NDEBUG

#include <assert.h>
#include <iostream>



enum { nullId = -1 };


#define printVector(x) { \
    for (auto v : x) { \
        std::cout << " " << v; \
    } \
}

#endif
