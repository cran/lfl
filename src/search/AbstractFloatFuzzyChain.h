/*
 * File name: AbstractFloatFuzzyChain.h
 * Date:      2014/01/24 10:19
 * Author:    
 */

#ifndef __ABSTRACTFLOATFUZZYCHAIN_H__
#define __ABSTRACTFLOATFUZZYCHAIN_H__


#include <common.h>
#include "AbstractFuzzyChain.h"


/**
 * This is an abstract class of a naive implementation of fuzzy chains that use
 * an array of floats to implement chains of membership degrees.
 */
class AbstractFloatFuzzyChain : public AbstractFuzzyChain {
    protected:
        size_t m_size;
        float* m_chain;

    public:
        AbstractFloatFuzzyChain(size_t size) : AbstractFuzzyChain() {
            m_size = size;
            m_chain = new float[size]();
        }

        virtual ~AbstractFloatFuzzyChain() {
            delete[] m_chain;
        }

        virtual size_t size() {
            return m_size;
        }

        virtual void set(size_t position, float value) {
            if (value > 1.0)
                value = 1.0;
            if (value < 0.0)
                value = 0.0;

            m_chain[position] = value;
        }

        virtual float get(size_t position) {
            return m_chain[position];
        }

        virtual float sum() {
            float sum = 0;
            for (size_t i = 0; i < m_size; i++) {
            sum += m_chain[i];
            }
            return sum;
        }
};

#endif
