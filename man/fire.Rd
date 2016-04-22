\name{fire}
\alias{fire}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Compute truth-degrees of rules on data}
\description{
    Given data in the form of membership degrees to fuzzy sets, compute the truth value of given
    list of rules.
}
\usage{
fire(x,
     rules,
     tnorm=c("goedel", "goguen", "lukasiewicz"),
     onlyAnte=TRUE,
     parallel=FALSE)
}
\arguments{
    \item{x}{
        Data for the rules to be evaluated on. Could be either a numeric matrix or numeric vector.
        If matrix is given then the rules are evaluated on rows. Each value of the vector or column
        of the matrix represents a predicate - it's numeric value represents the truth values
        (values in the interval [0, 1]).
    }
    \item{rules}{
        Either an object of class "farules" or list of character vectors where each vector is a rule
        with consequent being the first element of the vector. Elements of the vectors (predicate
        names) must correspond to the \code{x}'s names (of columns if \code{x} is a matrix).
    }
    \item{tnorm}{
        A character string representing a triangular norm to be used (either \code{"goedel"},
        \code{"goguen"}, or \code{"lukasiewicz"}) or an arbitrary function that takes a vector 
        of truth values and returns a t-norm computed of them.
    }
    \item{onlyAnte}{
        TRUE if only antecedent-part of a rule should be evaluated. Antecedent-part of a rule are
        all predicates in rule vector starting from the 2nd position. (First element of a rule is
        the consequent - see above.)

        If FALSE, then the whole rule will be evaluated (antecedent part together with consequent).
    }
    \item{parallel}{
        Whether the processing should be run in parallel or not. Parallelization is
        implemented using the \code{\link[foreach]{foreach}} package. The parallel environment must be
        set properly in advance, e.g. with the \code{\link[doMC]{registerDoMC}} function.
    }
}
\details{
    The aim of this function is to compute the truth value of each rule in a list on given data.
    Each rule in the \code{rules} list is represented as a character vector of predicates with 
    the first element being considered as a rule's consequent.

    \code{x} is data either in a form of a numeric vector or numeric matrix. If vector is given
    then \code{names(x)} must correspond to the predicate names in \code{rules}. If \code{x} is a
    matrix then each column represents a predicate and thus \code{colnames(x)} must correspond to
    the predicate names in \code{rules}.
    
    Values of either an input vector or matrix are interpreted as truth values. If matrix is given,
    the resulting truth values are computed row-wisely.

    The type of conjunction to be used can be specified with the \code{tnorm} argument.
}
\value{
    If \code{x} is a vector then the result of this function is a list with a truth value of each rule.
    If \code{x} is a matrix, then a list of vectors of truth values is returned with truth values of
    the rules being computed row-wisely.
}
%\references{
%}
\author{
    Michal Burda
}
%\note{
%%  ~~further notes~~
%}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
  \code{\link{aggregate}},
  \code{\link{defuzz}}
  \code{\link{perceive}},
  \code{\link{pbld}},
  \code{\link{fcut}},
  \code{\link{lcut}},
  \code{\link{farules}}
}

\examples{
# fire whole rules on a vector
x <- 1:10 / 10
names(x) <- letters[1:10]
rules <- list(c('a', 'c', 'e'),
              c('b'),
              c('d', 'a'),
              c('c', 'a', 'b'))
fire(x, rules, tnorm='goguen')

# fire antecedents of the rules on a matrix
x <- matrix(1:20 / 20, nrow=2)
colnames(x) <- letters[1:10]
rules <- list(c('a', 'c', 'e'),
              c('b'),
              c('d', 'a'),
              c('c', 'a', 'b'))
fire(x, rules, tnorm='goedel', onlyAnte=TRUE)

# the former command should be equal to
fire(x, antecedents(rules), tnorm='goedel')
}

% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ models }
\keyword{ robust }
\keyword{ multivariate }
