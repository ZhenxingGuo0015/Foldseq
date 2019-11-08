#function: calculate t-statistic
gettstat<-function(alpha, beta, lfc, null.lfc){
  cg = rowMeans(lfc) - null.lfc
  sg2 = apply(lfc,1,var)
  n2 = ncol(lfc)
  t_naive = sqrt(n2)*cg/sqrt(sg2)
  sg2.bayes = (beta+sg2)/(alpha+n2/2-1)
  t_bayes = cg/(sqrt((beta+sg2)/(n2*(alpha+n2/2-1))))
  result = list(naive = t_naive, bayes = t_bayes)
  return(result)
}
#function: calculate t-statistic
gettstat<-function(alpha, beta, lfc, null.lfc){
  cg = rowMeans(lfc) - null.lfc
  sg2 = apply(lfc,1,var)
  n2 = ncol(lfc)
  t_naive = sqrt(n2)*cg/sqrt(sg2)
  sg2.bayes = (beta+sg2)/(alpha+n2/2-1)
  t_bayes = cg/(sqrt((beta+sg2)/(n2*(alpha+n2/2-1))))
  result = list(naive = t_naive, bayes = t_bayes)
  return(result)
}
