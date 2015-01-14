\name{perceive}
\alias{perceive}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{From a set of rules, remove each rule for which another rule exists that is more specific.}
\description{
    Examine rules in a list and remove all of them for whose other more specific rules are present
    in the list. The specificity is determined by calling the \code{\link{is.specific}} function.
    This operation is a part of the \code{\link{pbld}} inference mechanism.
}
\usage{
perceive(rules, 
         vars,
         specs,
         type=c('global', 'local'),
         fired=NULL)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
    \item{rules}{
        A list of character vectors where each element is a fuzzy set name (a predicate)
        and thus each such vector forms a rule.
    }
    \item{vars}{
        A named (typically character) vector that determines which predicates originate from the
        same variable, i.e. which of them semantically deal with the same property.
        For that purpose, each value from any vector stored in the \code{rules} list must be present
        in \code{names(vars)}.
        See also \code{\link{vars}} function of the \code{\link{fsets}} class.
    }
    \item{specs}{
        A square numeric matrix containing values from \eqn{\{0, 1\}}. It is a specificity matrix
        for which each row and column corresponds to an \code{rules}'es predicate 
        \code{specs[i][j] = 1} if and only if the \eqn{i}-th predicate is more specific (i.e. the
        corresponding fuzzy set is a subset of) than the \eqn{j}-th predicate (i.e. \code{x[, j]}).
        See also \code{\link{specs}} function of the \code{\link{fsets}} class.
    }
    \item{type}{
        The type of perception to use. It can be either \code{"local"} or \code{"global"} (default).
    }
    \item{fired}{
        If \code{type=="global"} then this argument can be NULL. If \code{type} is \code{"local"}
        then \code{fired} must be a numeric vector of values in the interval \eqn{[0,1]}
        indicating the truth values of all rules, i.e. the length of the vector must be equal to the
        number of rules in the \code{rules} argument.
    }
}
\details{
    For each rule \code{x} in the \code{rules} list, the function searches for another rule \code{y}
    such that \code{is.specific(y, x)} returns TRUE. If yes then \code{x} is removed from the list.
}
\value{
    A modified list of rules for which no other more specific rule exists. (Each rule is a vector.)
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
    \code{\link{is.specific}},
    \code{\link{fsets}},
    \code{\link{fcut}},
    \code{\link{lcut}}
}
\examples{
# prepare vars
v <- c(rep('a', 3),
       rep('b', 3),
       rep('c', 3),
       rep('d', 3))
names(v) <- paste(rep(c('VeSm', 'Sm', 'Bi'), times=4),
                  rep(c('a', 'b', 'c', 'd'), each=3),
                  sep='.')
print(v)

# prepare specs
s <- matrix(c(0,1,0, 0,0,0, 0,0,0, 0,0,0,
              0,0,0, 0,0,0, 0,0,0, 0,0,0,
              0,0,0, 0,0,0, 0,0,0, 0,0,0,

              0,0,0, 0,1,0, 0,0,0, 0,0,0,
              0,0,0, 0,0,0, 0,0,0, 0,0,0,
              0,0,0, 0,0,0, 0,0,0, 0,0,0,

              0,0,0, 0,0,0, 0,1,0, 0,0,0,
              0,0,0, 0,0,0, 0,0,0, 0,0,0,
              0,0,0, 0,0,0, 0,0,0, 0,0,0,

              0,0,0, 0,0,0, 0,0,0, 0,1,0,
              0,0,0, 0,0,0, 0,0,0, 0,0,0,
              0,0,0, 0,0,0, 0,0,0, 0,0,0),
          byrow=TRUE,
          ncol=12)
colnames(s) = names(v)
rownames(s) = names(v)
print(s)

# run perceive function: (Sm.a, Bi.c) has
# more specific rule (VeSm.a, Bi.c)
perceive(list(c('Sm.a', 'Bi.c'), 
              c('VeSm.a', 'Bi.c'),
              c('Sm.b', 'Sm.d')),
         v, s)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ models }
\keyword{ robust }
