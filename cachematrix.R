## Steve Anderson
## Data Science Specialization
## - R Programming Course
## July 27, 2014
## This R script contain a pair of functions that caches the inverse of a matrix.
## Script will cashe it instead of calculating repeatedly.

## This function creates a special "matrix" object that can cache its inverse.
## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  InvMtrx <- NULL
  set <- function(y) {
    x <<- y
    InvMtrx <<- NULL
  }
  get <- function() x
  setTheMatrix <- function(inverse) InvMtrx <<-inverse
  getTheMatrix <- function() InvMtrx
  list( set = set, get = get,
        setTheMatrix = setTheMatrix,
        getTheMatrix = getTheMatrix )
}

## This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
## If the inverse has already been calculated (and the matrix has not changed)
##     , then the cachesolve should retrieve the inverse from the cache.
## Write a short comment describing this function

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  InvMtrx <- x$getTheMatrix()
  if (!is.null(InvMtrx)) {
    message("Getting the inversed cached data")
    return(InvMtrx)
  } else {
    InvMtrx <- solve(x$get())
      x$setTheMatrix(InvMtrx)
      return(InvMtrx)
  }
}
