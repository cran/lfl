\name{tnorm}
\alias{minnorm}
\alias{luknorm}
\alias{prodnorm}
\alias{pminnorm}
\alias{pluknorm}
\alias{pprodnorm}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Triangular norm}
\description{
    Compute triangular norm (t-norm) from the whole argument, or element-wise.
}
\usage{
minnorm(...)
luknorm(...)
prodnorm(...)

## parallel (element-wise) versions of t-norms:
pminnorm(...)
pluknorm(...)
pprodnorm(...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
    \item{...}{
        Numeric vectors of values to compute t-norm from.
    }
}
\details{
    \code{minnorm}, \code{luknorm}, and \code{prodnorm} compute the minimum, Lukasiewicz, and
    product t-norm from all values in the arguments. If the arguments are vectors they are combined
    together firstly so that a single value is returned.

    \code{pminnorm}, \code{pluknorm}, and \code{pprodnorm} compute the minimum, Lukasiewicz, and
    product t-norms as well but in a element-wise manner. I.e. the first values of the arguments are
    combined, then the second values (with recycling the vectors if they do not have the same size)
    so that the result is a vector of values.

    Let \eqn{a}, \eqn{b} be values from the interval \eqn{[0, 1]}. Then the t-norms are defined 
    as follows:
    \itemize{
        \item{minimum:} \eqn{min(a, b)}
        \item{product:} \eqn{ab}
        \item{lukasiewicz:} \eqn{max(0, a+b-1)}
    }
}
\value{
    \code{minnorm}, \code{luknorm}, and \code{prodnorm} return a single value that is the result of
    the appropriate t-norm on all values of all arguments.

    \code{pminnorm}, \code{pluknorm}, and \code{pprodnorm} return a vector of results after applying
    the t-norm on argument in an element-wise (or parallel) way.
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

%\seealso{
%}
\examples{
    minnorm(c(0.3, 0.2, 0.5), c(0.8, 0.1, 0.5)) # 0.1
    pminnorm(c(0.3, 0.2, 0.5), c(0.8, 0.1, 0.5)) # 0.3, 0.1, 0.5
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ models }
\keyword{ robust }
