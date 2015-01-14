/*
 * File name: LukasFloatFuzzyChain.h
 * Date:      2014/01/24 10:25
 * Author:    
 */

#ifndef __LUKASFLOATFUZZYCHAIN_H__
#define __LUKASFLOATFUZZYCHAIN_H__


#include <common.h>
#include <algorithm>
#include "AbstractFloatFuzzyChain.h"


class LukasFloatFuzzyChain : public AbstractFloatFuzzyChain {
    public:
        LukasFloatFuzzyChain(size_t size) : AbstractFloatFuzzyChain(size) { }

        virtual void conjunctWith(AbstractFuzzyChain* ch) {
            LukasFloatFuzzyChain* other = (LukasFloatFuzzyChain*) ch;
            for (size_t i = 0; i < m_size; i++) {
                m_chain[i] = std::max(0.0f, m_chain[i] + other->m_chain[i] - 1.0f);
            }
        }

        virtual AbstractFuzzyChain* copy() {
            LukasFloatFuzzyChain* instance = new LukasFloatFuzzyChain(m_size);
            memcpy(instance->m_chain, m_chain, m_size * sizeof(*m_chain));
            return instance;
        }
};

#endif
