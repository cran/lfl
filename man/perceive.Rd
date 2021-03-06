% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/perceive.R
\name{perceive}
\alias{perceive}
\title{From a set of rules, remove each rule for which another rule exists that is
more specific.}
\usage{
perceive(
  rules,
  fsets,
  type = c("global", "local"),
  fired = NULL,
  vars = NULL,
  specs = NULL
)
}
\arguments{
\item{rules}{A list of character vectors where each element is a fuzzy set
name (a predicate) and thus each such vector forms a rule.}

\item{fsets}{A valid instance of the \code{\link[=fsets]{fsets()}} class such that all predicates
in \code{rules} (i.e., all values of all character vectors in \code{rules$rules})
can be found in \code{colnames(fsets)}}

\item{type}{The type of perception to use. It can be either \code{"local"}
or \code{"global"} (default).}

\item{fired}{If \code{type=="global"} then this argument can be NULL. If
\code{type} is \code{"local"} then \code{fired} must be a numeric vector of
values in the interval \eqn{[0,1]} indicating the truth values of all rules,
i.e. the length of the vector must be equal to the number of rules in the
\code{rules} argument.}

\item{vars}{A deprecated parameter that must be \code{NULL}. Formerly, it was
a named (typically character) vector that determined which
predicates originate from the same variable, i.e. which of them semantically
deal with the same property.  For that purpose, each value from any vector
stored in the \code{rules} list must be present in \code{names(vars)}.  See
also \code{\link[=vars]{vars()}} function of the \code{\link[=fsets]{fsets()}} class.}

\item{specs}{A deprecated parameter that must be \code{NULL}. Formerly, it was
a square numeric matrix containing values from \eqn{\{0, 1\}}.
It is a specificity matrix for which each row and column corresponds to an
\code{rules}'es predicate \code{specs[i][j] = 1} if and only if the
\eqn{i}-th predicate is more specific (i.e. the corresponding fuzzy set is a
subset of) than the \eqn{j}-th predicate (i.e. \code{x[, j]}).  See also
\code{\link[=specs]{specs()}} function of the \code{\link[=fsets]{fsets()}} class.}
}
\value{
A modified list of rules for which no other more specific rule
exists. (Each rule is a vector.)
}
\description{
Examine rules in a list and remove all of them for whose other more specific
rules are present in the list. The specificity is determined by calling the
\code{\link[=is.specific]{is.specific()}} function.  This operation is a part of the
\code{\link[=pbld]{pbld()}} inference mechanism.
}
\details{
In other words, for each rule \code{x} in the \code{rules} list, it searches for another
rule \code{y} such that \code{is.specific(y, x)} returns TRUE. If yes then
\code{x} is removed from the list.
}
\examples{
# prepare fsets
f <- lcut(data.frame(a=0:1, b=0:1, c=0:1, d=0:1))

# run perceive function: (sm.a, bi.c) has
# more specific rule (ve.sm.a, bi.c)
perceive(list(c('sm.a', 'bi.c'),
              c('ve.sm.a', 'bi.c'),
              c('sm.b', 'sm.d')),
         f)

}
\seealso{
\code{\link[=is.specific]{is.specific()}}, \code{\link[=fsets]{fsets()}}, \code{\link[=fcut]{fcut()}}, \code{\link[=lcut]{lcut()}}
}
\author{
Michal Burda
}
\keyword{models}
\keyword{robust}
