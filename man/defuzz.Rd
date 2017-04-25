\name{defuzz}
\alias{defuzz}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Convert fuzzy set into a crisp numeric value}
\description{
    Take a fuzzy set in the form of a vector of membership degrees and a vector of numeric values
    that correspond to that degrees and perform a selected type of defuzzification, i.e. conversion
    of the fuzzy set into a single crisp value.
}
\usage{
defuzz(degrees,
       values,
       type=c('mom', 'fom', 'lom', 'dee'))
}
%- maybe also 'usage' for other objects documented here.
\arguments{
    \item{degrees}{
        A fuzzy set in the form of a numeric vector of membership degrees. Membership degrees must
        correspond to crisp values in the \code{values} argument.
    }
    \item{values}{
        Crisp values that correspond to memberhsip degrees in the \code{degrees} vector.
        Function assumes that the values are sorted in the ascending order.
    }
    \item{type}{
        Type of requested defuzzification method. The possibilities are:
        \itemize{
            \item{\code{'mom'}}{Mean of Maxima - maximum membership degrees are found and a mean of
            values that correspond to that degrees is returned;}
            \item{\code{'fom'}}{First of Maxima - first value with maximum membership degree is
            returned;}
            \item{\code{'lom'}}{Last of Maxima - last value with maximum membership degree is
            returned;}
            \item{\code{'dee'}}{Defuzzification of Evaluative Expressions - method used by the
            \code{\link{pbld}} inference mechanism that combines the former three approaches
            accordingly to the shape of the \code{degrees} vector: If \code{degrees} is 
            non-increasing then \code{'lom'} type is used, if it is non-decreasing then \code{'fom'}
            is applied, else \code{'mom'} is selected.}
        }
    }
}
\details{
    Function converts input fuzzy set into a crisp value. The definition of input fuzzy set is
    provided by the arguments \code{degrees} and \code{values}. These arguments should be numeric
    vectors of the same length, the former containing memberhsip degrees in the interval \eqn{[0,
    1]} and the latter containing the corresponding crisp values; the fuzzy set is interpreted as
    \code{values[i]} to have the memberhsip degree \code{degrees[i]}. The \code{values} vector is
    assumed to be sorted in ascending order.
}
\value{
    A crisp value computed from \code{values} with respect to \code{degrees} and a type of
    defuzzification.
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
    \code{\link{fire}},
    \code{\link{aggregateConsequents}},
    \code{\link{perceive}},
    \code{\link{pbld}},
    \code{\link{fcut}},
    \code{\link{lcut}}
}
\examples{
defuzz(c(0, 0, 0, 0.1, 0.3, 0.9, 0.9, 0.9, 0.2, 0), 1:10, type='mom')
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ models }
\keyword{ robust }
