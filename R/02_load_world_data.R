#' Function to download on the the three files from the WWF Wildfinder in the data repository
#'
#' @param csv_name the name of the ".csv" file that we want to download from datarepo/tree/main/data/wildfinder/
#' @return vector of the files directories in the data/folder
#' @examples
#' load_data()

load_data = function(file_path) {
  db = readr::read_csv(file_path)
}
