#' Function to find the closest drinking countries
#'
#' @param csv_name the name of the ".csv" file that we want to download from datarepo/tree/main/data/wildfinder/
#' @return vector of the files directories in the data/folder
#' @examples
#'
pays_similaire <- function(small_data, world_data) {
  dataMerged <- merge(small_data, world_data)

  data_pays_simi <- dataMerged |>
    dplyr::mutate(diff.per = abs(cons_year - conso)) |>
    dplyr::group_by(id) |>
    dplyr::mutate(minDiff = min(diff.per)) |>
    dplyr::filter(diff.per == minDiff) |>
    dplyr::select(id, age, pseudonyme, Entity, country.residence)
  return(data_pays_simi)
}
