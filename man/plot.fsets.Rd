\name{plot.fsets}
\alias{plot.fsets}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Plot a 'fsets' object}
\description{
    Plot the membership degrees stored in the instance of class \code{\link{fsets}}
    using the line diagram.
}
\usage{
\method{plot}{fsets}(x, ...)
}
\arguments{
    \item{x}{
        An instance of class \code{\link{fsets}}
    }
    \item{...}{
        Other arguments that are passed to the \code{\link{ts.plot}} function.
    }
}
\details{
    This function plots the membership degrees stored in the instance of the \code{\link{fsets}}
    class. Internally, the membership degrees are transformed into a time-series object and viewed
    in a plot using the \code{\link{ts.plot}} function. This function is useful mainly to see the
    shape of fuzzy sets on regularly sampled inputs.
}
\value{
    Result of the \code{\link{ts.plot}} method.
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
  \code{\link{lcut}},
  \code{\link{ts.plot}}
}

\examples{
d <- lcut3(slices(0, 1, 1000), name='x')

# plot the resulting fuzzy sets
plot(d)

# Additional arguments are passed to the ts.plot method
# Here thick lines represent atomic linguistic expressions,
# i.e. ``small'', ``medium'', and ``big''.
plot(d,
     ylab='membership degree',
     xlab='values', 
     gpars=list(lwd=c(5, rep(1, 7), 5, rep(1, 4), 5, rep(1, 7))))
}

% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ models }
\keyword{ robust }
\keyword{ multivariate }
