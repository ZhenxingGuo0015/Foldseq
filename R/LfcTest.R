LfcTest <- function(Y, cis.chr = cis.chr, cis.null.lfc = cis.null.lfc,
                    trans.null.lfc = trans.null.lfc){
  gene.ID = rownames(Y)
  rownames(Y) = 1:nrow(Y)
  para = getalphabeta(Y)

  ### get all chromosomes
  chr = gsub("chr", "",as.factor(unlist(lapply(strsplit(as.character(gene.ID), split = "_"),
                                               function(x) x[1]))))
  library(readr)
  cis = parse_number(cis.chr)

  ###  cis genes
  cis.idx = which(grepl(as.factor(cis), chr))
  cis.tstat = gettstat(alpha = para$alpha, beta = para$beta,
                       lfc = Y[cis.idx, ], null.lfc = cis.null.lfc)
  res.cis = SplitGene(tvalue = cis.tstat$bayes, lfc = Y[cis.idx, ], ID = gene.ID[cis.idx])


  ###  trans gene
  trans.idx = which(!(grepl(as.factor(cis), chr) |
                        grepl("C", chr) |
                        grepl("M", chr) |
                        grepl("Un", chr)
  ))
  trans.tstat = gettstat(alpha = para$alpha, beta = para$beta,
                         lfc = Y[trans.idx, ], null.lfc = trans.null.lfc )
  res.trans = SplitGene(tvalue = trans.tstat$bayes, lfc = Y[trans.idx, ],
                        ID = gene.ID[trans.idx])

  #### output all lists
  ndat = data.frame(Ncis.high = nrow(res.cis$hlist),
                    Ncis.lower = nrow(res.cis$llist),
                    Ncis.null = nrow(res.cis$nlist),
                    Ntrans.high = nrow(res.trans$hlist),
                    Ntrans.lower = nrow(res.trans$llist),
                    Ntrans.null = nrow(res.trans$nlist))

  res = list(cis.high = res.cis$hlist,
             cis.lower = res.cis$llist,
             cis.null = res.cis$nlist,
             trans.high = res.trans$hlist,
             trans.lower =  res.trans$llist,
             trans.null = res.trans$nlist,
             sumStat = ndat)
  return(res)
}
