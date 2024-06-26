#' @name depmunic
#' @aliases depmunic
#' @title Municipality departments of Athens (Sf)
#'
#' @description  The geographic boundaries of departments (sf) of the municipality of Athens. This is accompanied by various characteristics in these areas.
#' 
#' @format An sf object of 7 polygons with the following 7 variables.
#' \itemize{
#'   \item{num_dep: An unique identifier for each municipality department.}
#'   \item{airbnb: The number of airbnb properties in 2017}
#'   \item{museums: The number of museums}
#'   \item{population: The population recorded in census at 2011.}
#'   \item{pop_rest: The number of citizens that the origin is a non european country.}
#'   \item{greensp: The area of green spaces (unit: square meters).}
#'   \item{area: The area of the polygon (unit: square kilometers). }
#' }
#' 
#' @docType data
#' @keywords datasets sf
#' @seealso properties
#' 
#' @examples 
#' if (requireNamespace("sf", quietly = TRUE)) {
#'   library(sf)
#'   data(depmunic)
#'   
#'   depmunic$foreigners <- 100*depmunic$pop_rest/depmunic$population
#'   plot(depmunic["foreigners"], key.pos=1)
#' }
"depmunic"
