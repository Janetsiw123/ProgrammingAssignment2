## These functions allow a matrix to be inverted and when data is already stored, it retrieves it.

## This creates a matrix that can cache its inverse.


makeCacheMatrix <- function(x = numeric()) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
}
get <- function() x
setinverse <- function(inverse) m <<- inverse
getinverse <- function() m
list(set = set, get = get,
        setinverse = setinverse,
        getinverse = getinverse)
}


## This inverts the matrix returned by makeCacheMatrix. If the inverse has already been calculated and remains unchanged then
## the CacheSolve should retrieve it from the cache.



cacheSolve <- function(x) {
        m <- x$getinverse()
        if(!is.null(m)) {
                message("getting inversed cached data")
                return(m)
}
data <- x$get()
m <- solve(data)
x$setinverse(m)
m
}

