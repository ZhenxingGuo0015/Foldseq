\name{LfcTest}
\alias{LfcTest}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Hypothesis test to detect log fold change
%%  ~~function to do ... ~~
}
\description{
The procedure to conduct hypothesis test to detect if the ratio of $mu^g_{2}$ and $mu^g_{1}$ (i.e., fold change) is within or outside a region of interest.
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
LfcTest(Y, cis.chr = cis.chr, cis.null.lfc = cis.null.lfc, trans.null.lfc = trans.null.lfc)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{Y}{Log fold change with base 2}
  \item{cis.chr}{Altered chromosome}
  \item{cis.null.lfc}{Null log fold change for the genes located on treated chromosome}
  \item{trans.null.lfc}{Null log fold change for the genes located on untreated chromosome}
}
\details{
A complete pipeline to conduct the hypothesis testing:

Step1:Parameter estimation;

Step2:Calculate test statistic;

Step3:Detect log fold change based on the statistics.
%%  ~~ If necessary, more details than the description above ~~
}
\value{
\item{cis.high}{Summary the statistics of highly expressed genes located on the treated chromosome}
\item{cis.lower}{Summary the statistics of lowly expressed genes located on the treated chromosome}
\item{cis.null}{Summary the statistics of the non-differential genes located on the treated chromosome}
\item{trans.high}{Summary the statistics of highly expressed genes located on the untreated chromosom}
\item{trans.lower}{Summary the statistics of lowly expressed genes located on the untreated chromosome }
\item{trans.null}{Summary the statistics of the non-differential genes located on the untreated chromosome}
\item{sumStat}{Summary the number of genes in each gene group}
}
