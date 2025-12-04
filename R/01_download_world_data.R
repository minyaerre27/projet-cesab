#' Function to download on the the three files from the WWF Wildfinder in the data repository
#'
#' @param csv_name the name of the ".csv" file that we want to download from datarepo/tree/main/data/wildfinder/
#' @return vector of the files directories in the data/folder
#' @examples
#' dl_wildfinder_data()

download_world_data = function() {
  save_path = here::here("data")
  utils::download.file(
    url = base::paste0(
      "https://ourworldindata.org/grapher/total-alcohol-consumption-per-capita-litres-of-pure-alcohol.csv"
    ),
    destfile = base::file.path(save_path, "alcohol_per_country.csv")
  )
}
