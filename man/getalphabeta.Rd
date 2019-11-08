\name{getalphabeta}
\alias{getalphabeta}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Hyperparameter Estimation
%%  ~~function to do ... ~~
}
\description{
Estimate the hyperparameter (shape $alpha_0$ and scale $beta_0$) for the inverse gamma prior.
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
getalphabeta(lfc)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{lfc}{The log ratio with base 2 of gene expression between treatment and control group}
%%     ~~Describe \code{x} here~~
}
\details{
To implement our method, we need to estimate hyperparameters of shape($alpha_0$) and scale($beta_0$). Inspired by the method proposed by Gordon K. Smyth et al.[1], we apply the following method to estimate hyperparameters. Specifically, we compute the sample estimate of gene-wise variance, denoted by $s^2_g$, where $s^2_g=sum^{n_2}_{j=1}(Y^g_j-bar({Y}^g))^2/(n_2-1)$. We can show that $s_g^2 | alpha_0, beta_0$ follows $beta_0/alpha_0 {F}(n_2-1, 2alpha_0)$, which is a scaled F-distribution. Let $z_g$ denote ${log } s_g^2$ with a natural base, then $z_g$ is distributed as a constant plus Fisher's $z$ distribution. The distribution of $z_g$ is roughly normal with $E(z_g) = log ({beta_0}/{alpha_0}) + psi({n_2-1}/{2}) - psi(alpha_0) + log({2alpha_0}/{n_2-1})$ and ${Var}(z_g) = psi'({n_2-1}/{2}) + psi'(alpha_0)$, where $psi(x)$ and $psi'(x)$ denote the digamma and trigamma functions, respectively.

Let $e_g = z_g - psi((n_2-1)/2) + log((n_2-1)/2)$, then we have ${E}(e_g) = log(beta_0/alpha_0) - psi((n_2-1)/2) + log((n_2-1)/2)$, and ${E}{(e_g-bar{e})^2G/(G-1) - psi'((n_2-1)/2)} = psi'(alpha_0)$ approximately where $bar{e}=sum e_g/G$. We therefore estimate $alpha_0$ by solving $psi'(alpha_0) = bar{(e_g-bar{e})^2G/(G-1) - psi'({n_2-1}/{2})}$. To solve this equation, we use Newton iteration. Specifically, let $a$ denote $bar{(e_g-bar{e})^2G/(G-1) - psi'({n_2-1}/{2})}$. In the initial iteration, we set $alpha^{(0)}_0=0.5+1/a$. In the $k$th iteration, we let $alpha^{(k+1)}=alpha^{(k)}+psi'(alpha^{(k)}){1 - psi'(alpha^{(k)})/a}/ psi''(alpha^{(k)})$. The Newton iteration stops until $|alpha^{(k+1)}-alpha^{(k)}|/alpha^{(k)} < epsilon$, where $epsilon$ is a small positive number. Given the estimated $alpha_0$, denoted by $hat{alpha}_0$, we estimate $beta_0=hat{alpha}_0 exp{bar{e} + psi(hat{alpha}_0) - log(hat{alpha}_0)}$, and denote its estimate as $hat{beta}_0$.
%%  ~~ If necessary, more details than the description above ~~
}
\value{
\item{alpha}{Estimate for hyperparameter alpha}
\item{beta}{Estimate for hyperparameter beta}
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
Ritchie, M.E., Phipson, B., Wu, D., Hu, Y., Law, C.W., Shi, W., and Smyth, G.K. (2015). limma powers differential expression analyses for RNA-sequencing and microarray studies. Nucleic Acids Research 43(7), e47.
}
