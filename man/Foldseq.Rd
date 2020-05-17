\name{Foldseq}
\alias{Foldseq}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Log fold change detection based on an empirical bayesian method.
%%  ~~function to do ... ~~
}
\description{
Foldseq implements an empirical Bayesian method to substantially improve the power and accuracy in fold change detection.
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
Foldseq(ctrl, trt, cis.chr, cis.null.lfc = 0, trans.null.lfc = 0)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{ctrl}{A data list for the control group including the gene expression matrix, gene id and the chromosome correspond to the gene.}
  \item{trt}{A data list for the treatment group including the gene expression matrix, gene id and the chromosome correspond to the gene.}
  \item{cis.chr}{the chromosome under treatment}
  \item{cis.null.lfc}{cut-off for testing cis genes that is on the treated chromosome}
  \item{trans.null.lfc}{cut-off for testing trans genes that is genes other that the cis genes}
}
\details{
Suppose the control group and treatment group have their population mean expression $mu^g_{1}$ and $mu^g_{2}$. The objective of our study is to detect if the ratio of $mu^g_{2}$ and $mu^g_{1}$ (i.e., fold change), is within or outside a region of interest, such as
$mu^g_{2}/mu^g_{1} >= d_0$, or $mu^g_{2}/mu^g_{1} <= d_0$, or $d_1 <= mu^g_{2}/mu^g_{1} <= d_2$, among others, with strong statistical evidence.
}
\value{
\item{cis.high}{a table to summary the statistics of highly expressed genes located on the treated chromosome}
\item{cis.lower}{a table to summary the statistics of lowly expressed genes located on the treated chromosome}
\item{cis.null}{a table to summary the statistics of the non-differential genes located on the treated chromosome}
\item{trans.high}{a table to summary the statistics of highly expressed genes located on the untreated chromosom}
\item{trans.lower}{a table to summary the statistics of lowly expressed genes located on the untreated chromosome }
\item{trans.null}{a table to summary the statistics of the non-differential genes located on the untreated chromosome}
}
%\references{
%% ~put references to the literature/web site here ~
%}
%\author{
%%  ~~who you are~~
%}
%\note{
%%  ~~further notes~~
%}

%% ~Make other sections like Warning with \section{Warning }{....} ~

%\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
%}
\examples{
## An example to detect log fold change
data(smalldata)
Foldseq(ctrl=smalldata$Ctrl, trt=smalldata$Trt, cis.chr="chr1", cis.null.lfc = 0, trans.null.lfc = log2(1.5))
}
