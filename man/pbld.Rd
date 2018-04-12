\name{pbld}
\alias{pbld}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Perform a Perception-based Logical Deduction (PbLD) with given rule-base on given dataset}
\description{
    Take a set of rules (a rule-base) and perform a Perception-based Logical Deduction (PbLD) on
    each row of a given \code{\link{fsets}} object.
}
\usage{
pbld(x,
     rules,
     partition,
     values,
     type=c('global', 'local'),
     parallel=FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
    \item{x}{
        Input to the inference. It should be
        an object of class \code{\link{fsets}} (e.g. created by using the \code{\link{fcut}} or
        \code{\link{lcut}} functions). It is basically a matrix with columns representing fuzzy
        sets.

        Each row represents a single case of inference. Columns should be named after predicates in
        rules' antecedents.
    }
    \item{rules}{
        A rule-base (a.k.a. linguistic description) either in the form
        of the \code{\link{farules}} object or as a list of character vectors
        where each element is a fuzzy set name (a predicate) and thus each such vector forms a rule.
    }
    \item{partition}{
        A \code{\link{fsets}} object with columns that are consequents in
        \code{rules}. These membership degrees must correspond to \code{values}.
    }
    \item{values}{
        Crisp values that correspond to rows of memberhsip degrees in the \code{partition} matrix.
        Function assumes that the values are sorted in the ascending order.
    }
    \item{type}{
        The type of inference to use. It can be either \code{"local"} or \code{"global"} (default).
    }
    \item{parallel}{
        Whether the processing should be run in parallel or not. Parallelization is
        implemented using the \code{\link[foreach]{foreach}} package. The parallel environment must be
        set properly in advance, e.g. with the \code{registerDoMC()} function of the \code{doMC} package.
    }
}

\details{
    Perform a Perception-based Logical Deduction (PbLD) with given rule-base \code{rules} on each
    row of input \code{x}. Columns of \code{x} are truth values of predicates that appear in the
    antecedent part of \code{rules}, \code{partition} together with \code{values} determine the
    shape of predicates in consequents: each element in \code{values} corresponds to a row of
    membership degrees in \code{partition}.
}
\value{
    A vector of inferred defuzzified values. The number of resulting values corresponds to the
    number of rows of the \code{x} argument.
}
\references{
    A. Dvořák, M. Štěpnička, On perception-based logical deduction and its
    variants, in: Proc. 16th World Congress of the International Fuzzy Systems
    Association and 9th Conference of the European Society for Fuzzy
    Logic and Technology (IFSA-EUSFLAT 2015), Advances in Intelligent
    Systems Research, Atlantic Press, Gijon, 2015.
}
\author{
    Michal Burda
}
%\note{
%%  ~~further notes~~
%}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
  \code{\link{lcut}},
  \code{\link{searchrules}},
  \code{\link{slices}},
  \code{\link{fire}},
  \code{\link{aggregateConsequents}},
  \code{\link{defuzz}}
}
\examples{
# custom context of the RHS variable
uptakeContext <- c(7, 28.3, 46)

# convert data into fuzzy sets
co2 <- lcut3(CO2, context=list(uptake=uptakeContext))

# split data into training and testing set
testing <- sel(co2, 1:5)
training <- sel(co2, -1 * 1:5)

# search for rules
r <- searchrules(training, lhs=1:38, rhs=39:58)

# prepare values and partition
v <- slices(uptakeContext[1], uptakeContext[3], 1000)
p <- lcut3(v, name='uptake', context=uptakeContext)

# do the inference
pbld(testing, r, p, v)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ models }
\keyword{ robust }
