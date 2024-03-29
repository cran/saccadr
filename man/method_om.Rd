% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/method_om.R
\name{method_om}
\alias{method_om}
\title{Extract saccades using an algorithm proposed by Otero-Millan et al. (2014) \doi{10.1167/14.2.18}}
\usage{
method_om(x, y, vel, acc, sample_rate, trial, options)
}
\arguments{
\item{x}{Gaze x coordinate, _arbitrary units_ as threshold velocity is computed in units of standard deviation.}

\item{y}{Gaze x coordinate, _arbitrary units_ as threshold velocity is computed in units of standard deviation.}

\item{vel}{Velocity \code{data.frame} with columns \code{x}, \code{y}, \code{amp}.}

\item{acc}{Acceleration \code{data.frame} with columns \code{x}, \code{y}, \code{amp}.}

\item{sample_rate}{Sample rate in Hz.}

\item{trial}{Trial id, so that trial borders are respected when computing velocity and saccades.}

\item{options}{Named list with method options. See \emph{details} for further information.}
}
\value{
logical vector marking samples that belong to saccades
}
\description{
Extract saccades using an algorithm proposed by Otero-Millan et al. (2014) \doi{10.1167/14.2.18}
}
\details{
Method options, please refer to Otero-Millan et al. (2014) for details on parameters and the rationale for default values.
\itemize{
\item{\code{om_minimal_inter_peak_time_ms}} {Minimal inter-peak interval in milliseconds. Defaults to \code{30}.}
\item{\code{om_maximal_peaks_per_second}} {Maximal allowed number of peaks per second. Defaults to \code{5}.}
\item{\code{om_velocity_threshold_deg_per_sec}} {Threshold saccade velocity in °/s.  Defaults to \code{3}.}
\item{\code{om_pca_variance_threshold}} {Minimal variance explained by retained rotated components. Defaults to \code{0.05}.}
}
}
\examples{
# Do not run this function directly, use extract_saccades() instead
}
\seealso{
\code{\link{extract_saccades}}
}
