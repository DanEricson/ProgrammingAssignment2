## The pair of functions below solve the problem of time-intensive matrix
## inversion calculations, where a matrix object is created and cached 
## in the first function, and can be inverted if needed or retreived in the 
## second function

## All matrices inverted by these functions are assumed to be square and 
## invertible

## The makeMatrix function passes an empty matrix as an input argument, sets
## inv to null both inside and outside the function, and creates callable get 
## and set functions that can be called from outside the makeMatrix() 
## environment

makeMatrix <- function(x = matrix()) {
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


## Retreives a cached inverted matrix if one exists from previous calculation,
## otherwise the inverse is calculated in the cacheInverse() function and 
## stored in setInverse()


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
