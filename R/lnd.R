#' @name lnd
#' @aliases lnd
#' @title The boroughs of London
#'
#' @description Polygons representing large administrative zones in London
#' 
#' @format 
#' \itemize{
#'     \item{NAME: Borough name}
#'     \item{GSS_CODE: Official code}
#'     \item{HECTARES: How many hectares}
#'     \item{NONLD_AREA: Area outside London}
#'     \item{ONS_INNER: Office for national statistics code}
#'     \item{SUB_2009: Empty column}
#'     \item{SUB_2006: Empty column}
#'     \item{geometry: sfc_MULTIPOLYGON}
#' }
#' 
#' @source \url{https://github.com/Robinlovelace/Creating-maps-in-R}
#' @docType data
#' @keywords datasets sf
#' 
#' @examples 
#' if (requireNamespace("sf", quietly = TRUE)) {
#'   library(sf)
#'   data(lnd)
#'   summary(lnd)
#'   plot(st_geometry(lnd))
#' }
"lnd"
