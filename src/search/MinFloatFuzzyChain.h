/*
 * File name: MinFloatFuzzyChain.h
 * Date:      2014/01/24 10:25
 * Author:    
 */

#ifndef __MINFLOATFUZZYCHAIN_H__
#define __MINFLOATFUZZYCHAIN_H__


#include <common.h>
#include <algorithm>
#include "AbstractFloatFuzzyChain.h"


class MinFloatFuzzyChain : public AbstractFloatFuzzyChain {
    public:
        MinFloatFuzzyChain(size_t size) : AbstractFloatFuzzyChain(size) { }

        virtual void conjunctWith(AbstractFuzzyChain* ch) {
            MinFloatFuzzyChain* other = (MinFloatFuzzyChain*) ch;
            for (size_t i = 0; i < m_size; i++) {
                m_chain[i] = std::min(m_chain[i], other->m_chain[i]);
            }
        }

        virtual AbstractFuzzyChain* copy() {
            MinFloatFuzzyChain* instance = new MinFloatFuzzyChain(m_size);
            memcpy(instance->m_chain, m_chain, m_size * sizeof(*m_chain));
            return instance;
        }
};

#endif
