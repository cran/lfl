\name{frbe}
\alias{frbe}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Fuzzy Rule-Based Ensemble (FRBE) of time-series forecasts}
\description{
    This function computes the fuzzy rule-based ensemble of time-series forecasts.
    Several forecasting methods are used to predict future values of given time-series and
    a weighted sum is computed from them with weights being determined from a fuzzy rule base.
}
\usage{
frbe(d,
     h=10)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
    \item{d}{
        A source time-series in the ts time-series format.
        Note that the frequency of the time-series must to be set properly.
    }
    \item{h}{
        A forecasting horizon, i.e. the number of values to forecast.
    }
}
\details{
    This function computes the fuzzy rule-based ensemble of time-series forecasts.
    The evaluation comprises of the following steps:

    \enumerate{
        \item{Several features are extracted from the given time-series \code{d}:
            \itemize{
                \item{length of the time-series}
                \item{strength of trend}
                \item{strength of seasonality}
                \item{skewness}
                \item{kurtosis}
                \item{variation coefficient}
                \item{stationarity}
                \item{frequency}
            }
            These features are used later to infer weights of the forecasting methods.
        }
        \item{Several forecasting methods are applied on the given time-series \code{d} to obtain
           forecasts. Actually, the following methods are used:
           \itemize{
                \item{ARIMA - by calling \code{auto.arima} of the \code{forecast} package}
                \item{Exponential Smoothing - by calling \code{ets} of the \code{forecast} package}
                \item{Random Walk with Drift - by calling \code{rwf} of the \code{forecast} package}
                \item{Theta - by calling \code{thetaf} of the \code{forecast} package}
           }
        }
        \item{Computed features are input to the fuzzy rule-based inference mechanism which yields
        into weights of the forecasting methods. The fuzzy rule base is hardwired in this package
        and it was obtained by performing data mining with the use of the \code{\link{farules}} function.}
        \item{A weighted sum of forecasts is computed and returned as a result.}
    }
}
\value{
    Result is a list of class \code{frbe} with the following elements:
    \itemize{
        \item{\code{features} - a data frame with computed features of the given time-series;}
        \item{\code{forecasts} - a data frame with forecasts to be ensembled;}
        \item{\code{weights} - weights of the forecasting methods as inferred from the features and
        the hard-wired fuzzy rule base;}
        \item{\code{mean} - the resulting ensembled forecast (computed as a weighted sum of forecasts).}
    }

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
  \code{\link{evalfrbe}}
}
\examples{
\dontrun{
  # prepare data (from the forecast package)
  library(forecast)
  horizon <- 10
  train <- wineind[-1 * (length(wineind)-horizon+1):length(wineind)]
  test <- wineind[(length(wineind)-horizon+1):length(wineind)]

  # perform FRBE
  f <- frbe(ts(train, frequency=frequency(wineind)), h=horizon)

  # evaluate FRBE forecasts
  evalfrbe(f, test)

  # display forecast results
  f$mean
}}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ models }
\keyword{ robust }
