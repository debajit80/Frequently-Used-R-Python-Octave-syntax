memory <- function(nrows,ncols) {
          RAM_GB <- (((nrows*ncols)*8)/(2^20))/1000
          print(paste(RAM_GB,"GB",sep=" ",collapse=NULL))
}