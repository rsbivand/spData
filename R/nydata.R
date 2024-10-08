#' @name nydata
#' @aliases NY_data nydata listw_NY
#' @title New York leukemia data
#'
#' @description New York leukemia data taken from the data sets supporting Waller and Gotway 2004 (the data should be loaded by running \code{example(NY_data)} to demonstrate spatial data import techniques)
#' 
#' @format A data frame with 281 observations on the following 12 variables, and the binary coded spatial weights used in the source.
#' \itemize{
#' \item{AREANAME: name of census tract}
#' \item{AREAKEY: unique FIPS code for each tract}
#' \item{X: x-coordinate of tract centroid (in km)}
#' \item{Y: y-coordinate of tract centroid (in km)}
#' \item{POP8: population size (1980 U.S. Census)}
#' \item{TRACTCAS: number of cases 1978-1982}
#' \item{PROPCAS: proportion of cases per tract}
#' \item{PCTOWNHOME: percentage of people in each tract owning their own home}
#' \item{PCTAGE65P: percentage of people in each tract aged 65 or more}
#' \item{Z: ransformed propoprtions}
#' \item{AVGIDIST: average distance between centroid and TCE sites}
#' \item{PEXPOSURE: "exposure potential": inverse distance between each census tract centroid and the nearest TCE site, IDIST, transformed via log(100*IDIST)}
#' \item{Cases: as TRACTCAS with more digits}
#' \item{Xm: X in metres}
#' \item{Ym: Y in metres}
#' \item{Xshift: feature offset}
#' \item{Yshift: feature offset}
#' }
#' 
#' @details The examples section shows how the DBF files from the book website for Chapter 9 were converted into the \code{nydata} data frame and the \code{listw_NY} spatial weights list. The \code{shapes} directory includes the original version of the UTM18 census tract boundaries imported from BNA format (http://sedac.ciesin.columbia.edu/ftpsite/pub/census/usa/tiger/ny/bna_st/t8_36.zip) before the OGR/GDAL BNA driver was available. The \code{NY8_utm18} shapefile was constructed using a bna2mif converter and converted to shapefile format after adding data using \code{writeOGR}. The new file \code{NY8_bna_utm18.gpkg} has been constructed from the original BNA file, but read using the OGR BNA driver with GEOS support. The NY8 shapefile and GeoPackage NY8_utm18.gpkg include invalid polygons, but because the OGR BNA driver may have GEOS support (used here), the tract polygon objects in NY8_bna_utm18.gpkg are valid.
#' 
#' @source http://www.sph.emory.edu/~lwaller/ch9index.htm
#' @references Waller, L. and C. Gotway (2004) \emph{Applied Spatial Statistics for Public Health Data}. New York: John Wiley and Sons.
#' @docType data
#' @keywords datasets foreign spdep
#' 
#' @examples 
#' ## NY leukemia
#' \donttest{
#' if (requireNamespace("sf", quietly = TRUE)) {
#' library(foreign)
#' nydata <- read.dbf(system.file("misc/nydata.dbf", package="spData")[1])
#' nydata <- sf::st_as_sf(nydata, coords=c("X", "Y"), remove=FALSE)
#' plot(sf::st_geometry(nydata))
#' 
#' nyadjmat <- as.matrix(read.dbf(system.file("misc/nyadjwts.dbf",
#'                                            package="spData")[1])[-1])
#' ID <- as.character(names(read.dbf(system.file("misc/nyadjwts.dbf",
#'                                               package="spData")[1]))[-1])
#' identical(substring(ID, 2, 10), substring(as.character(nydata$AREAKEY), 2, 10))
#' 
#' if (requireNamespace("sf", quietly = TRUE)) {
#' library(spdep)
#' listw_NY <- mat2listw(nyadjmat, as.character(nydata$AREAKEY), style="B")
#' }
#' }
#' }
"nydata"
