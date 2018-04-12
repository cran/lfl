\name{cbind.fsets}
\alias{cbind.fsets}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Combine several 'fsets' objects into a single one}
\description{
    Take a sequence of objects of class 'fsets' and combine them by columns.
    This version of cbind takes care of the \code{\link{vars}} and \code{\link{specs}} attributes
    of the arguments and merges them to the result.
}
\usage{
\method{cbind}{fsets}(..., deparse.level = 1)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
    \item{...}{
        A sequence of objects of class 'fsets' to be merged by columns.
    }
    \item{deparse.level}{
        This argument has currently no function and is added here only for
        compatibility with generic \code{\link{cbind}} function.
    }
}
\details{
    Take a sequence of objects of class 'fsets' and combine them by columns.
    This version of cbind takes care of the \code{\link{vars}} and \code{\link{specs}} attributes
    of the arguments and merges them to the result. If some argument does not inherit from class
    'fsets' an error is thrown.

    The \code{\link{vars}} attribute is merged by concatenating the \code{\link{vars}} attributes of
    each argument. Also the \code{\link{specs}} attributes of the arguments are merged together.
}
\value{
    An object of class 'fsets' that is created by merging the arguments by columns.
    Also the arguments' attributes \code{\link{vars}} and \code{\link{specs}} are merged together.
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
    \code{\link{vars}},
    \code{\link{specs}},
    \code{\link{fcut}},
    \code{\link{lcut}},
    \code{\link{farules}}
}
\examples{
    d1 <- lcut3(CO2[, 1:2])
    d2 <- lcut3(CO2[, 3:4])
    r <- cbind(d1, d2)

    print(colnames(d1))
    print(colnames(d2))
    print(colnames(r))

    print(vars(d1))
    print(vars(d2))
    print(vars(r))

    print(specs(d1))
    print(specs(d2))
    print(specs(r))
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ models }
\keyword{ robust }
