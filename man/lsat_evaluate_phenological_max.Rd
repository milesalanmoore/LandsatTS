% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/lsat_evaluate_phenological_max.R
\name{lsat_evaluate_phenological_max}
\alias{lsat_evaluate_phenological_max}
\title{Evaluate estimates of annual phenological maximum}
\usage{
lsat_evaluate_phenological_max(
  dt,
  si,
  min.frac.of.max = 0.75,
  zscore.thresh = 3,
  min.obs = 6,
  reps = 10,
  outdir = NA
)
}
\arguments{
\item{dt}{Data.table output from lsat_fit_phenological_curves().}

\item{si}{Character string specifying the spectral index (SI) to evaluate (e.g., NDVI).}

\item{min.frac.of.max}{Numeric threshold (0-1) that defines the "growing season" as
the seasonal window when the phenological curves indicate the SI is within a specified
fraction of the maximum SI. In other words, an observation is considered to be from
the "growing season" when the SI is within a user-specified fraction of the curve-fit
growing season maximum SI.}

\item{zscore.thresh}{Numeric threshold specifying the Z-score value beyond which individual
measurements are filtered before computing the maximum SI.}

\item{min.obs}{Minimum number of site-level measurements needed each year to be included
in the evaluation (Default = 10).}

\item{reps}{Number of times to bootstrap the assessment (Default = 10).}

\item{outdir}{If desired, specify the output directory where evaluation data and figure
should be written. If left as NA, then output is only displayed in the console
and not written to disk.}
}
\value{
A data.table and a figure summarizing how estimates of annual maximum SI
vary with the number of Landsat measurements made during each growing season.
}
\description{
Assess how the number of annual Landsat measurements impacts
estimates of annual maximum vegetation greenness derived from raw measurements and
phenological modeling. The algorithm computes annual maximum vegetation greenness
for each site using years with at least a user-specific number of measurements and then compares
these with estimates derived when using progressively smaller subsets of measurements.
This lets the user determine the degree to which annual estimates of maximum vegetation
greenness are impacted by the number of available measurements.
}
\examples{
data(lsat.example.dt)
lsat.dt <- lsat_format_data(lsat.example.dt)
lsat.dt <- lsat_clean_data(lsat.dt)
lsat.dt <- lsat_calc_spectral_index(lsat.dt, 'ndvi')
# lsat.dt <- lsat_calibrate_rf(lsat.dt, band.or.si = 'ndvi', write.output = FALSE)
lsat.pheno.dt <- lsat_fit_phenological_curves(lsat.dt, si = 'ndvi') 
lsat_evaluate_phenological_max(lsat.pheno.dt, si = 'ndvi')
}
