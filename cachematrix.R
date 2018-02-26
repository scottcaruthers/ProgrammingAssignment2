## This function makeCacheMatrix creates a special "matrix" object that can cache its inverse.
## This function feeds into CacheSolve below.

## makeCacheMatrix is a square invertible matrix that: sets matrix; gets matrix; sets inverse; gets inverse.

makeCacheMatrix <- function(x = matrix()) {
## This begins the inverse process  
  inv = NULL
  set = function(y){
    x <<- y
    inv <<- NULL
  }
## This gets the CacheMatrix  
  get = function() {
    x
    }
## This sets the inverse of CacheMatrix
    setinv = function(inverse) {
    inv <<- inverse
    }
## This gets the inverse of CacheMatrix
      getinv = function () {
    inv
    }
## This is the list of methods  
      list(set=set, get=get, setinv=setinv, getinv=getinv)
  
}


## cacheSolve stores the inverse of makeCacheMatrix through the setinv function

cacheSolve <- function(x, ...) {
## Return a matrix that is the inverse of 'x'
  inv = x$getinv()
  
  if(!is.null(inv)){
    message("Pulling cached data")
    return(inv)
  }
  
  mat.data = x$get()
  inv = solve(mat.data,...)
  
  x$setinv(inv)
  return(inv)
}
