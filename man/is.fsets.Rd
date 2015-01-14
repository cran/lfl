\name{is.fsets}
\alias{is.fsets}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Test whether \code{x} is a valid object of the \code{fsets} class}
\description{
    Test whether \code{x} has a valid format for the objects of the \code{fsets} class.
}
\usage{
is.fsets(x)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
    \item{x}{An object being tested.}
}
\details{
    This function tests wheter \code{x} inherits from \code{fsets} and whether it is a numeric
    matrix with \code{\link{vars}} and \code{\link{specs}} attributes of correct size and
    column/row names.
}
\value{
    TRUE if \code{x} is a valid \code{fsets} object and FALSE otherwise.
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
    \code{\link{lcut}},
    \code{\link{fcut}}
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ models }
\keyword{ robust }
