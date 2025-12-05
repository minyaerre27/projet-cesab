#' Function to load the world spatial data from the package spData
#'
#' @param none
#' @return the sf object containing the country delimitations and the country codes
#' @examples
#' import_spatial_countries()

import_spatial_countries = function() {
  db_with_codes = readr::read_csv(
    here::here("data", "country_codes.csv"),
    show_col_types = FALSE
  )

  db = spData::world |>
    dplyr::select(iso_a2, name_long, geom) |>
    dplyr::left_join(db_with_codes, by = dplyr::join_by(iso_a2 == ISO2)) |>
    dplyr::select(iso_a2, name_long, geom, ISO3)
  return(sf::st_as_sf(db))
}
