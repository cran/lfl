\name{errors}
\alias{rmse}
\alias{smape}
\alias{mase}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Compute forecast errors}
\description{
    Compute Symmetric Mean Absolute Percentage Error (SMAPE),
    Mean Absolute Scaled Error (MASE), 
    and Root Mean Squared Error (RMSE) from forecasted and validation data.
}
\usage{
smape(forecast, validation)
mase(forecast, validation)
rmse(forecast, validation)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
    \item{forecast}{
        A numeric vector of predicted or forecasted values. Its length must be the same as the
        length of the \code{validation} argument.
    }
    \item{validation}{
        A numeric vector of actual (real) values being forecasted. Its length must be the same as the
        length of the \code{forecast} argument.
    }
    %\item{history}{
        %A numeric vector of real historical values that were used for fitting of the forecast model.
    %}
}
\details{
    The function compute various error measures of the forecasts.
    Let \eqn{v_i}, \eqn{f_i} be the \eqn{i}-th elements of 
    \code{validation} or \code{forecast}, respectively, and
    \eqn{n} be the length of \code{validation}. Then:
    \itemize{
        \item{}{\eqn{SMAPE = 1/n \sum_{i=1}^n (2 |f_i - v_i|) / (|f_i| + |v_i|)}}
        \item{}{\eqn{MASE = (\sum_{i=1}^n |v_i - f_i|) / (n/(n-1) * \sum_{i=2}^n |v_i - v_{i-1}|)}}
        \item{}{\eqn{RMSE = sqrt(1/n * \sum_{i=1}^n (v_i - f_i)^2)}}
    }
}
\value{
    A numeric value.
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
  \code{\link{evalfrbe}},
  \code{\link{frbe}}
}

%\examples{
%}

% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ models }
\keyword{ robust }
\keyword{ multivariate }
