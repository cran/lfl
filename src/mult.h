/*
 * File name: mult.h
 * Date:      2016/02/02 10:50
 * Author:    Michal Burda
 */


#ifndef __LFL__ALGEBRA_H__
#define __LFL__ALGEBRA_H__


#include <common.h>
#include "Rcpp.h"


RcppExport SEXP multCpp(SEXP ax, SEXP ay, SEXP af);

#endif
