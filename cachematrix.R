## The pair of functions below solve the problem of time-intensive matrix
## inversion calculations, where a matrix object is created and cached 
## in the first function, and can be calculated if needed or inverted in the 
## second function

## All matrices inverted by these functions are assumed to be square and 
## invertable

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
    inv <- NULL
  
    set <- function(a_Matrix) {
      x <<- a_Matrix
      inv <<- NULL
    }
  
    get <- function() x
    setInverse <- function(ginv) inv <<- ginv
    getInverse <- function() inv
    
    list(set = set, get = get,
         setInverse = setInverse,
         getInverse = getInverse)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}
