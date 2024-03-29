% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/FTRL.R
\name{FTRL}
\alias{FTRL}
\title{Implementation of FTRL (Follow The Regularized Leader)}
\usage{
FTRL(
  y,
  experts,
  eta = NULL,
  fun_reg = NULL,
  fun_reg_grad = NULL,
  constr_eq = NULL,
  constr_eq_jac = NULL,
  constr_ineq = NULL,
  constr_ineq_jac = NULL,
  loss.type = list(name = "square"),
  loss.gradient = TRUE,
  w0 = NULL,
  max_iter = 50,
  obj_tol = 0.01,
  training = NULL,
  default = FALSE,
  quiet = TRUE
)
}
\arguments{
\item{y}{\code{vector}. Real observations.}

\item{experts}{\code{matrix}. Matrix of experts previsions.}

\item{eta}{\code{numeric}. Regularization parameter.}

\item{fun_reg}{\code{function} (NULL). Regularization function to be applied during the optimization.}

\item{fun_reg_grad}{\code{function} (NULL). Gradient of the regularization function (to speed up the computations).}

\item{constr_eq}{\code{function} (NULL). Constraints (equalities) to be applied during the optimization.}

\item{constr_eq_jac}{\code{function} (NULL). Jacobian of the equality constraints (to speed up the computations).}

\item{constr_ineq}{\code{function} (NULL). Constraints (inequalities) to be applied during the optimization (... > 0).}

\item{constr_ineq_jac}{\code{function} (NULL). Jacobian of the inequality constraints (to speed up the computations).}

\item{loss.type}{\code{character, list or function} ("square").
\describe{
     \item{character}{ Name of the loss to be applied ('square', 'absolute', 'percentage', or 'pinball');}
     \item{list}{ List with field \code{name} equal to the loss name. If using pinball loss, field \code{tau} equal to the required quantile in [0,1];}
     \item{function}{ A custom loss as a function of two parameters (prediction, label).}
}}

\item{loss.gradient}{\code{boolean, function} (TRUE). 
\describe{
     \item{boolean}{ If TRUE, the aggregation rule will not be directly applied to the loss function at hand,
     but to a gradient version of it. The aggregation rule is then similar to gradient descent aggregation rule. }
     \item{function}{ If loss.type is a function, the derivative of the loss in its first component should be provided to be used (it is not automatically 
     computed).}
}}

\item{w0}{\code{numeric} (NULL). Vector of initialization for the weights.}

\item{max_iter}{\code{integer} (50). Maximum number of iterations of the optimization algorithm per round.}

\item{obj_tol}{\code{numeric} (1e-2). Tolerance over objective function between two iterations of the optimization.}

\item{training}{\code{list} (NULL). List of previous parameters.}

\item{default}{\code{boolean} (FALSE). Whether or not to use default parameters for fun_reg, constr_eq, constr_ineq and their grad/jac, 
which values are ALL ignored when TRUE.}

\item{quiet}{\code{boolean} (FALSE). Whether or not to display progress bars.}
}
\value{
object of class mixture.
}
\description{
FTRL \insertCite{shalev2007primal}{opera} and Chap. 5 of \insertCite{hazan2019introduction}{opera} is the online counterpart of empirical risk minimization. 
 It is a family of aggregation rules (including OGD) that uses at any time the empirical risk
 minimizer so far with an additional regularization. The online optimization can be performed
 on any bounded convex set that can be expressed with equality or inequality constraints. 
 Note that this method is still under development and a beta version.
}
\references{
\insertAllCited{}
}
