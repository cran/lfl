fcut.default <- function(x, 
                         name=deparse(substitute(x)),
                         ...) {
    if (is.null(x)) {
        return(NULL)
    }
    if (is.null(name)) {
        stop('"name" must not be NULL')
    }

    x <- as.factor(x)
    res <- laply(x, function(a) { a == levels(x) }) + 0
    res <- as.matrix(res)
    colnames(res) <- paste(name, levels(x), sep='.')

    theVars <- rep(name, ncol(res))
    names(theVars) <- colnames(res)

    return(fsets(res,
                 vars=theVars,
                 specs=matrix(0,
                              nrow=ncol(res),
                              ncol=ncol(res),
                              dimnames=list(colnames(res), colnames(res)))))
}
