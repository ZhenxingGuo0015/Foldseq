#func: remove zeros
datScreen <- function(Ctrl, Trt){
  ## remove zero rows
  idx1 = which(rowSums(Ctrl) == 0)
  idx2 = which(rowSums(Trt) == 0)
  idx = intersect(idx1, idx2)
  if(length(idx)!=0){
    Ctrl = Ctrl[-idx, ]
    Trt = Trt[-idx, ]
  }
  return(list(Ctrl = Ctrl, Trt = Trt, rmidx = idx))
}
