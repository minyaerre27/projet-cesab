#' Function to download on the the three files from the WWF Wildfinder in the data repository
#'
#' @param csv_name the name of the ".csv" file that we want to download from datarepo/tree/main/data/wildfinder/
#' @return vector of the files directories in the data/folder
#' @examples
#' dl_wildfinder_data()

mean <- function(data){
  data2 = data |>
    dplyr::group_by(Entity) |>
    dplyr::summarise(conso = mean(sh_alc_pcap_li))
  return(data2)
}
