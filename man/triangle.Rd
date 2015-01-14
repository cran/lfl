\name{triangle}
\alias{triangle}
\alias{raisedcos}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Compute membership degrees of values to the fuzzy set}
\description{
    This function computes membership degrees of values to a fuzzy set that is defined on three
    numbers \code{lo}, \code{center}, and \code{hi} that form a triangle/raisedcos.
}
\usage{
triangle(x, lo, center, hi)
raisedcos(x, lo, center, hi)
}
\arguments{
    \item{x}{
        Numeric vector of data to be converted.
    }
    \item{lo}{
        A lower bound (can be -Inf).
    }
    \item{center}{
        A peak value.
    }
    \item{hi}{
        An upper bound (can be Inf).
    }
}
\details{
    This function computes membership degrees of values to a fuzzy set that is defined on three
    numbers \code{lo}, \code{center}, and \code{hi} that form a triangle/raisedcos, i.e. value 
    equal to \code{center} has a membership degree equal to 1, values lower than \code{lo} or
    greater than \code{hi} have memberhsip degree equal to 0. Between \code{lo} and \code{hi},
    there is a transition of the triangular (resp. raised cosinal) shape (with peak at \code{center}).

    If \code{lo == -Inf} then any value that is lower or equal to center gets memberhsip degree 1.
    Similarly, if \code{hi == Inf} then any value that is greater or equal to center gets memberhsip
    degree 1.

    \code{triangle} produces fuzzy sets of a triangular shape (with peak at \code{center}),
    \code{raisedcos} produces fuzzy sets defined as a raised cosine hill.
}
\value{
    A numeric vector of membership degrees.
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
  \code{\link{fcut}}
}

\examples{
plot(function(x) triangle(x, -1, 0, 1), from=-2, to=3)
plot(function(x) triangle(x, -1, 0, 2), from=-2, to=3)
plot(function(x) triangle(x, -Inf, 0, 1), from=-2, to=3)
plot(function(x) triangle(x, -1, 0, Inf), from=-2, to=3)

plot(function(x) raisedcos(x, -1, 0, 1), from=-2, to=3)
plot(function(x) raisedcos(x, -1, 0, 2), from=-2, to=3)
plot(function(x) raisedcos(x, -Inf, 0, 1), from=-2, to=3)
plot(function(x) raisedcos(x, -1, 0, Inf), from=-2, to=3)
}

% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ models }
\keyword{ robust }
\keyword{ multivariate }
