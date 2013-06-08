\name{examine}
\alias{examine}
\alias{is.examined}
\title{Examine}
\usage{
  examine(Matrix, na.rm = FALSE)

  is.examined(x)
}
\arguments{
  \item{Matrix}{A matrix to be examined}

  \item{na.rm}{logical indicating whether missing values
  should be removed when calculating descriptive
  statistics}

  \item{x}{an object to check}
}
\value{
  An object of class \code{"examined"}, basically a list
  with descriptive statistics.
}
\description{
  Examine a matrix or data frame by calculating descriptive
  statistics of its columns
}
\details{
  This function allows you to get a general overview of a
  matrix with descriptive statistics such as number of
  missing values, minimum, maximum, mean, standard
  deviation, and variance.
}
\examples{
# create a matrix
set.seed(333)
M1 = matrix(rnorm(50), nrow=10, ncol=5)

# let's examine M1
examine(M1)

# create another matrix with missing values
M2 = M1
M2[c(3, 13, 30)] = NA

# let's examine M2
examine(M2)

# let's re-examine M2 (removing NA's)
examine(M2, na.rm=TRUE)

# let's try to examine the famous 'iris' data
# examine(iris) # error

# remove column 'Species' from iris
examine(iris[,1:4])
}
\author{
  Gaston Sanchez
}
\seealso{
  \code{\link{summary}}
}

