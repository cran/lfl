\name{print.fsets}
\alias{print.fsets}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Print an instance of the \code{\link{fsets}} class}
\description{
    Format an object of the \code{\link{fsets}} class into human readable form and print it to the
    output.
}
\usage{
\method{print}{fsets}(x, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
    \item{x}{
        An instance of \code{\link{fsets}} class
    }
    \item{...}{
        Unused.
    }
}
\details{
    Format an object of the \code{\link{fsets}} class into human readable form and print it to the
    output.
}
\value{
    None.
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
    \code{\link{fsets}},
    \code{\link{fcut}},
    \code{\link{lcut}}
}
\examples{
    d <- lcut3(CO2[, 1:2])
    print(d)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ models }
\keyword{ robust }
