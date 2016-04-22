\name{compose}
\alias{compose}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Composition of Fuzzy Relations}
\description{
    Composition of Fuzzy Relations
}
\usage{
compose(x,
        y,
        e=NULL,
        alg=c('goedel', 'goguen', 'lukasiewicz'),
        type=c('basic', 'sub', 'super', 'square'),
        quantifier=NULL)
}
\arguments{
    \item{x}{
        A first fuzzy relation to be composed. It must be a numeric matrix with values within the
        \eqn{[0,1]} interval. The number of columns must match with the number of rows of the
        \code{y} matrix.
    }
    \item{y}{
        A second fuzzy relation to be composed. It must be a numeric matrix with values within the
        \eqn{[0,1]} interval. The number of columns must match with the number of rows of the
        \code{x} matrix.
    }
    \item{e}{
        An excluding fuzzy relation. (EXPERIMENTAL FEATURE!)
        If not NULL, it must be a numeric matrix with dimensions equal to the \code{y} matrix.
    }
    \item{alg}{
        An algebra to be used for composition. It must be one of \code{'goedel'} (default),
        \code{'goguen'}, or \code{'lukasiewicz'}.
    }
    \item{type}{
        A type of a composition to be performed. It must be one of \code{'basic'} (default),
        \code{'sub'}, \code{'super'}, or \code{'square'}.
    }
    \item{quantifier}{
        If not NULL, it must be a function taking a single argument, a vector of relative
        cardinalities, that would be translated into membership degrees.
    }
}
\details{
    Function composes a fuzzy relation \code{x} (i.e. a numeric matrix of size \eqn{(u,v)})
    with a fuzzy relation \code{y} (i.e. a numeric matrix of size \eqn{(v,w)}) and possibly with the
    use of an exclusion fuzzy relation \code{e} (i.e. a numeric matrix of size \eqn{(v,w)}).

    The style of composition is determined by the algebra \code{alg}, the composition type
    \code{type}, and possibly also by a \code{quantifier}.
}
\value{
    A matrix with \eqn{v} rows and \eqn{w} columns, where \eqn{v} is the number of rows of \code{x}
    and \eqn{w} is the number of columns of \code{y}.
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
  \code{\link{algebra}},
  \code{\link{mult}}
}

\examples{
    R <- matrix(c(0.1, 0.6, 1, 0, 0, 0,
                  0, 0.3, 0.7, 0.9, 1, 1,
                  0, 0, 0.6, 0.8, 1, 0,
                  0, 1, 0.5, 0, 0, 0,
                  0, 0, 1, 1, 0, 0), byrow=TRUE, nrow=5)

    S <- matrix(c(0.9, 1, 0.9, 1,
                  1, 1, 1, 1,
                  0.1, 0.2, 0, 0.2,
                  0, 0, 0, 0,
                  0.7, 0.6, 0.5, 0.4,
                  1, 0.9, 0.7, 0.6), byrow=TRUE, nrow=6)

    RS <- matrix(c(0.6, 0.6, 0.6, 0.6,
                   1, 0.9, 0.7, 0.6,
                   0.7, 0.6, 0.5, 0.4,
                   1, 1, 1, 1,
                   0.1, 0.2, 0, 0.2), byrow=TRUE, nrow=5)

    compose(R, S, alg='goedel', type='basic') # should equal to RS
}

% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ models }
\keyword{ robust }
\keyword{ multivariate }
