#' Function to compute the difference between the yeraly consumption of users with the mean yearly consumption in their country
#'
#' @param small_data the database containing the year consumption of our participants
#' @param world_data the database containg the mean year consumption of each country
#' @return a database containg the participants' infos, and the difference in yearly alcolhol consumption
#' @examples diff_ton_pays(year_consumption,mean_world_data)
#'

diff_ton_pays <- function(small_data, world_data) {
  dataMerged <- merge(small_data, world_data)
  data_diff_ton_pays <- dataMerged |>
    dplyr::group_by(id) |>
    dplyr::filter(Entity == country.residence) |>
    dplyr::mutate(diff.meanCountry = cons_year - conso) |>
    dplyr::select(
      id,
      age,
      pseudonyme,
      country.residence,
      diff.meanCountry,
      conso
    )

  return(data_diff_ton_pays)
}
