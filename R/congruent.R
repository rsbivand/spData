#' @name congruent
#' @aliases incongruent aggregating_zones
#' @title Datasets to illustrate the concept of spatial congruence
#'
#' @description Sample of old (incongruent) and new (congruent) administrative zones
#' from UK statistical agencies
#' 
#' @format 
#' Simple feature geographic data in a projected CRS (OSGB) with random values assigned
#' for teaching purposes.
#' 
#' @source \url{https://en.wikipedia.org/wiki/ONS_coding_system}
#' @docType data
#' @keywords datasets sf
#' 
#' @examples 
#' if(requireNamespace("sf", quietly = TRUE)) {
#'   library(sf)
#'   plot(aggregating_zones$geometry, lwd = 5)
#'   plot(congruent$geometry, add = TRUE, border = "green", lwd = 2)
#'   plot(incongruent$geometry, add = TRUE, border = "blue", col = NA)
#'   rbind(congruent, incongruent)
#' }
#' # Code used to download the data:
#' \dontrun{
#' #devtools::install_github("robinlovelace/ukboundaries")
#' library(sf)
#' library(tmap)
#' library(dplyr)
#' #library(ukboundaries)
#' sel = grepl("003|004", msoa2011_lds$geo_label)
#' aggregating_zones = st_transform(msoa2011_lds[sel, ], 27700)
#' # find lsoas in the aggregating_zones
#' lsoa_touching = st_transform(lsoa2011_lds, 27700)[aggregating_zones, ]
#' lsoa_cents = st_centroid(lsoa_touching)
#' lsoa_cents = lsoa_cents[aggregating_zones, ]
#' sel = lsoa_touching$geo_code %in% lsoa_cents$geo_code
#' # same for ed zones
#' ed_touching = st_transform(ed1981, 27700)[aggregating_zones, ]
#' ed_cents = st_centroid(ed_touching)
#' ed_cents = ed_cents[aggregating_zones, ]
#' incongruent_agg_ed = ed_touching[ed_cents, ]
#' set.seed(2017)
#' incongruent_agg_ed$value = rnorm(nrow(incongruent_agg_ed), mean = 5)
#' congruent = aggregate(incongruent_agg_ed["value"], lsoa_touching[sel, ], mean)
#' congruent$level = "Congruent"
#' congruent = congruent[c("level", "value")]
#' incongruent_cents = st_centroid(incongruent_agg_ed)
#' aggregating_value = st_join(incongruent_cents, congruent)$value.y
#' incongruent_agg = aggregate(incongruent_agg_ed["value"], list(aggregating_value), FUN = mean)
#' incongruent_agg$level = "Incongruent"
#' incongruent = incongruent_agg[c("level", "value")]
#' summary(st_geometry_type(congruent))
#' summary(st_geometry_type(incongruent))
#' incongruent = st_cast(incongruent, "MULTIPOLYGON")
#' summary(st_geometry_type(incongruent))
#' summary(st_geometry_type(aggregating_zones))
#' devtools::use_data(congruent, overwrite = TRUE)
#' devtools::use_data(incongruent, overwrite = TRUE)
#' devtools::use_data(aggregating_zones, overwrite = TRUE)
#' }
"congruent"
