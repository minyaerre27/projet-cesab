#' Function to download the data of alcohol consumption per country
#'
#' @param
#' @return file path in our environment
#' @examples
#' download_world_data()

download_world_data = function() {
  save_path = here::here("data")
  dest_file = base::file.path(save_path, "alcohol_per_country.csv")
  utils::download.file(
    url = base::paste0(
      "https://ourworldindata.org/grapher/total-alcohol-consumption-per-capita-litres-of-pure-alcohol.csv?v=1&csvType=full&useColumnShortNames=true"
    ),
    destfile = dest_file
  )
  return(dest_file)
}
