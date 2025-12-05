#' Function to load data
#'
#' @param file_path the path to the data we wand to import
#' @return the db corresponding to the file
#' @examples
#' load_data()

load_data = function(file_path) {
  db = readr::read_csv(file_path, show_col_types = FALSE)
  return(db)
}
