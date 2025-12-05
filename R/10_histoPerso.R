#' Function to plot and histogram and where you are
#'
#' @param year_consumption, the consumption per person
#' @param mean_world_data the mean world data of countries
#' @param pseudonyme the person you want to plot
#' @return the plot
#' @examples pseudonyme = tenayuco, year_consumption, mean_world_data

whereAreU <- function(
  year_consumption,
  mean_world_data,
  pseudonyme = "pepe"
) {
  conso_pseu <- year_consumption$cons_year[
    year_consumption$pseudonyme == pseudonyme
  ]


  less_countries <- mean_world_data$Entity[abs(
    mean_world_data$conso < conso_pseu
  )]
  per_less_countries <- round(
    length(less_countries) / dim(mean_world_data)[1] * 100
  )

  # Small multiple
  plot1 <- ggplot(mean_world_data, aes(x = conso, fill = Entity)) +
    geom_histogram(aes(group = Entity), col = "black", binwidth = 0.5) +
    theme_minimal() +
    theme(legend.position = "none") +
    scale_fill_viridis_d() +
    annotate(geom = "rect", xmin = conso_pseu, xmax = 20, ymin=0, ymax = 16,
           fill = "white", alpha = 0.5) +
    geom_text(
      x = 10,
      y = 14,
      label = paste0(
        "You drink more than in ",
        per_less_countries,
        "% ",
        "of the countries"
      ),
      size = 3
    ) +
    geom_segment(
      aes(x = conso_pseu, xend = conso_pseu, y = -2, yend = 12),
      linetype = "dashed",
      colour = "darkred"
    ) +
    labs(x = "Annual consommation (L)", y = "Number of countries")

  ggsave(
    here::here("figures", "histo_perso.png"),
    plot = plot1,
    width = 7,
    height = 7
  )
  return(plot1)
}
