\name{lfl-package}
\alias{lfl-package}
\alias{lfl}
\docType{package}
\title{Linguistic Fuzzy Logic}
\description{
    This package provides functions to work with various algorithms related to linguistic
    fuzzy logic. Namely, the following functions are available: mining of linguistic fuzzy association
    rules, performing perception-based logical deduction (PbLD), and forecasting time-series using fuzzy
    rule-based ensemble (FRBE).
}
\details{
    \tabular{ll}{
        Package: \tab lfl\cr
        Type: \tab Package\cr
        Version: \tab 1.0\cr
        Date: \tab 2015-01-01\cr
        License: \tab GNU/GPL version 3.0 or later\cr
    }

    This packages provides functions related with linguistic fuzzy logic.
    
    To convert data into membership degrees of fuzzy sets that model linguistic expressions, see
    \code{\link{lcut}}. To create fuzzy set partitions see \code{\link{fcut}}.

    For fuzzy association rules mining, there is a function \code{\link{searchrules}} that searches
    for association rules and computes various statistics about them. There is also
    \code{\link{reduce}} to make small rule bases from mined rules by dropping rules that do not
    contribute singnificantly to the rule base coverage of source data.

    To perform Perception-based Logical Deduction (PbLD), please use \code{\link{pbld}} function.
    Another ad-hoc inferences may be programmed with help of \code{\link{fire}},
    \code{\link{perceive}}, \code{\link{aggregate}}, or \code{\link{defuzz}} functions.

    Fuzzy Rule-based Ensemble (FRBE) is a tool for time-series prediction. Several existing
    time-series forecasting methods are combined based on features of given time-series to provide a
    robust forecast -- see \code{\link{frbe}}. Also \code{\link{evalfrbe}} may be used to evaluate
    the performance of forecasting.
}
\author{
    Michal Burda

    Maintainer: Michal Burda <michal.burda@osu.cz>
}
%\references{
    %~~ Literature or other references for background information ~~
%}
%~~ Optionally other standard keywords, one per line, from file KEYWORDS in ~~
%~~ the R documentation directory ~~
\keyword{ package }
%\seealso{
    %~~ Optional links to other man pages, e.g. ~~
    %~~ \code{\link[<pkg>:<pkg>-package]{<pkg>}} ~~
%}
\examples{
# --- SEARCHING FOR RULES ---
# split data into training and testing set
testing <- CO2[1:5, ]
training <- CO2[-1 * 1:5, ]

# custom context of the RHS variable
uptakeContext <- c(7, 28.3, 46)

# convert training data into fuzzy sets
d <- lcut3(training, context=list(uptake=uptakeContext))

# search for rules
r <- searchrules(d, lhs=1:38, rhs=39:58)



# --- PBLD INFERENCE WITH FOUND RULES ---
# convert testing data info fuzzy sets
x <- lcut3(testing, context=list(uptake=uptakeContext))

# prepare values and partition
v <- slices(uptakeContext[1], uptakeContext[3], 1000)
p <- lcut3(v, name='uptake', context=uptakeContext)

# do the inference
pbld(x, r, p, v)



# --- FRBE TIME-SERIES FORECASTING ---
# prepare data (from the forecast package)
library(forecast)
horizon <- 10
train <- wineind[-1 * (length(wineind)-horizon+1):length(wineind)]
test <- wineind[(length(wineind)-horizon+1):length(wineind)]

# compute forecast
f <- frbe(ts(train, frequency=frequency(wineind)), h=horizon)

# display the forecast
f$mean

# evaluate the results
evalfrbe(f, test)
}
