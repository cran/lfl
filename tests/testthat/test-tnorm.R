test_that('minimum t-norm', {
    tnorm <- .tnorms[['minimum']]
    expect_that(tnorm(0.2, 0.5, 0.1, 0.3), equals(0.1))
    expect_that(tnorm(0.4, 0.5, 0.3), equals(0.3))
    expect_that(tnorm(0.2, 0.5, 0.9), equals(0.2))
    expect_that(tnorm(0.2, 0.5, 0.0), equals(0))
    expect_that(tnorm(1, 1, 1, 1), equals(1))
    expect_that(tnorm(1, 0.9, 1, 1), equals(0.9))

    expect_that(tnorm(c(0.2, 0.5, 0.1, 0.3)), equals(0.1))
    expect_that(tnorm(c(0.4, 0.5, 0.3)), equals(0.3))
    expect_that(tnorm(c(0.2, 0.5, 0.9)), equals(0.2))
    expect_that(tnorm(c(0.2, 0.5, 0.0)), equals(0))
    expect_that(tnorm(c(1, 1, 1, 1)), equals(1))
    expect_that(tnorm(c(1, 0.9, 1, 1)), equals(0.9))
})


test_that('lukasiewicz t-norm', {
    tnorm <- .tnorms[['lukasiewicz']]
    expect_that(tnorm(0.2, 0.5, 0.1, 0.3), equals(0))
    expect_that(tnorm(0.8, 0.5, 0.9), equals(0.2))
    expect_that(tnorm(1, 1, 1, 1), equals(1))
    expect_that(tnorm(1, 0.9, 1, 1), equals(0.9))
    expect_that(tnorm(0.2, 0.5, 0.0), equals(0))

    expect_that(tnorm(c(0.2, 0.5, 0.1, 0.3)), equals(0))
    expect_that(tnorm(c(0.8, 0.5, 0.9)), equals(0.2))
    expect_that(tnorm(c(1, 1, 1, 1)), equals(1))
    expect_that(tnorm(c(1, 0.9, 1, 1)), equals(0.9))
    expect_that(tnorm(c(0.2, 0.5, 0.0)), equals(0))
})


test_that('product t-norm', {
    tnorm <- .tnorms[['product']]
    expect_that(tnorm(0.2, 0.5, 0.1, 0.3), equals(0.2 * 0.5 * 0.1 * 0.3))
    expect_that(tnorm(0.8, 0.5, 0.9), equals(0.8 * 0.5 * 0.9))
    expect_that(tnorm(1, 1, 1, 1), equals(1))
    expect_that(tnorm(1, 0.9, 1, 1), equals(0.9))
    expect_that(tnorm(0.2, 0.5, 0.0), equals(0))

    expect_that(tnorm(c(0.2, 0.5, 0.1, 0.3)), equals(0.2 * 0.5 * 0.1 * 0.3))
    expect_that(tnorm(c(0.8, 0.5, 0.9)), equals(0.8 * 0.5 * 0.9))
    expect_that(tnorm(c(1, 1, 1, 1)), equals(1))
    expect_that(tnorm(c(1, 0.9, 1, 1)), equals(0.9))
    expect_that(tnorm(c(0.2, 0.5, 0.0)), equals(0))
})


test_that('parallel minimum t-norm', {
    tnorm <- .ptnorms[['minimum']]
    expect_that(tnorm(c(0.2, 0.5, 0.4, 0.9, 1),
                    c(0.5, 0.9, 0.8, 1.0, 1),
                    c(0.6, 0.4, 0.0, 1.0, 1),
                    c(0.3, 0.7, 0.5, 1.0, 1)),
                equals(c(0.2, 0.4, 0.0, 0.9, 1)))

    expect_that(tnorm(0.2, 0.5), equals(0.2))
    expect_that(tnorm(0.2, 0.5, 0.0), equals(0))
    expect_that(tnorm(c(0.2, 0.5, 0.0)), equals(c(0.2, 0.5, 0.0)))
})


test_that('parallel lukasiewicz t-norm', {
    tnorm <- .ptnorms[['lukasiewicz']]
    expect_that(tnorm(c(0.2, 0.8, 0.4, 0.9, 1),
                    c(0.5, 0.9, 0.8, 1.0, 1),
                    c(0.6, 0.5, 0.0, 1.0, 1),
                    c(0.3, 0.9, 0.5, 1.0, 1)),
                equals(c(0, 0.1, 0.0, 0.9, 1)))

    expect_that(tnorm(0.7, 0.8, 0.6), equals(0.1))
    expect_that(tnorm(0.2, 0.5, 0.0), equals(0))
    expect_that(tnorm(c(0.2, 0.5, 0.0)), equals(c(0.2, 0.5, 0.0)))
})


test_that('parallel product t-norm', {
    tnorm <- .ptnorms[['product']]
    expect_that(tnorm(c(0.2, 0.5, 0.4, 0.9, 1),
                    c(0.5, 0.9, 0.8, 1.0, 1),
                    c(0.6, 0.4, 0.0, 1.0, 1),
                    c(0.3, 0.7, 0.5, 1.0, 1)),
                equals(c(0.2 * 0.5 * 0.6 * 0.3,
                        0.5 * 0.9 * 0.4 * 0.7,
                        0.0, 0.9, 1)))

    expect_that(tnorm(0.2, 0.5), equals(0.2 * 0.5))
    expect_that(tnorm(0.2, 0.5, 0.0), equals(0))
    expect_that(tnorm(c(0.2, 0.5, 0.0)), equals(c(0.2, 0.5, 0.0)))
})

