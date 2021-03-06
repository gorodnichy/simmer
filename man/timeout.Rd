% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/trajectory-activities.R
\name{timeout}
\alias{timeout}
\title{Delay}
\usage{
timeout(.trj, task)
}
\arguments{
\item{.trj}{the trajectory object.}

\item{task}{the timeout duration supplied by either passing a numeric or a
callable object (a function) which must return a numeric (negative values are
automatically coerced to positive).}
}
\value{
Returns the trajectory object.
}
\description{
Activity for inserting delays and execute user-defined tasks.
}
