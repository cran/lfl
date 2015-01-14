\name{fsets}
\alias{fsets}
\alias{vars}
\alias{specs}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{A class of a table with several fuzzy sets.}
\description{
    The aim of the \code{fsets} S3 class is to store several fuzzy sets in the form of numeric
    matrix where columns represent fuzzy sets and values are membership degrees. The \code{fsets}
    class also stores the information about the origin of the fuzzy sets as well as a relation of
    specificity among them.
}
\usage{
fsets(x, vars, specs)

vars(x)

specs(x)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
    \item{x}{
        A matrix of membership degrees. Columns of the matrix represent fuzzy sets, colnames are
        names of the fuzzy sets (and must not be NULL).
    }
    \item{vars}{
        A (typically character) vector that must correspond to the columns of \code{x}. It is a
        vector of names of original variables that the fuzzy sets were created from. In other words,
        the \code{vars} vector should contain the same value for each \code{x}'s column that
        corresponds to the same variable. Moreover, the names of the \code{vars} vector must be the
        same as \code{colnames(x)}.
        
        For instance, a function \code{\link{fcut}} can transform a single numeric vector into
        several different fuzzy sets. To indicate that all of them in fact describe the same
        original variable, the same name is stored on appropriate positions of the \code{vars} vector.
    }
    \item{specs}{
        A square numeric matrix containing values from \eqn{\{0, 1\}}. It is a specificity matrix
        for which each row and column corresponds to an \code{x}'s column. \code{specs[i][j] = 1} if
        and only if the \eqn{i}-th fuzzy set (i.e. \code{x[, i]}) is more specific (i.e. is a subset
        of) than the \eqn{j}-th fuzzy set (i.e. \code{x[, j]}).
    }
}
\details{
    The \code{fsets} function is a constructor for an instance of the \code{fsets} class. Their
    \code{vars} and \code{specs} arguments are stored into attributes of the objects. The functions
    \code{vars} and \code{specs} can be used to access that objects.
}
\value{
    \code{fsets} returns an object of class \code{fsets}.

    \code{vars} returns a vector of original variable names of the \code{fsets} object 
    (see the description of the \code{vars} argument above).

    \code{specs} returns the specificity matrix of the \code{fsets} object 
    (see the description of the \code{specs} argument above).
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
    \code{\link{is.specific}}
}
\examples{
    # create a matrix of random membership degrees
    m <- matrix(runif(30), ncol=5)
    colnames(m) <- c('a1', 'a2', 'a12', 'b1', 'b2')

    # create vars - first three (a1, a2, a3) and next two (b1, b2)
    # fuzzy sets originate from the same variable
    v <- c('a', 'a', 'a', 'b', 'b')
    names(v) <- colnames(m)

    # create specificity matrix - a1 and a2 are subsets of a12,
    # the rest is incomparable
    s <- matrix(c(0, 0, 1, 0, 0,
                  0, 0, 1, 0, 0,
                  0, 0, 0, 0, 0,
                  0, 0, 0, 0, 0,
                  0, 0, 0, 0, 0), byrow=TRUE, ncol=5)
    colnames(s) <- colnames(m)
    rownames(s) <- colnames(m)

    # create a valid instance of the fsets class
    o <- fsets(m, v, s)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ models }
\keyword{ robust }
