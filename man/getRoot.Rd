\name{getRoot}
\alias{getRoot}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Solve $psi'(alpha_0) = c$
%%  ~~function to do ... ~~
}
\description{
A Newton iteration approach to solve $psi'(alpha_0) = c$, where $psi(x)$ and $psi'(x)$ denote the digamma and trigamma functions, respectively.
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
getRoot(c, eps = 1e-8)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{c}{The scalar constant $c$ in the target equation $psi'(alpha_0) = c$}
  \item{eps}{tolerance}
}
\details{
We apply the Newton iteration approach to solve $psi'(alpha_0) = c$. In the initial iteration, we set $alpha^{(0)}_0=0.5+1/a$. In the $k$th iteration, we let $alpha^{(k+1)}=alpha^{(k)}+psi'(alpha^{(k)}){1 - psi'(alpha^{(k)})/a\}/ psi''(alpha^{(k)})$. The Newton iteration stops until $|alpha^{(k+1)}-alpha^{(k)}|/alpha^{(k)} < epsilon$, where $epsilon$ is a small positive number.
%%  ~~ If necessary, more details than the description above ~~
}}
\value{
\item{y}{Solution to the target euqtion}
}
