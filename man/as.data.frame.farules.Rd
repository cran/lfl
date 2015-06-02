\name{as.data.frame.farules}
\alias{as.data.frame.farules}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Convert the 'farules' object into a data frame}
\description{
    This function converts an instance of class \code{\link{farules}} into a data frame.
}
\usage{
\method{as.data.frame}{farules}(x, ...)
}
\arguments{
    \item{x}{
        An instance of class \code{\link{farules}} to be transformed.
    }
    \item{...}{
        Unused.
    }
}
\details{
    This function converts an instance of class \code{\link{farules}} into a data frame.
    Empty \code{\link{farules}} object is converted into an empty \code{\link{data.frame}} object.
}
\value{
    A data frame of statistics of the rules that are stored in the given \code{\link{farules}}
    object. Row names of the resulting data frame are in the form: \code{A1 & A2 & ... & An => C},
    where \code{Ai} are antecedent predicates and \code{C} is a consequent.
    Empty \code{\link{farules}} object is converted into an empty \code{\link{data.frame}} object.
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
  \code{\link{farules}}
}

%\examples{
%}

% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ models }
\keyword{ robust }
\keyword{ multivariate }
