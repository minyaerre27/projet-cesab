#' Function to join the countries we found for people with the geographic data of theses countries
#'
#' @param spatial_countries the sf object containing the country delimitations and the country codes, computed with the function import_spatial_countries
#' @param result_countries the table containing the drinking countries of our participants, output of the function ....
#' @return the sf object containing the country results and their geometry
#' @examples
#' join_countries()

join_countries = function(spatial_countries, result_countries) {
  spatial_results = spatial_countries |>
    dplyr::left_join(result_countries, by = dplyr::join_by(ISO3 == Code))
  return(spatial_results)
}
