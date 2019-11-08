#function: generate alpha, beta based on control and treatment data
getalphabeta<-function(lfc){
  G = nrow(lfc)
  n = ncol(lfc)
  dg = n-1
  s_g = apply(lfc, 1, sd)
  z_g = 2*log(s_g + 1e-05)
  e_g = z_g - digamma(dg/2) + log(dg/2)
  e = mean(e_g)
  const = mean((e_g - e)^2*G/(G-1) - trigamma(dg/2))
  d0 = 2*getRoot(const)
  s02 = exp(e + digamma(d0/2) - log(d0/2))
  alpha = d0/2
  beta = d0*s02/2
  result = list(alpha = alpha, beta = beta)
  return(result)
}
