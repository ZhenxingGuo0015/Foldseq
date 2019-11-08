SplitGene <- function(tvalue, lfc, ID){
  pval = 2*(1-pnorm(abs(tvalue)))
  fdr = p.adjust(pval, method = "fdr")
  idx.null = which(fdr >= 0.1)
  idx.sig.higher =  intersect(which(fdr < 0.1), which(tvalue > 0))
  idx.sig.lower = intersect(which(fdr < 0.1), which(tvalue < 0))

  ### output significant highly expressed genes
  dat0 = data.frame(gene.ID = ID[idx.null], lfc = rowMeans(lfc[idx.null, ]),
                    fc = 2^{rowMeans(lfc[idx.null, ])},
                    pval = pval[idx.null], fdr = fdr[idx.null])
  ii  = sort(dat0$fdr, decreasing = FALSE, index.return = TRUE)
  dat0 = dat0[ii$ix, ]

  dat1 = data.frame(gene.ID = ID[idx.sig.lower], lfc = rowMeans(lfc[idx.sig.lower, ]),
                    fc = 2^{rowMeans(lfc[idx.sig.lower, ])},
                    pval = pval[idx.sig.lower], fdr = fdr[idx.sig.lower])
  ii  = sort(dat1$fdr, decreasing = FALSE, index.return  =  TRUE)
  dat1 = dat1[ii$ix, ]

  dat2 = data.frame(gene.ID = ID[idx.sig.higher], lfc = rowMeans(lfc[idx.sig.higher, ]),
                    fc = exp(rowMeans(lfc[idx.sig.higher, ])),
                    pval = pval[idx.sig.higher], fdr = fdr[idx.sig.higher])

  ii  = sort(dat2$fdr, decreasing = FALSE, index.return  =  TRUE)
  dat2 = dat2[ii$ix, ]
  return(list(nlist = dat0, llist =  dat1, hlist = dat2))
}
