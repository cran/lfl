/*
 * File name: AbstractFuzzyChain.h
 * Date:      2013/05/29 13:19
 * Author:    Michal Burda
 */

#ifndef __ABSTRACTFUZZYCHAIN_H__
#define __ABSTRACTFUZZYCHAIN_H__


#include <common.h>
#include <cstring>


/**
 * Top-level abstraction of a fuzzy chain, i.e. a chain of membership degrees. 
 * Each chain represents a single fuzzy attribute, i-th value of the chain
 * corresponds to an i-th object's membership degree to the give fuzzy attribute.
 */
class AbstractFuzzyChain {
    public:
        AbstractFuzzyChain() { }
        virtual ~AbstractFuzzyChain() { }

        virtual size_t size() = 0;
        virtual void set(size_t position, float value) = 0;
        virtual float get(size_t position) = 0;
        virtual void conjunctWith(AbstractFuzzyChain* ch) = 0;
        virtual float sum() = 0;
        virtual AbstractFuzzyChain* copy() = 0;
};


#endif
