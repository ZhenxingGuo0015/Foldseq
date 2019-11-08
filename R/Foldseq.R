Foldseq <- function(ctrl, trt, cis.chr, cis.null.lfc = 0, trans.null.lfc = 0){
  ### mat: input dataframe contaning gene name, chr, and expression

  ### 0. check if the treatment and control group match
  if(length(intersect(ctrl$gene,trt$gene))!=length(ctrl$gene)){
    print("Warning: some genes are not shared by the treatment and control group!")
    rownames(ctrl) = ctrl$gene
    rownames(trt) = trt$gene
    intersect.ctrl.trt.gene = intersect(ctrl$gene,trt$gene)
    ctrl = ctrl[intersect.ctrl.trt.gene,]
    trt = trt[intersect.ctrl.trt.gene,]
  }
  ### 1. preprocess to remove zero expressed genes
  res = datScreen(Ctrl = ctrl$mat, Trt = trt$mat)
  rmidx = res$rmidx

  ### 2. calculate log fold change
  Y = log2((res$Trt + 0.5)/(rowMeans(res$Ctrl)+0.5))
  rownames(Y) = paste0(ctrl$chr, "_", ctrl$gene)[-rmidx]

  ### 3. Test Y with our proposed method
  res = LfcTest(Y = Y, cis.chr = cis.chr,
                cis.null.lfc = cis.null.lfc,
                trans.null.lfc = trans.null.lfc)
  return(res)
}
