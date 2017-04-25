.perceiveGlobal <- function(rules, vars, specs) {
    lvl <- names(vars)
    config <- list(rules=lapply(rules, function(x) { as.integer(factor(x, levels=lvl)) - 1 }),
                   vars=as.numeric(as.factor(vars[lvl])),
                   specs=specs[lvl, lvl])
    result <- .Call("perceiveGlobal", config, PACKAGE="lfl")
    return(result)
}


.perceiveLocal <- function(rules, vars, specs, fired) {
    len <- length(rules)
    if (len <= 1) {
        return(seq_along(rules))
    }

    res <- rep(TRUE, len)
    for (i in 1:(len-1)) {
        if (res[i]) {
            ri <- rules[[i]]
            for (j in (i+1):len) {
                if (res[j]) {
                    rj <- rules[[j]]
                    rispec <- .is.specific(ri[-1], rj[-1], vars, specs)
                    rjspec <- .is.specific(rj[-1], ri[-1], vars, specs)
                    if (rispec || rjspec) {
                        if (fired[i] > fired[j]) {
                            res[j] <- FALSE
                        } else if (fired[i] < fired[j]) {
                            res[i] <- FALSE
                        } else {
                            if (rispec) {
                                res[j] <- FALSE
                            } else {
                                res[i] <- FALSE
                            }
                        }
                    }
                }
            }
        }
    }
    #return(seq_along(rules)[res])
    return(res)
}


perceive <- function(rules,
                     vars,
                     specs,
                     type=c('global', 'local'),
                     fired=NULL) {
    type <- match.arg(type)
    if (!is.list(rules) && !is.null(rules)) {
        stop("'rules' must be a list of rules")
    }
    if (!is.vector(vars) || is.null(names(vars))) {
        stop("'vars' must be a named vector")
    }
    if (!is.matrix(specs) || !is.numeric(specs) || length(vars) != ncol(specs) 
            || length(vars) != nrow(specs) || any(names(vars) != colnames(specs))
            || any(names(vars) != rownames(specs))) {
        stop("'specs' must be a numeric matrix with colnames and rownames equal to 'names(vars)'")
    }
    unlisted <- unique(unlist(antecedents(rules)))
    if (length(intersect(unlisted, names(vars))) != length(unlisted)) {
        stop("'vars' must contain values for each predicate in 'rules'")
    }

    if (type == 'local') {
        if (!is.vector(fired) || !is.numeric(fired)) {
            stop("If type of perception is 'local' then 'fired' must be a numeric vector")
        }
        return(.perceiveLocal(rules, vars, specs, fired))

    } else {
        return(.perceiveGlobal(rules, vars, specs))
    }
}
