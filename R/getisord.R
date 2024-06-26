#' @name getisord
#' @aliases getisord go_x go_y go_xyz
#' @title Getis-Ord remote sensing example data
#'
#' @description The \code{go_xyz} data frame has 256 rows and 3 columns. Vectors \code{go_x} and \code{go_y} are of length 16 and give the centres of the grid rows and columns, 30m apart. The data start from the bottom left, Getis and Ord start from the top left - so their 136th grid cell is our 120th.
#' 
#' @format 
#' This data frame contains the following columns:
#' \itemize{
#'         \item{x: grid eastings}
#'         \item{y: grid northings}
#'         \item{val: remote sensing values}
#' }
#' 
#' @source Getis, A. and Ord, J. K. 1996 Local spatial statistics: an overview. In P. Longley and M. Batty (eds) \emph{Spatial analysis: modelling in a GIS environment} (Cambridge: Geoinformation International), 266.
#' @docType data
#' @keywords datasets misc
#' 
#' @examples 
#' data(getisord)
#' image(go_x, go_y, t(matrix(go_xyz$val, nrow = 16, ncol=16, byrow = TRUE)), asp = 1)
#' text(go_xyz$x, go_xyz$y, go_xyz$val, cex = 0.7)
#' polygon(c(195, 225, 225, 195), c(195, 195, 225, 225), lwd = 2)
#' title(main = "Getis-Ord 1996 remote sensing data")
#'
NULL
