\name{gettstat}
\alias{gettstat}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Calculate the t-statistic
%%  ~~function to do ... ~~
}
\description{
Calculate the t-statistic to detect if the ratio of $mu^g_{2}$ and $mu^g_{1}$ (i.e., fold change) is within or outside a region of interest.
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
gettstat(alpha, beta, lfc, null.lfc)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{alpha}{shape parameters}
  \item{beta}{scale parameters}
  \item{lfc}{The log ratio with base 2 of gene expression between treatment and control group}
  \item{null.lfc}{The log ratio with base 2 of gene expression between treatment and control group under the null hypothesis}
}
\details{
The t-statistic adopting the proposed bayesian approach is constructed as

$t_g = {bar{Y}^g - d_0 }/{sqrt{tilde{sigma}^2_g/n_2}} = { sum^{n_2}_{j=1}Y^g_j/n_2 - d_0 }/{sqrt{tilde{sigma}^2_g/n_2}}$,

where $d_0$ can be replaced by $d_1$ and $d_2$ to test regions with two sided boundaries.
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
\item{naive}{T-statistic}
\item{bayes}{T-statistic adopting the proposed bayesian approach}
%% ...
}
