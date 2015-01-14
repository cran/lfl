\name{farules}
\alias{farules}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{A class of rules with statistical characteristics.}
\description{
    The aim of the \code{farules} S3 class is to store a list of rules (a rule-base) together with
    some statistical characteristics. To search for fuzzy association rules, refer to
    \code{\link{searchrules}} function.
}
\usage{
farules(rules, statistics)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
    \item{rules}{
        A list of character vectors, where each vector represents a rule and each value of the
        vector represents a predicate. The first value of the vector is assumed to be a rule's
        consequent, the rest is antecedent.
    }
    \item{statistics}{
        A numeric matrix of various statistical characteristics of the rules. Each column of that
        matrix corresponds to some statistic (such as support, confidence, etc.). Rows correspond to
        the rules in the list of \code{rules}.
    }
}
\details{
    The \code{farules} function is a constructor for an instance of the \code{farules} class.
}
\value{
    Returns an object of class \code{farules}.
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
    \code{\link{searchrules}},
    \code{\link{reduce}}
}
%\examples{
%}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ models }
\keyword{ robust }
