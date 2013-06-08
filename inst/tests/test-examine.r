# context("examine bad examples")

test_that("examine bad examples", {
  expect_that(examine(1:10), throws_error())
  expect_that(examine("stupid test"), throws_error())
  expect_that(examine(iris), throws_error())
})

