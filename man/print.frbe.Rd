\name{print.frbe}
\alias{print.frbe}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Print an instance of the \code{\link{frbe}} class}
\description{
    Format an object of the \code{\link{frbe}} class into human readable form and print it to the
    output.
}
\usage{
\method{print}{frbe}(x, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{An instance of \code{\link{frbe}} class
}
  \item{...}{Unused.
}
}
\details{
    Format an object of the \code{\link{frbe}} class into human readable form and print it to the
    output.
}
\value{
    None.
}
\references{
    Štěpnička, M., Burda, M., Štěpničková, L. Fuzzy Rule Base Ensemble Generated from Data
    by Linguistic Associations Mining. FUZZY SET SYST. 2015.
}
\author{
    Michal Burda
}
%\note{
%%  ~~further notes~~
%}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
    \code{\link{frbe}}
}
\examples{
\dontrun{
  # prepare data (from the forecast package)
  library(forecast)
  horizon <- 10
  train <- wineind[-1 * (length(wineind)-horizon+1):length(wineind)]
  test <- wineind[(length(wineind)-horizon+1):length(wineind)]
  f <- frbe(ts(train, frequency=frequency(wineind)), h=horizon)
  print(f)
  print(test)
}}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ models }
\keyword{ robust }
