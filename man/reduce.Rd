\name{reduce}
\alias{reduce}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Reduce the size of rule base}
\description{
    From given rule base, select such set of rules that influence mostly the rule base coverage of
    the input data.
}
\usage{
reduce(x, rules, ratio, parallel=FALSE)
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
    \item{ratio}{
        A percentage of rule base coverage that must be preserved. It must be a value within the
        \eqn{[0, 1]} interval. Value of 1 means that the rule base coverage of the result must be
        the same as coverage of input \code{rules}. A sensible value is e.g. 0.9.
    }
    \item{parallel}{
        Whether the processing should be run in parallel or not. Parallelization is
        implemented using the \code{\link[foreach]{foreach}} package. The parallel environment must be
        set properly in advance, e.g. with the \code{\link[doMC]{registerDoMC}} function.
    }
}
\details{
    From a given rulebase, a rule with greatest coverage is selected. After that, additional rules
    are selected that increase the rule base coverage the most. Addition stops after the coverage
    exceeds \eqn{original coverage * ratio}.

    Note that the size of the resulting rule base is not necessarily minimal because the algorithm
    does not search all possible combination of rules. It only finds a local minimum of rule base
    size.
}
\value{
    Function returns an instance of class \code{\link{farules}} or a list depending on the type of
    the \code{rules} argument.
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
  \code{\link{rbcoverage}},
  \code{\link{farules}}
}

%\examples{
%}

% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ models }
\keyword{ robust }
\keyword{ multivariate }
