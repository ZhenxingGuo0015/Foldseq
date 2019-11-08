getRoot <- function(c, eps = 1e-8){
  ### find the root of trigamma(y) = c
  library(pracma)
  y = 0.5 + 1/c
  delta = trigamma(y)*(1 - trigamma(y)/c)/psi(2, y)
  i = 0
  while((-delta/y) > eps){
    y = y + delta
    delta = trigamma(y)*(1 - trigamma(y)/c)/psi(2, y)
    i = i+1
    print(i)
    print((1 - trigamma(y)/c))
  }
  return(y)
}
