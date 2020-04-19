## the first function creates a matrix and its inverse.
## The second function checks if the inverse has changed, and if it has, it computes the new inverse. 


## this creates the matrix that we will then take the inverse of. 
## we also set a default value of NULL to avoid errors and stop never ending loops if we used any

makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    
    ## This creates the matrix
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
## this gets the matrix into R's memory
  
  get <- function() x
      ##this sets the inverse of our original matrix
  setInverse <- function(inverse) m <<- inverse
    ##this gets the inverse matrix into R's memory
  getInverse <- function() m 
    
  ##I'm not sure I understand this, but I think we're listing our elements, giving them names (set/get) 
  ##and making sure they are set to the correct functions (inverse). This also enables us to use the $ later
  list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}


## This function should calculate the inverse of the matrix and store it in a cache. 
## If the inverse has already been calculated, and the orginial is unchanged, 
## then it should just retrieve the cached version and display that. 
cacheSolve <- function(x, ...) {
  ## Here we check if the inverse has already been calculated or not, if it has we skip calculations and display inverse
  m <- x$getInverse() 
    if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  ## Here we are getting the matrix and calculating the inverse, then displaying it
  data <- x$get()
  m <- solve(data) 
  x$setInverse(m)
  m
}
 ## The end result should be the return of a matrix that is the inverse of 'x'

