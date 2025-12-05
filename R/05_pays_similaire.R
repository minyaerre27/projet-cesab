#' Function to find the closest drinking countries
#'
#' @param small_data the database containing the year consumption of our participants
#' @param world_data the database containg the mean year consumption of each country
#' @return a database containg the participants' infos, and the country to which they are associated
#' @examples pays_similaire(year_consumption,mean_world_data)
#'
pays_similaire <- function(small_data, world_data) {
  dataMerged <- merge(small_data, world_data)

  data_pays_simi <- dataMerged |>
    dplyr::mutate(diff.per = abs(cons_year - conso)) |>
    dplyr::group_by(id) |>
    dplyr::mutate(minDiff = min(diff.per)) |>
    dplyr::filter(diff.per == minDiff) |>
    dplyr::select(
      id,
      age,
      pseudonyme,
      Entity,
      country.residence,
      Code,
      conso,
      cons_year
    )
  return(data_pays_simi)
}
