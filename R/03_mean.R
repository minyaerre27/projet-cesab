#' Function to compute the mean of country's alcohol consumption
#'
#' @param data dataset with country's consumptions
#' @return vector of the files directories in the data/folder
#' @examples

mean_global <- function(data){
  data2 = data |>
    dplyr::filter(nchar(Code)==3) |>
    dplyr::group_by(Entity, Code) |>
    dplyr::summarise(conso = mean(sh_alc_pcap_li))
  return(data2)
}

