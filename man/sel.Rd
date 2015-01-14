\name{sel}
\alias{sel}
\alias{sel.fsets}
\alias{sel.farules}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Select several rows and columns from a data object}
\description{
    This function acts similarly as the \code{[]} operator, i.e. selects rows and columns of a data
    object.
}
\usage{
sel(x, ...)
\method{sel}{farules}(x, 
                      i=rep(TRUE,
                      nrow(x)), 
                      ...)
\method{sel}{fsets}(x,
                    i=rep(TRUE, nrow(x)),
                    j=rep(TRUE, ncol(x)),
                    ...)
}
\arguments{
    \item{x}{
        Original data: originally an instance of class \code{\link{fsets}} or \code{\link{farules}}.
    }
    \item{i}{
        The specification of rows to be selected. It can be a vector of integer indices which have
        to be selected, or vector of negative integers specifying which rows to discard, or
        vector of logical values etc. See \code{\link{[}} for details.
    }
    \item{j}{
        The specification of columns to be selected (only applicable for instances of
        \code{\link{fsets}}). It can be a vector of integer indices which have
        to be selected, or vector of negative integers specifying which columns to discard, or
        vector of logical values etc. See \code{\link{[}} for details.
    }
    \item{...}{
        Other parameters to some methods.
    }
}
\details{
    Originally, it is an S3 method defined for \code{\link{fsets}} and \code{\link{farules}}
    classes.

    For instances of the \code{\link{fsets}} class, \code{sel} behaves similarly as the \code{[]}
    operator except that it also takes care of the \code{\link{vars}} and \code{\link{specs}}
    attributes. Therefore, if you want to select some rows or columns from the \code{\link{fsets}}
    object and obtain again a valid \code{\link{fsets}} object, use \code{sel}. If you want only
    a matrix or vector of membership degrees in the \code{\link{fsets}} object without any other
    attributes, use the \code{[]} operator.
    
    
    For instances of the \code{\link{farules}} class, \code{sel} returns a valid
    \code{\link{farules}} object with a subset of rules specified with the \code{i} argument. Also
    the matrix of statistics is handled appropriately.
}
\value{
    A subset of data (originally \code{\link{fsets}} or \code{\link{farules}}) of the same type as
    original data, with attributes and additional meta data handled correctly.
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
  \code{\link{cbind.fsets}},
  \code{\link{farules}},
  \code{\link{searchrules}}
}

\examples{
    x <- 0:100
    d <- fcut(x, 
              breaks=c(0, 25, 50, 75, 100),
              type='triangle')

    # select only first two columns
    res <- sel(d, , 1:2)
    print(res)

    # select only the 3rd row
    res <- sel(d, 3)
    print(res)
}

% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ models }
\keyword{ robust }
\keyword{ multivariate }
