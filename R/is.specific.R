# Determines whether 'x' is more specific (or equal!!!) than 'y' with respect to 'vars' and 'specs'.
is.specific <- function(x, y, vars, specs) {
    if (!is.null(x) && (!is.vector(x) || !is.character(x))) {
        stop("'x' must to be a character vector")
    }
    if (!is.null(y) && (!is.vector(y) || !is.character(y))) {
        stop("'y' must to be a character vector")
    }
    if (!is.vector(vars) || is.null(names(vars))) {
        stop("'vars' must be a named vector")
    }

    xVars <- vars[x]
    yVars <- vars[y]

    if (any(is.na(c(xVars, yVars)))) {
        stop("'vars' not compatible with input 'x' or 'y'")
    }
    if (!all(sort(names(vars)) == sort(colnames(specs))) ||
            !all(sort(names(vars)) == sort(colnames(specs)))) {
        stop("'specs' colnames or rownames are incompatible with 'vars' names")
    }
    if ((length(unique(xVars)) != length(xVars)) || (length(unique(yVars)) != length(yVars))) {
        stop('Unable to work with rules containing the same var more times')
    }

    if (length(setdiff(yVars, xVars)) > 0) {
        return(FALSE);
    }
    intrVars <- intersect(xVars, yVars)
    res <- sapply(intrVars, function(v) {
        xCond <- x[which(xVars == v)]
        yCond <- y[which(yVars == v)]
        return(specs[xCond, yCond] || (xCond == yCond))
    })
    return(all(res))
}
