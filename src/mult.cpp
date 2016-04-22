/*
 * File name: mult.cpp
 * Date:      2016/02/02 10:49
 * Author:    Michal Burda
 */


#include "algebra.h"
#include <common.h>


using namespace Rcpp;
using namespace std;


RcppExport SEXP mult(SEXP ax, SEXP ay, SEXP af) 
{
LFL_BEGIN_TRYCATCH
    NumericMatrix x = ax;
    NumericMatrix y = ay;
    Function f = af;
    NumericMatrix res(x.nrow(), y.ncol());
    for (int i = 0; i < x.nrow(); ++i) {
        for (int j = 0; j < y.ncol(); ++j) {
            NumericVector vec = f(x(i, _), y(_, j));
            if (vec.size() <= 0) {
                stop("Callback function returned empty vector");
            }
            res(i, j) = vec[0];
        }
    }
    return res;
LFL_END_TRYCATCH
}

