/*
 * File name: perceiveGlobal.cpp
 * Date:      2015/01/09 10:49
 * Author:
 */


#include <common.h>
#include <algorithm>
#include <forward_list>

#include "perceiveGlobal.h"
#include "isSpecific.h"
#include "pbld/Rule.h"


using namespace Rcpp;
using namespace std;
using namespace lfl::pbld;


typedef forward_list<Rule> RuleList;


bool isSpecOrig(Rule& iRule, Rule& jRule, NumericVector& vars, NumericMatrix& specs) {
    if (iRule.getConsequent() != jRule.getConsequent()) {
        return FALSE;
    }
    for (auto jj = jRule.getAntecedent().begin(); jj != jRule.getAntecedent().end(); jj++) {
        auto ii = iRule.getAntecedent().begin();
        while (ii != iRule.getAntecedent().end()) {
            if (vars[(*jj)] == vars[(*ii)]) {
                break;
            }
            ii++;
        }
        if (ii == iRule.getAntecedent().end()) {
            return FALSE;
        }
        if ((*ii) != (*jj) && specs(*ii, *jj) == 0) {
            return FALSE;
        }
    }
    return TRUE;
}



RcppExport SEXP perceiveGlobal(SEXP aConfig) {
    List config(aConfig);

    NumericVector rcppVars = config["vars"];
    NumericMatrix rcppSpecs = config["specs"];
    List rcppRules = config["rules"];

    RuleList rules;
    for (IdType id = 0; id < rcppRules.size(); id++) {
        NumericVector rcppRule(rcppRules[id]);
        Rule rule(id);
        rule.setConsequent(rcppRule[0]);
        IdSet& ante = rule.getAntecedent();
        for (int i = 1; i < rcppRule.size(); i++) {
            ante.insert(rcppRule[i]);
        }
        rules.push_front(rule);
    }

    for (RuleList::iterator ii = rules.before_begin(); ii != rules.end() && next(ii) != rules.end(); ii++) {
        Rule& iRule = *(next(ii));
        for (RuleList::iterator jj = next(ii); jj != rules.end() && next(jj) != rules.end(); jj++) {
            Rule& jRule = *(next(jj));
            if (isSpecOrig(iRule, jRule, rcppVars, rcppSpecs)) {
                rules.erase_after(jj);
            } else if (isSpecOrig(jRule, iRule, rcppVars, rcppSpecs)) {
                rules.erase_after(ii);
                break;
            }
        }
    }

    LogicalVector rcppResult(rcppRules.size(), FALSE);
    for (RuleList::iterator ii = rules.begin(); ii != rules.end(); ii++) {
        rcppResult[ii->getId()] = TRUE;
    }
    return rcppResult;
}
