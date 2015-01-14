\name{is.farules}
\alias{is.farules}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Test whether \code{x} is a valid object of the \code{farules} class}
\description{
    Test whether \code{x} has a valid format for the objects of the \code{farules} class.
}
\usage{
is.farules(x)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
    \item{x}{An object being tested.}
}
\details{
    This function tests wheter \code{x} inherits from \code{farules} and whether it is a list
    with \code{x$rules} being a list of rules and \code{x$stats} being a matrix.
}
\value{
    TRUE if \code{x} is a valid \code{farules} object and FALSE otherwise.
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
    \code{\link{farules}}
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ models }
\keyword{ robust }
