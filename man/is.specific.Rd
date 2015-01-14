\name{is.specific}
\alias{is.specific}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Determine whether the first set of predicates is more specific (or equal) than the other.}
\description{
    Take two character vectors of predicates and determine whether \code{x} is more specific (or
    equal w.r.t. the specificity) than \code{y}. The specificity relation is fully determined with
    the values of \code{\link{vars}} vector and \code{\link{specs}} incidence matrix.
}
\usage{
is.specific(x, y, vars, specs)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
    \item{x}{
        The first character vector of predicates.
    }
    \item{y}{
        The second character vector of predicates.
    }
    \item{vars}{
        A named (typically character) vector that determines which predicates originate from the
        same variable, i.e. which of them semantically deal with the same property.
        For that purpose, each value of \code{x} or \code{y} must be present
        in \code{names(vars)}.
        See also \code{\link{vars}} function of the \code{\link{fsets}} class.
    }
    \item{specs}{
        A square numeric matrix containing values from \eqn{\{0, 1\}}. It is a specificity matrix
        for which rows and columns represent predicates.
        \code{specs[i][j] = 1} if and only if the \eqn{i}-th predicate is more specific (i.e. the
        corresponding fuzzy set is a subset of) than the \eqn{j}-th predicate (i.e. \code{x[, j]}).
        See also \code{\link{specs}} function of the \code{\link{fsets}} class.
    }
}
\details{
    Let \eqn{x_i}, \eqn{y_j} represent any predicate of the vectors \code{x}, \code{y}.
    Function assumes that each vector \code{x} and \code{y} does not contain two or more predicates
    with the same value of \code{vars}.

    This function returns TRUE iff all of the following conditions hold:
    \itemize{
        \item{}{
            for any \eqn{y_j} there exists \eqn{x_i} such that \eqn{vars[y_j] = vars[x_i]};
        }
        \item{}{
            for any \eqn{x_i} there either does not exist \eqn{y_j} such that \eqn{vars[x_i] = vars[y_j]}
            or \eqn{x_i = y_j} or \eqn{specs[x_i, y_j] = 1}.
        }
    }
    \code{x}
}
\value{
    TRUE or FALSE (see above).
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
    \code{\link{perceive}},
    \code{\link{pbld}},
    \code{\link{vars}},
    \code{\link{specs}}
}
\examples{
    # create vars (v) and specs (s)
    v <- c(rep('a', 3), rep('b', 3), rep('c', 3), rep('d', 3))
    names(v) <- paste(rep(c('VeSm', 'Sm', 'Bi'), times=4),
                      rep(c('a', 'b', 'c', 'd'), each=3),
                      sep='.')

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

    # returns TRUE
    is.specific(c('VeSm.a', 'Bi.c'), 
                c('VeSm.a', 'Bi.c'),
                v, s)

    # returns TRUE (x and y swapped return FALSE)
    is.specific(c('VeSm.a', 'Bi.c', 'Sm.d'),
                c('Sm.a', 'Bi.c', 'Sm.d'),
                v, s)

    # returns TRUE (x and y swapped return FALSE)
    is.specific(c('VeSm.a', 'Bi.c', 'Sm.d'),
                c('VeSm.a', 'Bi.c'),
                v, s)

    # returns TRUE (x and y swapped return FALSE)
    is.specific(c('VeSm.a', 'Bi.c', 'Sm.d'),
                NULL,
                v, s)

    # returns FALSE
    is.specific(c('Sm.a'), c('Bi.c'), v, s)

    # returns FALSE
    is.specific(c('VeSm.a', 'Sm.c'),
                c('Sm.a', 'Bi.c'),
                v, s)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ models }
\keyword{ robust }
