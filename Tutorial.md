Foldseq: an empirical bayesian method to detect Log fold change
================

Introduction
============

This manual provides a walk through tutorial on how to use Foldseq, which implements an empirical Bayesian method to substantially improve the power and accuracy in fold change detection.

Installation
------------

To run the entire deconvolution tutorial, users need to install the Foldseq package.

``` r
# install devtools if necessary
install.packages('devtools')

# install the Foldseq package
devtools::install_github('cuiyingbeicheng/Foldseq')

# load
library(Foldseq)
```

Example
-------

``` r
# An example to detect log fold change
data(smalldata)
res = Foldseq(ctrl=smalldata$Ctrl, trt=smalldata$Trt, cis.chr="chr1", cis.null.lfc = 0, trans.null.lfc = log2(1.5))
```

``` r
# Users can output significant highly expressed cis genes 
res$cis.high
```

    ##           gene.ID        lfc       fc         pval          fdr
    ## 5  chr1_AT1G13145 0.64589516 1.907694 0.000000e+00 0.000000e+00
    ## 6  chr1_AT1G60690 0.09662168 1.101444 0.000000e+00 0.000000e+00
    ## 10 chr1_AT1G01080 1.93857191 6.948820 0.000000e+00 0.000000e+00
    ## 22 chr1_AT1G56200 0.62027191 1.859434 0.000000e+00 0.000000e+00
    ## 25 chr1_AT1G10830 0.10212199 1.107519 0.000000e+00 0.000000e+00
    ## 42 chr1_AT1G79310 0.50704307 1.660374 0.000000e+00 0.000000e+00
    ## 50 chr1_AT1G04590 0.55857955 1.748188 0.000000e+00 0.000000e+00
    ## 1  chr1_AT1G60200 0.67678332 1.967539 2.953193e-14 1.624256e-13
    ## 18 chr1_AT1G30230 0.92694949 2.526789 6.372680e-14 3.235361e-13
    ## 16 chr1_AT1G77122 1.06462754 2.899759 2.273985e-07 9.380189e-07
    ## 28 chr1_AT1G20050 0.77440236 2.169295 4.629498e-07 1.797335e-06
    ## 60 chr1_AT1G67105 0.24549504 1.278254 3.683137e-06 1.279405e-05
    ## 13 chr1_AT1G30135 0.89393144 2.444722 9.716789e-05 3.206540e-04
    ## 43 chr1_AT1G62305 0.56123893 1.752843 4.773021e-04 1.500092e-03
    ## 30 chr1_AT1G05500 0.24893170 1.282654 5.428032e-04 1.628410e-03
    ## 36 chr1_AT1G60530 0.55889748 1.748743 1.002289e-03 2.756294e-03
    ## 21 chr1_AT1G14670 0.36273822 1.437260 1.278654e-03 3.375647e-03
    ## 57 chr1_AT1G02430 0.76360006 2.145988 2.068050e-03 5.249667e-03
    ## 2  chr1_AT1G71350 0.57426465 1.775824 4.759815e-03 1.121956e-02
    ## 31 chr1_AT1G04250 0.15532543 1.168038 6.346926e-03 1.396324e-02
    ## 12 chr1_AT1G35420 0.25153681 1.286000 2.708972e-02 5.587254e-02
    ## 7  chr1_AT1G80130 1.02693031 2.792481 4.481721e-02 8.054052e-02
    ## 20 chr1_AT1G01448 0.09482732 1.099469 4.515150e-02 8.054052e-02
    ## 65 chr1_AT1G58350 0.21563897 1.240654 4.439193e-02 8.054052e-02

``` r
# (Things are the same for the rest types of genes,i.e.,significant highly expressed trans genes,
# significant lowly expressed cis genes, significant lowly expressed trans genes,
# cis genes not significantly expressed and trans genes not significantly expressed.)
# Users can also output summary statistics of the fold change detection results
res$sumStat
```

    ##   Ncis.high Ncis.lower Ncis.null Ntrans.high Ntrans.lower Ntrans.null
    ## 1        24         13        29           8          232          29
