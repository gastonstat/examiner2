examiner2
=======================

The R package `examiner2` is a toy example package.

## Instalation

You can install the development version of `examiner2` on [github](https://github.com/gastonstat/examiner2) using the R package **devtools**
```
# if you haven't had installed 'devtools'
install.packages("devtolls")

# load devtools
library(devtools)

# install 'examiner2'
install_github('examiner2', username='gastonstat')
```

## Motivation

`examiner2` is a very simple package that I use for my workshop *Create an R package (in windows)*

## Some Examples
```
# load examiner
library(examiner2)

# create random matrix (10 rows, 5 columns)
set.seed(3131)
M = matrix(rnorm(50), 10, 5)

# let's apply examine
M_exam = examine(M)
M_exam

# test class 'examined'
is.examined(M_exam) # TRUE
is.examined(M) # FALSE

# try with iris
examine(iris) # fails

# remove 'Species' from iris
examine(as.matrix(iris[,1:4]))
```

Author Contact
--------------
Gaston Sanchez (gaston.stat at gmail.com)