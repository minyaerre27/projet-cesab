#' Function to plot the countries that the participants are the closest to in terms of yearly alcohol consumption
#'
#' @param spatial_res the results of our analysis with spatial component
#' @return the ggplot object
#' @examples
#'
plot_map = function(spatial_res) {
  map_alcohol = spatial_res |>
    ggplot() +
    geom_sf(aes(fill = pseudonyme)) +
    theme_minimal() +
    theme(plot.title = element_text(hjust = 0.5)) +
    ggtitle(
      "Countries with the most affinity drinking-wise"
    )
  ggsave(here::here("figures", "map_alcohol.png"), plot = map_alcohol)

  return(map_alcohol)
}
