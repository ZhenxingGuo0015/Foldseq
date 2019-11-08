\name{datScreen}
\alias{datScreen}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Data Preprocessing For Log Fold Change Detection
%%  ~~function to do ... ~~
}
\description{
Identify and remove rows with zeros in all columns.
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
datScreen(Ctrl,Trt)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{Ctrl}{Gene expression matrix in the control group}
  \item{Trt}{Gene expression matrix in the treatment group}
}
\value{
 \item{Ctrl}{The processed gene expression matrix in the control group}
 \item{Trt}{The processed gene expression matrix in the treatment group}
 \item{rmidx}{The removed row index}
}
