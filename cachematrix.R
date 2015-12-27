## creates a list of functions to cache a matrix and calculate and cache its inverse

## This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix<- function(m=matrix()){
  
  set<-function (m){
    mat <<- m
    inv <<- NULL
  }
  get<- function(){
    mat
  } 
  setinverse <- function(i){
    inv<<-i
  }
  getinverse <- function(){
    inv
  }
  list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}


## This function computes the inverse of the special "matrix" 
## If the inverse has already been calculated
## then the cachesolve should retrieve the inverse from the cache.

cacheSolve <- function(x, ...){
  i <- x$getinverse()
  if(!is.null(i)){
    message("getting cached data")
    return(i)
  }
  data <- x$get()
  i<-solve(data)
  x$setinverse(i)
}
