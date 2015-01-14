\name{lcut}
\alias{lcut}
\alias{lcut3}
\alias{lcut3.default}
\alias{lcut3.numeric}
\alias{lcut3.matrix}
\alias{lcut3.data.frame}
\alias{lcut5}
\alias{lcut5.default}
\alias{lcut5.numeric}
\alias{lcut5.matrix}
\alias{lcut5.data.frame}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Transform data into a set of linguistic fuzzy attributes}
\description{
    This function creates a set of linguistic fuzzy attributes from crisp data. Numeric vectors,
    matrix or data frame columns are transformed into a set of fuzzy attributes, i.e. columns with
    membership degrees. Factors and other data types are transformed to fuzzy attributes by calling
    the \code{\link{fcut}} function.
}
\usage{
lcut3(x, ...)
\method{lcut3}{matrix}(x, ...)
\method{lcut3}{data.frame}(x, 
     context=NULL,
     name=NULL,
     parallel=FALSE,
     ...)
\method{lcut3}{numeric}(x, 
     context=NULL,
     defaultCenter=0.5,
     atomic=c("sm", "me", "bi"), 
     hedges=c("ex", "si", "ve", "ml", "ro", "qr", "vr"),
     name=NULL,
     parallel=FALSE,
     ...)

lcut5(x, ...)
\method{lcut5}{matrix}(x, ...)
\method{lcut5}{data.frame}(x, 
     context=NULL,
     name=NULL,
     parallel=FALSE,
     ...)
\method{lcut5}{numeric}(x, 
     context=NULL,
     defaultCenter=0.5,
     atomic=c('sm', 'lm', 'me', 'um', 'bi'),
     hedges=c("ex", "ve", "ml", "ro", "ty"),
     name=NULL,
     parallel=FALSE,
     ...)
}
\arguments{
    \item{x}{
        Data to be transformed: if it is a numeric vector, matrix, or data frame, then the
        creation of linguistic fuzzy attributes takes place. For other data types the
        \code{\link{fcut}} function is called.
    }
    \item{context}{
        A definition of context of a numeric attribute. Context determines how people
        understand the notions "small", "medium", or "big" with respect to that attribute.
        If \code{x} is a numeric vector then context should be a vector of 3 numbers:
        typical small, medium, and big value. If the context is set to NULL, these values
        are taken directly from \code{x} as follows:
        \itemize{
            \item{small}{\eqn{= min(x)};}
            \item{medium}{\eqn{= (max(x) - min(x)) * defaultCenter + min(x)};}
            \item{big}{\eqn{= max(x)}.}
        }
        If \code{x} is a matrix or data frame then \code{context} should be a named list
        of contexts for each \code{x}'s column. If some context is omitted, it will be determined
        directly from data as explained above.

        Regardless of the value of the \code{atomic} argument, all 3 numbers of the context
        must be provided everytime.
    }
    \item{defaultCenter}{
        A value used to determine a typical "medium" value from data (see the \code{context}
        above). If \code{context} is not specified then typical "medium" is determined as
        \eqn{(max(x) - min(x)) * defaultCenter + min(x)}.
        Default value of \code{defaultCenter} is 0.5, however, some literature specifies
        0.42 as another sensible value with proper linguistic interpretation.
    }
    \item{atomic}{
        A vector of atomic linguistic expressions to be used for creation of fuzzy attributes. The
        possible values for \code{lcut3} are:
        \itemize{
            \item{sm}{small;}
            \item{me}{medium;}
            \item{bi}{big.}
        }
        For \code{lcut5}, the following values are possible:
        \itemize{
            \item{sm}{small;}
            \item{lm}{lower medium;}
            \item{me}{medium;}
            \item{um}{upper medium;}
            \item{bi}{big.}
        }
        Several values are allowed in this argument.
    }
    \item{hedges}{
        A vector of linguistic hedges to be used for creation of fuzzy attributes.
        
        For \code{lcut3} variant, the following hedges are allowed:
        \itemize{
            \item{ex}{extremely (sm, bi);}
            \item{si}{significantly (sm, bi);}
            \item{ve}{very (sm, bi);}
            \item{ml}{more or less (sm, me, bi);}
            \item{ro}{roughly (sm, me, bi);}
            \item{qr}{quite roughly (sm, me, bi);}
            \item{vr}{very roughly (sm, me, bi).}
        }

        For \code{lcut5} variant, the following hedges are allowed:
        \itemize{
            \item{ex}{extremely (sm, bi);}
            \item{ve}{very (sm, bi);}
            \item{ml}{more or less (sm, me, bi);}
            \item{ro}{roughly (sm, me, bi);}
            \item{ty}{typically (me).}
        }

        By default, a fuzzy attribute is created for each atomic expression (i.e. "small", "medium",
        "big") with empty hedge. Additionally, another fuzzy attributes are created based on the set of
        hedges selected with this argument. Not all hedges are usable to any atomic expression. In
        the list above, one can find the allowed atomic expressions in parentheses.
    }
    \item{name}{
        A name to be added as a suffix to the created fuzzy attribute names. This parameter
        can be used only if \code{x} is a numeric vector. If \code{x} is a matrix or data frame,
        \code{name} should be NULL because the fuzzy attribute names are taken from column names
        of parameter \code{x}.
    }
    \item{parallel}{
        Whether the processing should be run in parallel or not. Parallelization is
        implemented using the \code{\link[foreach]{foreach}} package. The parallel environment must be
        set properly in advance, e.g. with the \code{\link[doMC]{registerDoMC}} function.
    }
    \item{...}{
        Other parameters to some methods.
    }
}
\details{
    The aim of this function is to transform numeric data into a set of fuzzy attributes.
    The resulting fuzzy attributes have direct
    linguistic interpretation. This is a unique variant of fuzzification that is suitable for
    the inference mechanism based on Perception-based Linguistic Description (PbLD) -- see
    \code{\link{pbld}}.

    A numeric vector is transformed into a set of fuzzy attributes accordingly to the following
    scheme: 
    
    \eqn{<hedge> <atomic expression>}

    where \eqn{<atomic expression>} is a linguistic expression "small" ("sm"), "lower medium"
    ("lm"), "medium" ("me"), "upper medium" ("um") or
    "big" ("bi") -- see the \code{atomic} argument. A \eqn{<hedge>} is a modifier that further
    concretizes the atomic expression. It can be empty ("") or some value of:
    \itemize{
        \item{ty}{typically;}
        \item{ex}{extremely;}
        \item{si}{significantly;}
        \item{ve}{very;}
        \item{ml}{more or less;}
        \item{ro}{roughly;}
        \item{qr}{quite roughly;}
        \item{vr}{very roughly.}
    }
    Accordingly to the theory developed by Novak (2008), not every hedge is suitable with each atomic
    expression (see the description of the \code{hedges} argument).
    The hedges to be used can be selected with the \code{hedges} argument. Function takes care of
    not to use hedge together with an un-applicable atomic expression by itself.

    Obviously, distinct data have different meaning of what is "small", "medium", or "big".
    Therefore, a \code{context} has to be set that specifies sensible values for these linguistic
    expressions.

    If a matrix (resp. data frame) is provided to this function instead of single vector, all columns are
    processed the same way.

    The function also sets up properly the \code{\link{vars}} and \code{\link{specs}} properties of
    the result.
}
\value{
    An object of class "fsets" is returned, which is a numeric matrix with columns representing the
    fuzzy attributes. Each source columm
    of the \code{x} argument corresponds to multiple columns in the resulting matrix.
    Columns will have names derived from used \eqn{hedges}, atomic expression, and \eqn{name}
    specified as the optional parameter.

    The resulting object would also have set the \code{\link{vars}} and \code{\link{specs}}
    properties with the former being created from original column names (if \code{x} is a matrix or
    data frame) or the \code{name} argument (if \code{x} is a numeric vector). The
    \code{\link{specs}} incidency matrix would be created to reflect the following order of the
    hedges: \eqn{"ex" < "si" < "ve" < "" < "ml" < "ro" < "qr" < "vr"} and \eqn{"ty" < ""}.
    Fuzzy attributes created from
    the same source numeric vector (or column) would be ordered that way, with other fuzzy
    attributes (from the other source) being incomparable.

}
\references{
    V. Novak, A comprehensive theory of trichotomous evaluative linguistic expressions, Fuzzy Sets
    and Systems 159 (22) (2008) 2939--2969.
}
\author{
    Michal Burda
}
%\note{
%%  ~~further notes~~
%}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
  \code{\link{fcut}},
  \code{\link{farules}},
  \code{\link{pbld}}
  \code{\link{vars}},
  \code{\link{specs}},
  \code{\link{cbind.fsets}}
}

\examples{
# transform a single vector
x <- runif(10)
lcut3(x, name='age')
lcut5(x, name='age')


# transform single vector with custom context
lcut3(x, context=c(0, 0.2, 0.5), name='age')
lcut5(x, context=c(0, 0.2, 0.5), name='age')


# transform all columns of a data frame
# and do not use any hedges
data <- CO2[, c('conc', 'uptake')]
lcut3(data, hedges=NULL)
lcut5(data, hedges=NULL)


# definition of custom contexts for different columns 
# of a data frame while selecting only "ve" and "ro" hedges.
lcut3(data,
     context=list(conc=c(0, 500, 1000),
                  uptake=c(0, 25, 50)),
     hedges=c('ve', 'ro'))


# lcut on non-numeric data is the same as fcut()
ff <- factor(substring("statistics", 1:10, 1:10), levels = letters)
lcut3(ff)
lcut5(ff)
}

% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ models }
\keyword{ robust }
\keyword{ multivariate }
