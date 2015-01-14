\name{antecedents}
\alias{antecedents}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Extract antecedent-part (LHS) of the rules in a list}
\description{
    Given a list of rules, the function returns a list of antecedents (i.e. left hand side) 
    of the rules.
}
\usage{
antecedents(rules)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
    \item{rules}{Either a list of rules or an object of class \code{farules}.}
}
\details{
    This function assumes \code{rules} to be a list of character vectors where the first element of
    each vector is a consequent part of the rule and the rest is the antecedent part of the rule.
    Function returns a list of antecedents.
}
\value{
    A list of character vectors.
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
