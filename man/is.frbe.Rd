\name{is.frbe}
\alias{is.frbe}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Test whether \code{x} is a valid object of the \code{frbe} class}
\description{
    Test whether \code{x} has a valid format for the objects of the \code{frbe} class.
}
\usage{
is.frbe(x)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
    \item{x}{An object being tested.}
}
\details{
    This function tests wheter \code{x} inherits from \code{frbe} i.e. whether it is a list
    with the following elements: \code{forecasts} data frame, \code{features} data frame,
    \code{weights} vector, and \code{mean} vector.
}
\value{
    TRUE if \code{x} is a valid \code{frbe} object and FALSE otherwise.
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
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ models }
\keyword{ robust }
