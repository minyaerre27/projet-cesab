#' Function to download on the the three files from the WWF Wildfinder in the data repository
#'
#' @param csv_name the name of the ".csv" file that we want to download from datarepo/tree/main/data/wildfinder/
#' @return vector of the files directories in the data/folder
#' @examples
#' dl_wildfinder_data()
dstudent <- read.csv("data/smallData.csv")

dstudent$alcolemi <- cons_year

loop_correspondance <- function(consom, data){
  list = rep(0, nrow(data))
  col = data$conso
  for(i in 0:length(col)){
    list[i] = abs(consom - col[i])
  }
  pays = data[[which.min(list),1]]
  return(pays)
}
