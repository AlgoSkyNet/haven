% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/haven.R
\name{read_sas}
\alias{read_sas}
\alias{write_sas}
\title{Read and write SAS files.}
\usage{
read_sas(data_file, catalog_file = NULL, encoding = NULL,
  catalog_encoding = encoding, col_select = NULL, skip = 0L,
  n_max = Inf, cols_only = "DEPRECATED", .name_repair = "unique")

write_sas(data, path)
}
\arguments{
\item{data_file, catalog_file}{Path to data and catalog files. The files are
processed with \code{\link[readr:datasource]{readr::datasource()}}.}

\item{encoding, catalog_encoding}{The character encoding used for the
\code{data_file} and \code{catalog_encoding} respectively. A value of \code{NULL} uses the
encoding specified in the file; use this argument to override it if it is
incorrect.}

\item{col_select}{One or more selection expressions, like in
\code{\link[dplyr:select]{dplyr::select()}}. Use \code{c()} or \code{list()} to use more than one expression.
See \code{?dplyr::select} for details on available selection options. Only the
specified columns will be read from \code{data_file}.}

\item{skip}{Number of lines to skip before reading data.}

\item{n_max}{Maximum number of lines to read.}

\item{cols_only}{\strong{Deprecated}: Use \code{col_select} instead.}

\item{.name_repair}{Treatment of problematic column names:
\itemize{
\item \code{"minimal"}: No name repair or checks, beyond basic existence,
\item \code{"unique"}: Make sure names are unique and not empty,
\item \code{"check_unique"}: (default value), no name repair, but check they are
\code{unique},
\item \code{"universal"}: Make the names \code{unique} and syntactic
\item a function: apply custom name repair (e.g., \code{.name_repair = make.names}
for names in the style of base R).
\item A purrr-style anonymous function, see \code{\link[rlang:as_function]{rlang::as_function()}}
}

See \link{name-repair} for more details on these terms and the strategies used
to enforce them.}

\item{data}{Data frame to write.}

\item{path}{Path to file where the data will be written.}
}
\value{
A tibble, data frame variant with nice defaults.

Variable labels are stored in the "label" attribute of each variable. It is
not printed on the console, but the RStudio viewer will show it.

\code{write_sas()} returns the input \code{data} invisibly.
}
\description{
\code{read_sas()} supports both sas7bdat files and the accompanying sas7bcat files
that SAS uses to record value labels. \code{write_sas()} is currently experimental
and only works for limited datasets.
}
\examples{
path <- system.file("examples", "iris.sas7bdat", package = "haven")
read_sas(path)
}
