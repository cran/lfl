/*
 * File name: perceiveGlobal.cpp
 * Date:      2015/01/09 10:49
 * Author:
 */


#include <common.h>
#include <algorithm>
#include <vector>
#include <list>

#include "perceiveGlobal.h"
#include "isSpecific.h"
#include "pbld/Rule.h"


using namespace Rcpp;
using namespace std;
using namespace lfl::pbld;


typedef list<Rule*> RuleList;


bool isSpecOrig(Rule* iRule, Rule* jRule, NumericVector& vars, NumericMatrix& specs) {
    for (auto jj = jRule->getAntecedent().begin(); jj != jRule->getAntecedent().end(); jj++) {
        auto ii = iRule->getAntecedent().begin();
        while (ii != iRule->getAntecedent().end()) {
            if (vars[(*jj)] == vars[(*ii)]) {
                break;
            }
            ii++;
        }
        if (ii == iRule->getAntecedent().end()) {
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
    vector<Rule*> ruleBackup(rcppRules.size());
    for (R_len_t id = 0; id < rcppRules.size(); id++) {
        NumericVector rcppRule(rcppRules[id]);
        Rule* rule = new Rule(id);

        //double d = rcppRule[0];
        //rule.setConsequent(rcpppRule[0]);

        IdSet& ante = rule->getAntecedent();
        for (int i = 1; i < rcppRule.size(); i++) {
            ante.insert(rcppRule[i]);
        }
        rules.push_front(rule);
        ruleBackup.push_back(rule);
    }

    RuleList::iterator ii = rules.begin();
    while (ii != rules.end()) {
        Rule* iRule = *(ii);
        RuleList::iterator jj = next(ii);
        bool iiIncremented = false;
        while (jj != rules.end()) {
            Rule* jRule = *(jj);
            if (isSpecOrig(iRule, jRule, rcppVars, rcppSpecs)) {
                jj = rules.erase(jj);
            } else if (isSpecOrig(jRule, iRule, rcppVars, rcppSpecs)) {
                ii = rules.erase(ii);
                iiIncremented = true;
                break;
            } else {
                jj++;
            }
        }
        if (!iiIncremented) {
            ii++;
        }
    }

    LogicalVector rcppResult(rcppRules.size(), FALSE);
    for (RuleList::iterator ii = rules.begin(); ii != rules.end(); ii++) {
        rcppResult[(*ii)->getId()] = TRUE;
    }

    for (auto ii = ruleBackup.begin(); ii != ruleBackup.end(); ii++) {
        delete (*ii);
    }

    return rcppResult;
}
