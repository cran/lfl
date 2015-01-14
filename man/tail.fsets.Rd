\name{tail.fsets}
\alias{tail.fsets}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Return the last part of an instance of the \code{\link{fsets}} class}
\description{
    Returns the last part of an instance of the \code{\link{fsets}} class.
}
\usage{
\method{tail}{fsets}(x, n=6L, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
    \item{x}{
        An instance of \code{\link{fsets}} class
    }
    \item{n}{
        A single integer. If positive, return last \eqn{n} rows of \code{x}.
        If negative, return all but the \eqn{n} last number of elements of \code{x}.
    }
    \item{...}{Unused.}
}
\details{
    Return a part of \code{x}.
}
\value{
    The instance of the \code{\link{fsets}} class.
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
    \code{\link{head.fsets}},
    \code{\link{fsets}},
    \code{\link{fcut}},
    \code{\link{lcut}}
}
\examples{
    d <- lcut3(CO2[, 1:2])
    print(tail(d))
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ models }
\keyword{ robust }
