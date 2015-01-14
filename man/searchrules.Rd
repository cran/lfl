\name{searchrules}
\alias{searchrules}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Searching for fuzzy association rules}
\description{
    This function searches the given \code{\link{fsets}} object \code{d} for all fuzzy
    association rules
    that satisfy defined constraints. It returns a list of fuzzy association rules
    together with some statistics characterizing them (such as support, confidence etc.).
}
\usage{
searchrules(d,
            lhs=2:ncol(d),
            rhs=1,
            tnorm=c("minimum", "product", "lukasiewicz"),
            n=100,
            best=c("confidence"),
            minSupport=0.02,
            minConfidence=0.75,
            maxConfidence=1,
            maxLength=4,
            numThreads=1,
            trie=(maxConfidence < 1))
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{d}{An object of class \code{\link{fsets}} - it is basically a matrix where columns represent
  the fuzzy sets and values are the membership degrees. For creation of such object,
  use \code{\link{fcut}} or \code{\link{lcut}} function.
}
  \item{lhs}{Indices of fuzzy attributes that may appear on the left-hand-side (LHS) of association
  rules, i.e. in the antecedent.
}
  \item{rhs}{Indices of fuzzy attributes that may appear on the right-hand-side (RHS) of association
  rules, i.e. in the consequent.
}
  \item{tnorm}{A t-norm to be used for computation of conjunction of fuzzy attributes. (Allowed are
  even only starting letters of "lukasiewicz", "minimum" and "product").
}
  \item{n}{The non-negative number of rules to be found. If zero, the function returns all rules
  satisfying the given conditions. If positive, only \code{n} best rules are returned. The criterium
  of what is ``best'' is specified with the \code{best} argument.
}
  \item{best}{Specifies measure accordingly to which the rules are ordered from best to worst. This
  argument is used mainly in combination with the \code{n} argument. Currently, only single value
  ("confidence") can be used.
}
  \item{minSupport}{The minimum support degree of a rule. Rules with support below that number are
  filtered out. It must be a numeric value from interval [0, 1]. See below for details on how 
  the support degree is computed.
}
  \item{minConfidence}{The minimum confidence degree of a rule. Rules with confidence below that number are
  filtered out.  It must be a numeric value from interval [0, 1]. See below for details on how
  the confidence degree is computed.
}
  \item{maxConfidence}{Maximum confidence threshold. After finding a rule that has confidence degree
  above the \code{maxConfidence} threshold, no other rule is resulted based on adding some additional
  attribute to its antecedent part. I.e. if "Sm.age & Me.age => Sm.height" has confidence above
  \code{maxConfidence} threshold, no another rule containing "Sm.age & Me.age" will be produced
  regardless of its interest measures.

  If you want to disable this feature, set \code{maxConfidence} to 1.
}
  \item{maxLength}{
    Maximum allowed length of the antecedent, i.e. maximum number of predicates that are allowed on
    the left-hand side of the rule. If negative, the maximum length of rules is unlimited.
}
  \item{numThreads}{
    Number of threads used to perform the algorithm in parallel. If greater than 1, the OpenMP
    library (not to be confused with Open MPI) is used for parallelization.
    Please note that there are known problems of using OpenMP
    together with another means of parallelization that may be used within R. Therefore, if you plan
    to use the \code{searchrules} function with some of the external parallelization mechanisms such as
    library \code{doMC}, make sure that \code{numThreads} equals 1.
    This feature is available only on systems that have installed the OpenMP library.
}
  \item{trie}{
    Whether or not to use internal mechanism of Tries. If FALSE, then in the output may appear such
    rule that is a descendant of a rule that has confidence above \code{maxConfidence} threshold.

    Tries consume very much memory, so if you encounter problems with insufficient memory, set this
    argument to FALSE. On the other hand, the size of result (if \code{n} is set to 0) can be very
    high if trie is set to FALSE.
}
}
\details{
  The function searches data frame \code{d} for fuzzy association rules that satisfy conditions
  specified by the parameters.
}
\value{
  A list of the following elements: \code{rules} and \code{statistics}.

  \code{rules} is a list of mined fuzzy association rules. Each element of that list is a character
  vector with consequent attribute being on the first position.

  \code{statistics} is a data frame of statistical characteristics about mined rules. Each row
  corresponds to a rule in the \code{rules} list. Let us consider a rule "a & b => c", let
  \eqn{\otimes} 
  be a t-norm specified with the \code{tnorm} parameter and \eqn{i} goes over all rows of a data 
  table \code{d}. Then columns of the \code{statistics} data frame are as follows:

  \itemize{
    \item{support}{a rule's support degree: \eqn{1/nrow(d) * \sum_{\forall i} a(i) \otimes b(i) \otimes c(i)}}
    \item{lhsSupport}{a support of rule's antecedent (LHS): \eqn{1/nrow(d) * \sum_{\forall i} a(i) \otimes b(i)}}
    \item{rhsSupport}{a support of rule's consequent (RHS): \eqn{1/nrow(d) * \sum_{\forall i} c(i)}}
    \item{confidence}{a rule's confidence degree: \eqn{support / lhsSupport}}
  }
}
%\references{
%% ~put references to the literature/web site here ~
%}
\author{
  Michal Burda
}
%\note{
%%  ~~further notes~~
%}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
  \code{\link{fcut}},
  \code{\link{lcut}},
  \code{\link{farules}},
  \code{\link{fsets}},
  \code{\link{pbld}}
}
\examples{
  d <- lcut3(CO2)
  searchrules(d, lhs=1:ncol(d), rhs=1:ncol(d))
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ models }
\keyword{ robust }
\keyword{ multivariate }
