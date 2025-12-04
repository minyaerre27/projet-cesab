#' Function to download on the the three files from the WWF Wildfinder in the data repository
#'
#' @param csv_name the name of the ".csv" file that we want to download from datarepo/tree/main/data/wildfinder/
#' @return vector of the files directories in the data/folder
#' @examples
#' dl_wildfinder_data()

load_world_data = function() {
  world_db = readr::read_csv(
    here::here("data", "alcohol_per_country.csv"),
    col_types = "f"
  )
}
