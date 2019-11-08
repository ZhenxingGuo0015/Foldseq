\name{SplitGene}
\alias{SplitGene}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Assign genes to different group of interest
%%  ~~function to do ... ~~
}
\description{
Assign genes to highly expressed genes, lowly expressed genes and non-differential genes based on the test statistic.
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
SplitGene(tvalue, lfc, ID)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{tvalue}{Test statistic}
  \item{lfc}{Log fold change}
  \item{ID}{Gene ID}
}
\value{
\item{nlist}{Summary the statistics of non-differential genes}
\item{llist}{Summary the statistics of lowly expressed genes}
\item{hlist}{Summary the statistics of highly expressed genes}
}
