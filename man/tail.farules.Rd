\name{tail.farules}
\alias{tail.farules}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Return the last part of an instance of the \code{\link{farules}} class}
\description{
    Returns the last part of an instance of the \code{\link{farules}} class.
}
\usage{
\method{tail}{farules}(x, n=6L, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
    \item{x}{
        An instance of \code{\link{farules}} class
    }
    \item{n}{
        A single integer. If positive, return last \eqn{n} elemens of \code{x}.
        If negative, return all but the \eqn{n} last number of elements of \code{x}.
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
    \code{\link{head.farules}},
    \code{\link{farules}}
}
%\examples{
%}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ models }
\keyword{ robust }
