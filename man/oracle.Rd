% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/oracle.R
\name{oracle}
\alias{oracle}
\title{Compute oracle predictions}
\usage{
oracle(
  Y,
  experts,
  model = "convex",
  loss.type = "square",
  awake = NULL,
  lambda = NULL,
  niter = NULL,
  ...
)
}
\arguments{
\item{Y}{A vector containing the observations
to be predicted.}

\item{experts}{A matrix containing the experts
forecasts. Each column corresponds to the predictions proposed by an expert
to predict \code{Y}.  It has as many columns as there are experts.}

\item{model}{A character string specifying the oracle to use or a list with a component \code{name} specifying the oracle and any additional parameter needed.
Currently available oracles are:
\describe{
   \item{'expert'}{The best fixed (constant over time) expert oracle.}
   \item{'convex'}{The best fixed convex combination (vector of non-negative weights that sum to 1)}
   \item{'linear'}{The best fixed linear combination of expert}
   \item{'shifting'}{It computes for all number $m$ of stwitches the
sequence of experts with at most $m$ shifts that would have performed the
best to predict the sequence of observations in \code{Y}.}
}}

\item{loss.type}{\code{character, list or function}. 
\describe{
     \item{character}{ Name of the loss to be applied ('square', 'absolute', 'percentage', or 'pinball');}
     \item{list}{ When using pinball loss: list with field name equal to 'pinball' and field tau equal to the required quantile in [0,1];}
     \item{function}{ A custom loss as a function of two parameters.}
}}

\item{awake}{A matrix specifying the
activation coefficients of the experts. Its entries lie in \code{[0,1]}.
Possible if some experts are specialists and do not always form and suggest
prediction. If the expert number \code{k} at instance \code{t} does not
form any prediction of observation \code{Y_t}, we can put
\code{awake[t,k]=0} so that the mixture does not consider expert \code{k} in
the mixture to predict \code{Y_t}. Remark that to compute the best expert oracle, 
the performance of unactive (or partially active) experts is computed by using 
the prediction of the uniform average of active experts.}

\item{lambda}{A positive number used by the 'linear' oracle only. 
A possible $L_2$ regularization parameter for computing the linear oracle 
(if the design matrix is not identifiable)}

\item{niter}{A positive integer for 'convex' and 'linear' oracles 
if direct computation of the oracle is not implemented. 
It defines the number of optimization steps to perform in 
order to approximate the oracle (default value is 3).}

\item{...}{Additional parameters
that are passed to \code{\link{optim}} function is order to perform convex optimization 
(see parameter \code{niter}).}
}
\value{
An object of class 'oracle' that contains:
\item{loss}{ The average loss suffered by the oracle. For the 'shifting' oracle,
it is a vector of length \code{T} where
\code{T} is the number of instance to be predicted (i.e., the length of the
sequence \code{Y}). The value of $loss(m)$ is the loss
(determined by the parameter \code{loss.type}) suffered by the
best sequence of expert with at
most $m-1$ shifts.
}
\item{coefficients}{ Not for the 'shifting' oracle. A vector containing the best weight vector corresponding to the oracle. }
\item{prediction}{ Not for the 'shifting' oracle. A vector containing the
predictions of the oracle.  }
\item{rmse}{If loss.type is the square loss (default) only.
The root mean square error (i.e., it is the square root of \code{loss}.}
}
\description{
The function \code{oracle} performs a strategie that cannot be defined online
(in contrast to \link{mixture}). It requires in advance the knowledge of the whole
data set \code{Y} and the expert advice to be well defined.
Examples of oracles are the best fixed expert, the best fixed convex
combination rule, the best linear combination rule, or the best expert
that can shift a few times.
}
\author{
Pierre Gaillard <pierre@gaillard.me>
}
