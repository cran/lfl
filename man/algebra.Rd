% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/algebra.R
\name{algebra}
\alias{algebra}
\alias{is.algebra}
\alias{goedel.tnorm}
\alias{lukas.tnorm}
\alias{goguen.tnorm}
\alias{pgoedel.tnorm}
\alias{plukas.tnorm}
\alias{pgoguen.tnorm}
\alias{goedel.tconorm}
\alias{lukas.tconorm}
\alias{goguen.tconorm}
\alias{pgoedel.tconorm}
\alias{plukas.tconorm}
\alias{pgoguen.tconorm}
\alias{goedel.residuum}
\alias{lukas.residuum}
\alias{goguen.residuum}
\alias{goedel.biresiduum}
\alias{lukas.biresiduum}
\alias{goguen.biresiduum}
\alias{invol.neg}
\alias{strict.neg}
\title{Algebra for Fuzzy Sets}
\usage{
algebra(name, stdneg = FALSE, ...)

is.algebra(a)

goedel.tnorm(...)

lukas.tnorm(...)

goguen.tnorm(...)

pgoedel.tnorm(...)

plukas.tnorm(...)

pgoguen.tnorm(...)

goedel.tconorm(...)

lukas.tconorm(...)

goguen.tconorm(...)

pgoedel.tconorm(...)

plukas.tconorm(...)

pgoguen.tconorm(...)

goedel.residuum(x, y)

lukas.residuum(x, y)

goguen.residuum(x, y)

goedel.biresiduum(x, y)

lukas.biresiduum(x, y)

goguen.biresiduum(x, y)

invol.neg(x)

strict.neg(x)
}
\arguments{
\item{name}{The name of the algebra to be created. Must be one of: "goedel",
"lukasiewicz", "goguen" (or an unambiguous abbreviation).}

\item{stdneg}{(Deprecated.) \code{TRUE} if to force the use of a "standard" negation (i.e.
involutive negation).  Otherwise, the appropriate negation is used in the
algebra (e.g. strict negation in Goedel and Goguen algebra and involutive
negation in Lukasiewicz algebra).}

\item{...}{For t-norms and t-conorms, these arguments are numeric vectors
of values to compute t-norms or t-conorms from.  Values outside the
\eqn{[0,1]} interval cause an error. NA values are also permitted.

For the \code{algebra()} function, these arguments are passed to the factory
functions that create the algebra. (Currently unused.)}

\item{a}{An object to be checked if it is a valid algebra (i.e. a list
returned by the \code{algebra} function).}

\item{x}{Numeric vector of values to compute a residuum or bi-residuum from.
Values outside the \eqn{[0,1]} interval cause an error. NA values are also
permitted.}

\item{y}{Numeric vector of values to compute a residuum or bi-residuum from.
Values outside the \eqn{[0,1]} interval cause an error. NA values are also
permitted.}
}
\value{
Functions for t-norms and t-conorms (such as \code{goedel.tnorm})
return a numeric vector of size 1 that is the result of the appropriate
t-norm or t-conorm applied on all values of all arguments.

Element-wise versions of t-norms and t-conorms (such as \code{pgoedel.tnorm})
return a vector of results after applying the appropriate t-norm or t-conorm
on argument in an element-wise (i.e. by indices) way. The
resulting vector is of length of the longest argument (shorter arguments are
recycled).

Residua and bi-residua functions return a numeric vector of length of the
longest argument (shorter argument is recycled).

\code{strict.neg} and \code{invol.neg} compute negations and return a
numeric vector of the same size as the argument \code{x}.

\code{algebra} returns a list of functions of the requested algebra:
\code{"n"} (residual negation), \code{"ni"} (involutive negation), \code{"t"} (t-norm),
\code{"pt"} (element-wise t-norm),
\code{"c"} (t-conorm), \code{"pc"} (element-wise t-conorm), \code{"r"} (residuum),
\code{"b"} (bi-residuum), \code{"s"} (supremum),
\code{"ps"} (element-wise supremum), \code{"i"} (infimum), and
\code{"pi"} (element-wise infimum).

For Lukasiewicz algebra, the elements \code{"n"} and \code{"ni"} are the same, i.e.
the \code{invol.neg} function. For Goedel and Goguen algebra, \code{"n"} (the residual
negation) equals \code{strict.neg} and \code{"ni"} (the involutive negation) equals
\code{invol.neg}.

\code{"s"}, \code{"ps"}, \code{"i"}, \code{"pi"} are the same for each type of algebra:
\code{goedel.conorm}, \code{pgoedel.conorm}, \code{goedel.tnorm}, and \code{pgoedel.tnorm}.
}
\description{
Compute triangular norms (t-norms), triangular conorms (t-conorms), residua,
bi-residua, and negations.
}
\details{
\code{goedel.tnorm}, \code{lukas.tnorm}, and \code{goguen.tnorm} compute the
Goedel, Lukasiewicz, and Goguen triangular norm (t-norm) from all values in
the arguments. If the arguments are vectors they are combined together
firstly so that a numeric vector of length 1 is returned.

\code{pgoedel.tnorm}, \code{plukas.tnorm}, and \code{pgoguen.tnorm} compute
the same t-norms, but in an element-wise manner. I.e. the values
with indices 1 of all arguments are used to compute the t-norm, then the
second values (while recycling the vectors if they do not have the same
size) so that the result is a vector of values.

\code{goedel.tconorm}, \code{lukas.tconorm}, \code{goguen.tconorm}, are
similar to the previously mentioned functions, except that they compute
triangular conorms (t-conorms).  \code{pgoedel.tconorm},
\code{plukas.tconorm}, and \code{pgoguen.tconorm} are their element-wise alternatives.

\code{goedel.residuum}, \code{lukas.residuum}, and \code{goguen.residuum}
compute residua (i.e. implications) and \code{goedel.biresiduum},
\code{lukas.biresiduum}, and \code{goguen.biresiduum} compute bi-residua. Residua and
bi-residua are computed in an element-wise manner, for each corresponding
pair of values in \code{x} and \code{y} arguments.

\code{invol.neg} and \code{strict.neg} compute the involutive and strict
negation, respectively.

Let \eqn{a}, \eqn{b} be values from the interval \eqn{[0, 1]}. The realized functions
can be defined as follows:
\itemize{
\item Goedel t-norm: \eqn{min{a, b}};
\item Goguen t-norm: \eqn{ab};
\item Lukasiewicz t-norm: \eqn{max{0, a+b-1}};
\item Goedel t-conorm: \eqn{max{a, b}};
\item Goguen t-conorm: \eqn{a+b-ab};
\item Lukasiewicz t-conorm: \eqn{min{1, a+b}};
\item Goedel residuum (standard Goedel implication): \eqn{1} if \eqn{a \le b} and
\eqn{b} otherwise;
\item Goguen residuum (implication): \eqn{1} if \eqn{a \le b} and \eqn{b/a}
otherwise;
\item Lukasiewicz residuum (standard Lukasiewicz implication): \eqn{1} if
\eqn{a \le b} and \eqn{1-a+b} otherwise;
\item Involutive negation: \eqn{1-x};
\item Strict negation: \eqn{1} if \eqn{x=0} and \eqn{0} otherwise.
}

Bi-residuum \eqn{B} is derived from residuum \eqn{R}
as follows: \deqn{B(a, b) = inf(R(a, b), R(b, a)),}
where \eqn{inf} is the operation of infimum, which for all three algebras
corresponds to the \eqn{min} operation.

The arguments have to be numbers from the interval \eqn{[0, 1]}. Values
outside that range cause an error. NaN values are treated as NAs.

If some argument is NA or NaN, the result is NA. For other handling of missing values,
see \link{algebraNA}.

Selection of a t-norm may serve as a basis for definition of other operations.
From the t-norm, the operation of a residual implication may be defined, which
in turn allows the definition of a residual negation. If the residual negation
is not involutive, the involutive negation is often added as a new operation
and together with the t-norm can be used to define the t-conorm. Therefore,
the \code{algebra} function returns a named list of operations derived from the selected
Goedel, Goguen, or Lukasiewicz t-norm. Concretely:
\itemize{
\item \code{algebra("goedel")}: returns the strict negation as the residual negation,
the involutive negation, and also the Goedel t-norm, t-conorm, residuum, and bi-residuum;
\item \code{algebra("goguen")}: returns the strict negation as the residual negation,
the involutive negation, and also the Goguen t-norm, t-conorm, residuum, and bi-residuum;
\item \code{algebra("lukasiewicz")}: returns involutive negation as both residual and involutive
negation, and also the Lukasiewicz t-norm, t-conorm, residuum, and bi-residuum.
}

Moreover, \code{algebra} returns the supremum and infimum functions computed as maximum and minimum,
respectively.

\code{is.algebra} tests whether the given \code{a} argument is a valid
algebra, i.e. a list returned by the \code{algebra} function.
}
\examples{
    # direct and element-wise version of functions
    goedel.tnorm(c(0.3, 0.2, 0.5), c(0.8, 0.1, 0.5))  # 0.1
    pgoedel.tnorm(c(0.3, 0.2, 0.5), c(0.8, 0.1, 0.5)) # c(0.3, 0.1, 0.5)

    # algebras
    x <- runif(10)
    y <- runif(10)
    a <- algebra('goedel')
    a$n(x)     # residual negation
    a$ni(x)    # involutive negation
    a$t(x, y)  # t-norm
    a$pt(x, y) # element-wise t-norm
    a$c(x, y)  # t-conorm
    a$pc(x, y) # element-wise t-conorm
    a$r(x, y)  # residuum
    a$b(x, y)  # bi-residuum
    a$s(x, y)  # supremum
    a$ps(x, y) # element-wise supremum
    a$i(x, y)  # infimum
    a$pi(x, y) # element-wise infimum

    is.algebra(a) # TRUE
}
\author{
Michal Burda
}
\keyword{models}
\keyword{robust}
