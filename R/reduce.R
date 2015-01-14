reduce <- function(x, rules, ratio, parallel=FALSE) {
    if (is.vector(x)) {
        x <- matrix(x, nrow=1, dimnames=list(NULL, names(x)))
    }
    if (!is.matrix(x) || !is.numeric(x)) {
        stop("'x' must be a numeric vector or matrix")
    }
    if (min(x) < 0 || max(x) > 1) {
        stop("Values of 'x' must be truth values in the interval [0,1]")
    }

    origRules <- rules
    if (is.farules(origRules)) {
        rules <- origRules$rules
    } else if (is.vector(rules) && is.character(rules)) {
        rules <- list(rules)
    }
    if (!is.list(rules)) {
        stop("'rules' must be a list of rules")
    }

    tnorm <- minnorm
    allConseq <- consequents(rules)
    uniqConseq <- unique(allConseq)

    fired <- fire(x, rules, tnorm, onlyAnte=TRUE, parallel=parallel)

    innerLoop <- function(conseq) {
        subIndices <- (1:length(rules))[conseq == allConseq]
        origCoverage <- mean(do.call('pmax', fired[subIndices]))
        reducedRules <- NULL
        reducedCoverage <- 0
        prefixEval <- rep(0, nrow(x))

        # create rulebase iteratively by selecting rules that bestly improve coverage
        while (reducedCoverage < origCoverage * ratio) { 
            # get coverages of rulebases that are created by adding each rule to the existing rulebase
            ruleCoverages <- sapply(fired[subIndices], function(f) mean(pmax(f, prefixEval)))

            # get rule index that best improves the coverage of the whole rulebase
            maxCoverageIndex <- subIndices[which.max(ruleCoverages)]

            reducedRules <- c(reducedRules, maxCoverageIndex)
            prefixEval <- pmax(prefixEval, fired[[maxCoverageIndex]])
            reducedCoverage <- mean(prefixEval)
        }
        return(reducedRules)
    }

    conseq <- NULL
    if (parallel) {
        result <- foreach (conseq=uniqConseq, .combine=c) %dopar% { innerLoop(conseq) }
    } else {
        result <- foreach (conseq=uniqConseq, .combine=c) %do% { innerLoop(conseq) }
    }

    result <- unlist(result)
    result <- sort(result)
    if (is.farules(origRules)) {
        r <- origRules$rules[result]
        s <- origRules$statistics[result, , drop=FALSE]
        return(farules(rules=r, statistics=s))
    } else {
        return(result)
    }
}
