\name{as.matrix.fsets}
\alias{as.matrix.fsets}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Convert a 'fsets' object into matrix}
\description{
    This function converts an instance of class \code{\link{fsets}} into matrix.
}
\usage{
\method{as.matrix}{fsets}(x, ...)
}
\arguments{
    \item{x}{
        An instance of class \code{\link{fsets}} to be transformed.
    }
    \item{...}{
        Unused.
    }
}
\details{
    This function converts an instance of class \code{\link{fsets}} into matrix. Also the
    \code{\link{vars}} and \code{\link{specs}} attributes are deleted.
}
\value{
    A numeric matrix of membership degrees.
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
  \code{\link{fsets}},
  \code{\link{fcut}},
  \code{\link{lcut}}
}

\examples{
ff <- fcut(runif(10), breaks=c(0, 0.5, 1), name='age')
as.matrix(ff)
}

% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ models }
\keyword{ robust }
\keyword{ multivariate }
