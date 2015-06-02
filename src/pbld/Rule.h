/*
 * File name: Rule.h
 * Date:      2015/01/12 06:17
 * Author:    
 */

#ifndef __LFL__PBLD__RULE_H__
#define __LFL__PBLD__RULE_H__


#include <common.h>
#include <set>


namespace lfl { namespace pbld {


class Rule {
protected:
    IdType m_id;

    IdType m_consequent;

    IdSet m_antecedent;


public:
    Rule(IdType id) {
        m_id = id;
    }


    IdType getId() {
        return (m_id);
    }


    IdType getConsequent() {
        return (m_consequent);
    }


    IdSet& getAntecedent() {
        return (m_antecedent);
    }


    void setConsequent(IdType conseq) {
        m_consequent = conseq;
    }
};


}}
#endif
