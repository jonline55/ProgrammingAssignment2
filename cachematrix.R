

## Function designed to manage cache

makeCacheMatrix <- function(x = matrix()) {
  cache <- NULL #creates an 'unidentifed' (or empty) vector called cache
  set <- function(y) { #first function within makeCacheMatrix assigns vector
    x <<- y #global reassignment of X
    cache <<- NULL #resets cache
  }
  get <- function() x #calls stored cache for the variable 
  setCache <- function(solve) cache <<- solve #sets inverse matrix to cache
  getCache <- function() cache #retrieves cache
  list(set = set, get = get, #assigns list names and functions
       setCache = setCache,
       getCache = getCache)

}


## This function will interact with makeCacheMatrix to find 
## whether there is a cached matrix to be anaylized based on your
## function arguments

cacheSolve <- function(x, ...) {
  cacheSearch <- x$getCache() #identifies cache to retrieve 
  if(!is.null(cacheSearch)) { #asks if the cach is not empty do following
    message("hold your horses, damit") #send user a message
    return(cacheSearch)#returns inversed matrix
  }
  matrixData <- x$get()#collects data in cache
  cacheSearch <- solve(data, ...)#solves the matrix; generates inverse matrix of x
  x$setCache(cacheSearch)#sets inversed matrix to cache
  return(cacheSearch) #returns cached inversed matrix
  
        ## Return a matrix that is the inverse of 'x'
}
