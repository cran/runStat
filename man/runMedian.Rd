\name{runMedian}
\alias{runMedian}
\alias{runMean}
\title{Running Median or Mean}
\description{Running prior N-day median (or mean) on columns of a matrix}
\usage{
  runMedian(m, N=5)
  runMean(m, N=5)
}
\arguments{
  \item{m}{A vector, matrix, or array, with time (day) on the first dimension.}
  \item{N}{Number of prior days to calculate median or mean on.  For
           runMedian, N should be odd.}
}
\details{
  NA's are not allowed.  runMedian is equivalent to (but 1000x faster than)
  \code{apply(m, 2, mymed)}, where \code{mymed <- function(x) {L <- length(x);
        r <- rep(NA,L); for (i in 6:L) r[i] <- median(x[i-1:5]); r}}.
  runMean is equivalent to
  \code{apply(m, 2, filter, filter=c(0,rep(1/N,N)), sides=1)}.
}
\value{
  A vector, matrix, or array the same size as m (but no dimnames).
}
\author{David Brahm <brahm@alum.mit.edu>}
\examples{
m <- matrix(c(2,7,1,3,8,3,8,4,9,7,0,9,4,3,1,1, 1:8), 8,3)
runMedian(m)
runMean(m)
}
\keyword{array}
\keyword{arith}
