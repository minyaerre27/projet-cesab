#' Function to return the closest country based on their consumption
#'
#' @param consom yearly consumption of one person
#' @param data database with country's consumption
#' @return vector of the files directories in the data/folder
#' @examples

loop_correspondance <- function(consom, data){
  list = rep(0, nrow(data))
  col = data$conso
  for(i in 0:length(col)){
    list[i] = abs(consom - col[i])
  }
  pays = data[[which.min(list),1]]
  return(pays)
}
