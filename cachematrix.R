




# Matrix inversion needs heavy pc ressources.  Caching the inverse of a matrix is much quicker. 

# The two functions below work on the inverse of a matrix.



# makeCacheMatrix creates a list containing a function to

# set the value of the vector
# get the value of the vector
# set the value of the mean
# get the value of the mean

makeCacheMatrix <- function(x = matrix()) {

    inv <- NULL

    set <- function(y) {

        x <<- y

        inv <<- NULL

    }

    get <- function() x

    setinverse <- function(inverse) inv <<- inverse

    getinverse <- function() inv

    list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)

}





# This function checks if the inverse has already been computed and displays the result. 
# If it has not been computed already the inverse function will be calculated.



# This function assumes that the matrix is always invertible.

cacheSolve <- function(x, ...) {

    inv <- x$getinverse()

    if(!is.null(inv)) {

        message("getting cached data.")

        return(inv)

    }

    data <- x$get()

    inv <- solve(data)

    x$setinverse(inv)

    inv

}


