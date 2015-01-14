/*
 * File name: Attribute.h
 * Date:      2013/11/05 06:22
 * Author:
 */

#ifndef __ATTRIBUTE_H__
#define __ATTRIBUTE_H__


#include <common.h>
#include "AbstractFuzzyChain.h"
#include "MinFloatFuzzyChain.h"
#include "LukasFloatFuzzyChain.h"
#include "ProductFloatFuzzyChain.h"

#include <stdexcept>


class Attribute {
private:
    /** 
     * ID of the fuzzy attribute
     * */
    size_t m_id;

    /**
     * Identifier of the numeric attribute which the current
     * attribute was created from. Multiple (fuzzy) Attributes
     * may be created from a single numeric attribute -- these
     * attributes would have the same m_variable ID.
     */
    int m_variable;

    /**
     * Support of the fuzzy attribute (i.e. mean of membership degrees that are
     * stored in m_chain.
     */
    double m_support;

    /**
     * Chain of membership degrees where i-th value of the chain corresponds
     * to a membership degree of the i-th object to this attribute.
     */
    AbstractFuzzyChain* m_chain;

public:
    Attribute(size_t id, char tNorm, int variable, int nRow) :
        m_id(id),
        m_variable(variable)
    {
        if (tNorm == 'l') {
            m_chain = new LukasFloatFuzzyChain(nRow);
        } else if (tNorm == 'm') {
            m_chain = new MinFloatFuzzyChain(nRow);
        } else if (tNorm == 'p') {
            m_chain = new ProductFloatFuzzyChain(nRow);
        } else
            //TODO don't throw exception in ctor
            throw std::runtime_error("Unknown t-norm");
    }

    ~Attribute()
    { delete m_chain; }

    size_t getId() const
    { return m_id; }

    AbstractFuzzyChain* getChain()
    { return m_chain; }

    int getVariable() const
    { return m_variable; }

    double getSupport() const
    { return m_support; }

    void initialize() {
        m_support = m_chain->sum() / m_chain->size();
    }
};


typedef std::vector<Attribute *> AttributeVector;

#endif
