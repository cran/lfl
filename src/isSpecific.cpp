/*
 * File name: perceiveGlobal.cpp
 * Date:      2015/01/09 10:49
 * Author:
 */


#include <common.h>
#include <algorithm>
#include <forward_list>

#include "isSpecific.h"
#include "pbld/Rule.h"


using namespace Rcpp;
using namespace std;
using namespace lfl::pbld;


bool isSpec(Rule& iRule, Rule& jRule, NumericVector& vars, NumericMatrix& specs) {
    //if (iRule.getConsequent() != jRule.getConsequent()) {
        //return FALSE;
    //}
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


RcppExport SEXP isSpecific(SEXP aConfig) {
    List config(aConfig);

    NumericVector rcppX = config["x"];
    NumericVector rcppY = config["y"];
    NumericVector rcppVars = config["vars"];
    NumericMatrix rcppSpecs = config["specs"];

    Rule ruleX(1);
    {
        //ruleX.setConsequent(rcppX[0]);
        IdSet& ante = ruleX.getAntecedent();
        for (int i = 0; i < rcppX.size(); i++) {
            ante.insert(rcppX[i]);
        }
    }

    Rule ruleY(2);
    {
        //ruleY.setConsequent(rcppY[0]);
        IdSet& ante = ruleY.getAntecedent();
        for (int i = 0; i < rcppY.size(); i++) {
            ante.insert(rcppY[i]);
        }
    }

    LogicalVector rcppResult(1, isSpec(ruleX, ruleY, rcppVars, rcppSpecs));
    return rcppResult;
}
