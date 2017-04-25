\name{aggregateConsequents}
\alias{aggregateConsequents}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Implicational aggregation of rules' consequents into a fuzzy set}
\description{
    Take a character vector of consequent names, a numeric vector of membership degrees
    and a matrix that models fuzzy sets corresponding to the consequent names and perform an
    aggregation of the consequents into a fuzzy set in an implicational way.

    This function is typically used within an inference mechanism after a set of firing rules is
    determined and the membership degrees of their antecedents is computed to combine the
    consequents of the firing rules into a fuzzy set. The result of this function is then typically
    defuzzified to obtain crisp result of the inference.
}
\usage{
aggregateConsequents(conseq,
          degrees,
          partition)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
    \item{conseq}{
        A character vector of consequents. Each value in the vector must correspond to a
        name of some column of the \code{partition} matrix. The length of this vector must be the same
        as of the \code{degrees} argument.
    }
    \item{degrees}{
        A numeric vector of membership degrees at which the corresponding consequents (see
        argument \code{conseq}) are fired.
    }
    \item{partition}{
        A matrix of membership degrees that describes the meaning of the consequents in
        vector \code{conseq}: each column of the matrix corresponds to a fuzzy set that models a single
        consequent (of a name given by column names of the matrix), each row corresponds to a single 
        crisp value (which is not important for this function), hence each cell corresponds to a
        membership degree in which the crisp value is a member of a fuzzy set modelling the consequent.
        Each consequent in \code{conseq} must correspond to some column of this matrix. Such matrix may
        be created e.g. by using the \code{\link{fcut}} or \code{\link{lcut}} functions.
    }
}
\details{
    Function assumes a set of implicative rules with antecedents firing at degrees given in
    \code{degrees} and with consequents in \code{conseq}. The meaning of the consequents is modeled
    with fuzzy sets whose membership degree values are captured in the \code{partition} matrix.

    The function computes a fuzzy set that results from a conjunction of all provided implicative
    rules. For implication and conjunction, the Lukasiewics implication and the minimum t-norm is
    used, respectively.
}
\value{
    A vector of membership degrees of fuzzy set elements that correspond to rows in the
    \code{partition} matrix. If empty vector of consequents is provided, a vector of 1's is
    returned. The length of the resulting vector equals to the number of rows of the
    \code{partition} matrix.
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
    \code{\link{perceive}},
    \code{\link{defuzz}},
    \code{\link{fcut}},
    \code{\link{lcut}}
}
\examples{
    # create a partition matrix
    partition <- matrix(c(0:10/10, 10:0/10, rep(0, 5),
                          rep(0, 5), 0:10/10, 10:0/10,
                          0:12/12, 1, 12:0/12),
                        byrow=FALSE,
                        ncol=3)
    colnames(partition) <- c('a', 'b', 'c')

    # the result of aggregation is equal to:
    # pmin(1, partition[, 1] + (1 - 0.5), partition[, 2] + (1 - 0.8))
    aggregateConsequents(c('a', 'b'), c(0.5, 0.8), partition)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ models }
\keyword{ robust }
