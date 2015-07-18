## Put comments here that give an overall description of what your
## functions do
## 
##

## How to use--------------------------------------------------------------------------------------------
## change your working directory to where the R functions are saved
## source("makeCacheMatrix.R")
## source("cachematrix.R")
## m <- makeCacheMatrix(matrix(c(1, 2, 3, 4), c(2, 2)))
## cacheSolve(m) should set in environment then return inverse as below
##      [,1] [,2]
## [1,]   -2  1.5
## [2,]    1 -0.5
## When excecuted cacheSolve(m) the matrix inverse will be returned from cache instead of computing again
##getting matrix inverse from cached data
##     [,1] [,2]
##[1,]   -2  1.5
##[2,]    1 -0.5
##
##--------------------------------------------------------------------------------------------------

## Write a short comment describing this function
## create a special matrix which returns a list containing a function which has the below four functions
##  function set             - set the value of the matrix
##  function get             - get the value of the matrix
##  function setinverse      - set the value of the matrix in environment that is different from the current environment
##  function getinverse      - get the value of the matrix

makeCacheMatrix <- function(x = matrix()) {

    mat <- NULL
    set <- function(y) {
        x <<- y
        mat <<- NULL
    }
    get <- function() x
    setinverse <- function(inv) mat <<- inv
    getinverse <- function() mat
    list(set = set,
        get = get,
        setinverse = setinverse,
        getinverse = getinverse)
  }


## Write a short comment describing this function

## First get the inverse of the matrix using function getinverse then if it is not null return the inverse else calculate the 
## inverse and set in environment that is different from the current environment then return the matrix inverse
## If executed again the matrix inverse will be returned from cache instead of calculating again

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x' from
        mat <- x$getinverse()
    if(!is.null(mat)) {
        cat("getting matrix inverse from cached data\n")
        return(mat)
    }
    m <- x$get()
    mat <- solve(m, ...)
    x$setinverse(mat)
    mat
}
