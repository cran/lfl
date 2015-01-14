minnorm <- function(...) {
    vals <- c(...)
    if (length(vals) <= 0) {
        return(1)
    }
    return(min(...))
}


luknorm <- function(...) { 
    vals <- c(...)
    max(0, sum(vals) - length(vals) + 1)
}


prodnorm <- function(...) {
    prod(...)
}
  

pminnorm <- function(...) {
    pmin(...)
}


pluknorm <- function(...) {
    n <- nargs()
    m <- matrix(c(...), ncol=n)
    pmax(0, rowSums(m) - n + 1)
}


pprodnorm <- function(...) {
    n <- nargs()
    m <- matrix(c(...), ncol=n)
    apply(m, 1, prod)
}

.tnorms <- list(minimum=minnorm,
                lukasiewicz=luknorm,
                product=prodnorm)

.ptnorms <- list(minimum=pminnorm,
                 lukasiewicz=pluknorm,
                 product=pprodnorm)

