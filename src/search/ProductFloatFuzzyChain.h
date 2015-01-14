/*
 * File name: ProductFloatFuzzyChain.h
 * Date:      2014/01/24 10:25
 * Author:    
 */

#ifndef __PRODUCTFLOATFUZZYCHAIN_H__
#define __PRODUCTFLOATFUZZYCHAIN_H__


#include <common.h>
#include <algorithm>
#include "AbstractFloatFuzzyChain.h"


class ProductFloatFuzzyChain : public AbstractFloatFuzzyChain {
    public:
        ProductFloatFuzzyChain(size_t size) : AbstractFloatFuzzyChain(size) { }

        virtual void conjunctWith(AbstractFuzzyChain* ch) {
            ProductFloatFuzzyChain* other = (ProductFloatFuzzyChain*) ch;
            for (size_t i = 0; i < m_size; i++) {
                m_chain[i] = m_chain[i] * other->m_chain[i];
            }
        }

        virtual AbstractFuzzyChain* copy() {
            ProductFloatFuzzyChain* instance = new ProductFloatFuzzyChain(m_size);
            memcpy(instance->m_chain, m_chain, m_size * sizeof(*m_chain));
            return instance;
        }
};

#endif
