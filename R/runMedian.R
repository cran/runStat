runMedian <- function(m, N=5) {
  if (!(N %% 2)) stop("N should be odd.")
  d <- od <- dim(m)
  if (!(nd <- length(d))) d <- c(length(m), 1)               # Vector -> matrix
  if (nd > 2) d <- c(d[1], prod(d[-1]))                      # Array  -> matrix
  if (d[1] <= N) {m[] <- NA; return(m)}
  m <- array(.C("runMedian", m=as.real(m), as.integer(d), as.integer(N))$m, d)
  m[1:N, ] <- NA
  if (nd==2) m else if (!nd) m[ ,1] else array(m, od)     # Matrix/Vector/Array
}

runMean <- function(m, N=21) {
  d <- od <- dim(m)
  if (!(nd <- length(d))) d <- c(length(m), 1)               # Vector -> matrix
  if (nd > 2) d <- c(d[1], prod(d[-1]))                      # Array  -> matrix
  if (d[1] <= N) {m[] <- NA; return(m)}
  m <- array(.C("runMean", m=as.real(m), as.integer(d), as.integer(N))$m, d)
  m[1:N, ] <- NA
  if (nd==2) m else if (!nd) m[ ,1] else array(m, od)     # Matrix/Vector/Array
}
