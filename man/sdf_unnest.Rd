% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/unnest.R
\name{sdf_unnest}
\alias{sdf_unnest}
\alias{sdf_unnest_}
\title{Unnest data along a column}
\usage{
sdf_unnest(x, column, prepend, prepend_all = TRUE)

sdf_unnest_(x, column, prepend, prepend_all = FALSE)
}
\arguments{
\item{x}{An object (usually a \code{spark_tbl}) coercable to a Spark DataFrame.}

\item{column}{The column to unnest}

\item{prepend}{Character. In the event that a nested field to be promoted has the same name as an
existing top level field then this string will be prepended to the field name. The default 
behavior is to prepend using the name of the field that is being unnested with an underscore.}

\item{prepend_all}{Logical. If \code{TRUE} then the \code{prepend} argument will be used for all
promoted fields even if no name conflict exists.}
}
\description{
Unnesting is an explode operation coupled with a nested select to promote the sub-fields of
the exploded top level array to the top level. Hence, given \code{a}, an array with fields
\code{a1, a2, a3}, then code{sdf_explode(df, a)} will produce output with each record replicated
for every element in the \code{a} array and with the fields \code{a1, a2, a3} (but not \code{a})
at the top level. Similar to \code{tidyr::explode}.
}
\details{
Note that this is a less precise tool than using \code{\link{sdf_explode}} and \code{\link{sdf_select}}
directly because all fields of the exploded array will be kept and promoted. Direct calls to these
methods allows for more targetted use of \code{\link{sdf_select}} to promote only those fields that
are wanted to the top level of the data frame.

Additionally, though \code{\link{sdf_select}} allows users to reach arbitrarily far into a nested
structure, this function will only reach one layer deep. It may well be that the unnested fields
are themselves nested structures that need to be dealt with accordingly.
}
