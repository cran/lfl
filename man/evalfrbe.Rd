\name{evalfrbe}
\alias{evalfrbe}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Evaluate the performance of the FRBE forecast}
\description{
    Take a FRBE forecast and compare it with real values using arbitrary error function.
}
\usage{
evalfrbe(fit,
         real,
         error=c('smape', 'mase', 'rmse'))
}
%- maybe also 'usage' for other objects documented here.
\arguments{
    \item{fit}{
        A FRBE model of class \code{frbe} as returned by the \code{\link{frbe}} function.
    }
    \item{real}{
        A numeric vector of real (known) values. The vector must correspond to the values
        being forecasted, i.e. the length must be the same as the horizon forecasted by
        \code{\link{frbe}}.
    }
    \item{error}{
        Error measure to be computed. It can be either Symmetric Mean Absolute Percentage
        Error (SMAPE), Mean Absolute Scaled Error (MASE), or Root Mean Squared Error (RMSE).
        See \code{\link{smape}}, \code{\link{mase}}, and \code{\link{rmse}}, for more details.
    }
}
\details{
    Take a FRBE forecast and compare it with real values by evaluating a given error measure.
    FRBE forecast should be made for a horizon of the same value as length of the vector of real
    values. 
}
\value{
    Function returns a data.frame with single row and columns corresponding to the error of
    the individual forecasting methods that the FRBE is computed from. Additionally to this, a
    column "avg" is added with error of simple average of the individual forecasting methods and a
    column "frbe" with error of the FRBE forecasts.
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
  \code{\link{frbe}},
  \code{\link{smape}},
  \code{\link{mase}},
  \code{\link{rmse}}
}
\examples{
\dontrun{
  # prepare data (from the forecast package)
  library(forecast)
  horizon <- 10
  train <- wineind[-1 * (length(wineind)-horizon+1):length(wineind)]
  test <- wineind[(length(wineind)-horizon+1):length(wineind)]
  f <- frbe(ts(train, frequency=frequency(wineind)), h=horizon)
  evalfrbe(f, test)
}}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ models }
\keyword{ robust }
