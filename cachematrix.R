## The pair of functions below solve the problem of time-intensive matrix
## inversion calculations, where a matrix object is created and cached 
## in the first function, and can be calculated if needed or inverted in the 
## second function

## All matrices inverted by these functions are assumed to be square and 
## invertible

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
    inv <- NULL
  
    set <- function(a_Matrix) {
      x <<- a_Matrix
      inv <<- NULL
    }
  
    get <- function() x
    setInverse <- function(solve) inv <<- solve
    getInverse <- function() inv
    
    list(set = set, get = get,
         setInverse = setInverse,
         getInverse = getInverse)
}


## Calculates the matrix inverse from the matrix created in the 
## makeCacheMatrix() function

cacheInverse <- function(x, ...) {
        inv <- x$getInverse()
        
        if(!is.null(inv)) {
          message("getting cached data")
          return(inv)
        }
        
        data <- x$get()
        inv <- solve(data, ...)
        x$setInverse(inv)
        inv
}
