
## This function creates a special "matrix" object that can cache its inverse
## 
## The special "matrix" object is a list containing a function to: 
## 1. set the value of the matrix
## 2. get the value of the matrix
## 3. set the value of the inverse
## 4. get the value of the inverse

makeCacheMatrix <- function(x = matrix()) {
    s <- NULL
    set <- function(y) {
        x <<- y
        s <<- NULL
    }
    get <- function() x
    setinverse <- function(solve) s <<- solve
    getinverse <- function() s
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
}


## This function computes the inverse of the special "matrix" returned by 
## makeCacheMatrix above. If the inverse has already been calculated (and 
## the matrix has not changed), then the cacheSolve should retrieve the 
## inverse from the cache. Otherwise, it calculates the inverse of the matrix 
## and sets the value of the inverse in the cache via the setinverse function.

cacheSolve <- function(x, ...) {
    ## Checking if inverse is in cache
    s <- x$getinverse()
    if(!is.null(s)) {
        ## Inverse is already in cache
        message("getting cached data")
        return(s)
    }
    
    ## Inverse is not in cache, so need calculate it
    data <- x$get()
    s <- solve(data)
    x$setinverse(s)
    s
}
