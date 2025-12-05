#' Function to load the world spatial data from the package spData
#'
#' @param none
#' @return the sf object containing the country delimitations and the country codes
#' @examples
#' import_spatial_countries()

import_spatial_countries = function() {
  db = spData::world |> dplyr::select(iso_a2, name_long, geom)
  return(db)
}
