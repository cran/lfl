\name{head.farules}
\alias{head.farules}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Return the first part of an instance of the \code{\link{farules}} class}
\description{
    Returns the first part of an instance of the \code{\link{farules}} class.
}
\usage{
\method{head}{farules}(x, n=6L, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
    \item{x}{
        An instance of \code{\link{farules}} class
    }
    \item{n}{
        A single integer. If positive, return first \eqn{n} elements of \code{x}.
        If negative, return all but the \eqn{n} first number of elements of \code{x}.
    }
    \item{...}{Unused.}
}
\details{
    Return a part of \code{x}.
}
\value{
    The instance of the \code{\link{farules}} class.
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
    \code{\link{tail.farules}},
    \code{\link{farules}}
}
\examples{
    d <- lcut3(CO2[, 1:2])
    print(head(d))
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ models }
\keyword{ robust }
