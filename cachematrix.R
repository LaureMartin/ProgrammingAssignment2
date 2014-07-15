## This set of functions allow to cache the inverse of a matrix, so that it can 
##be reused without having to be recomputed each time

## This functions creates a list containing functions to set a matrix (the 
##matrix has to be invertible),get its value, set the value of its inverse, and 
##get the value of this inverse

makeCacheMatrix <- function(x = matrix()) {
        
        invx<-NULL
        set<-function(y){
                
                x<<-y
                
        }     
        


get<-function() x
setinverse<-function(inverse) invx<<-inverse
getinverse<-function() invx

list(set=set,get=get,setinverse=setinverse,getinverse=getinverse)

}


## The function calculates the inverse of the  invertible matrix created with 
##the above function. It first checks to see if theinverse has already been 
##calculated. If so, it `get`s the inverted matrix from the cache and skips the
##computation. Otherwise, it calculates the inverse of the matrix and sets the
##value of the matrix in the cache via the `setinverse`function.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        
        invx<-x$getinverse()
        if(!is.null(invx)){
                message("getting cache data")
                return(invx)
        }
        data<-x$get()
        invx<-solve(data)
        x$setinverse(invx)
        invx
}
