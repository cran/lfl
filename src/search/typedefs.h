/*
 * File name: typedefs.h
 * Date:      2014/01/28 08:37
 * Author:    Michal Burda
 */

#ifndef __TYPEDEFS_H__
#define __TYPEDEFS_H__


#include <common.h>

#include <set>
#include <vector>


typedef unsigned int IdType;

typedef std::vector<IdType> IdVector;
typedef std::set<IdType> IdSet;
typedef std::vector<double> DblVector;
typedef std::vector<std::vector<double> > Matrix;


inline std::ostream& operator<< (std::ostream& stream, const IdVector& obj) {
    bool first = true;
    for (IdVector::const_iterator it = obj.begin(); it != obj.end(); it++) {
        if (first) {
            first = false;
        }
        else {
            stream << " & ";
        }
        stream << *it;
    }
    return stream;
}

inline std::ostream& operator<< (std::ostream& stream, const IdSet& obj) {
    bool first = true;
    for (IdSet::const_iterator it = obj.begin(); it != obj.end(); it++) {
        if (first) {
            first = false;
        }
        else {
            stream << " & ";
        }
        stream << *it;
    }
    return stream;
}

#endif
