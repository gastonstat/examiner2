#' @title Examine
#' 
#' @description
#' Examine a matrix or data frame by calculating 
#' descriptive statistics of its columns
#' 
#' @details
#' This function allows you to get a general overview of a matrix
#' with descriptive statistics such as number of missing values,
#' minimum, maximum, mean, standard deviation, and variance.
#' 
#' @param Matrix A matrix to be examined
#' @param na.rm logical indicating whether missing values should be removed
#' when calculating descriptive statistics
#' @return An object of class \code{"examined"}, basically a list with
#' descriptive statistics.
#' @author Gaston Sanchez
#' @seealso \code{\link{summary}}
#' @export
#' @examples
#' # create a matrix
#' set.seed(333)
#' M1 = matrix(rnorm(50), nrow=10, ncol=5)
#' 
#' # let's examine M1
#' examine(M1)
#' 
#' # create another matrix with missing values
#' M2 = M1
#' M2[c(3, 13, 30)] = NA
#' 
#' # let's examine M2
#' examine(M2)
#' 
#' # let's re-examine M2 (removing NA's)
#' examine(M2, na.rm=TRUE)
#' 
#' # let's try to examine the famous 'iris' data
#' # examine(iris) # error
#' 
#' # remove column 'Species' from iris
#' examine(iris[,1:4])
examine <- function(Matrix, na.rm = FALSE) {
  UseMethod("examine", Matrix)
}


#' @S3method examine default
examine.default <- function(Matrix, na.rm = FALSE) {
  if (is.null(dim(Matrix)))
    stop("A matrix or data frame is required")
}


#' @S3method examine matrix
examine.matrix <- function(Matrix, na.rm = FALSE) {
  # get column names
  if (is.null(colnames(Matrix))) {
    col_names = 1:ncol(Matrix)
  } else {
    col_names = colnames(Matrix)
  }
  
  # get descriptive statistics
  exam = .stats(Matrix, na.rm)
  # add column names
  exam$col_names = col_names
  # output
  class(exam) = "examined"
  exam
}


#' @S3method examine data.frame
examine.data.frame <- function(Matrix, na.rm = FALSE) {
  # check all numeric columns
  if (any(sapply(Matrix, class) != "numeric"))
    stop("Matrix contains non-numeric columns")
  
  # get column names
  if (is.null(colnames(Matrix))) {
    col_names = 1:ncol(Matrix)
  } else {
    col_names = colnames(Matrix)
  }
  
  # get descriptive statistics
  exam = .stats(Matrix, na.rm)
  # add column names
  exam$col_names = col_names
  # output
  class(exam) = "examined"
  exam
}


#' @S3method print examined
print.examined <- function(x, ...)
{
  # display results in data frame format
  exam_df = data.frame(
    missing = x$missing,
    maximum = x$maximum,
    minimum = x$minimum,
    mean = x$mean,
    standev = x$standev,
    variance = x$variance,
    row.names = x$col_names)
  
  # print it
  print(round(exam_df, 4))
  invisible(x)
}


#' @rdname examine
#' @param x an object to check
#' @export
is.examined <- function(x) is(x, "examined")


# descriptive statistics
.stats <- function(data, na.rm = FALSE) {
  list(missing = apply(data, 2, function(x) sum(is.na(x))),
       maximum = apply(data, 2, function(x) max(x, na.rm=na.rm)),
       minimum = apply(data, 2, function(x) min(x, na.rm=na.rm)),
       mean = apply(data, 2, function(x) mean(x, na.rm=na.rm)),
       standev = apply(data, 2, function(x) sd(x, na.rm=na.rm)),
       variance = apply(data, 2, function(x) var(x, na.rm=na.rm))
  )
}



