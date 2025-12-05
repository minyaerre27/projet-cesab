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
  pseudonyme = "alcolo"
) {
  conso_pseu <- year_consumption$cons_year[
    year_consumption$pseudonyme == pseudonyme
  ]

  countries <- mean_world_data$Entity[
    abs(mean_world_data$conso - conso_pseu) < 0.5
  ]
  listCountries <- ""
  for (i in countries) {
    listCountries <- paste(listCountries, i, sep = ".")
  }

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
    geom_text(
      x = 15,
      y = 14,
      label = paste0(
        "You drink more than ",
        per_less_countries,
        "% ",
        "of the countries"
      ),
      size = 3
    ) +
    geom_text(
      x = conso_pseu + 10,
      y = 12,
      label = paste0("You drink like people in", listCountries),
      size = 3
    ) +
    geom_segment(
      aes(x = conso_pseu, xend = conso_pseu, y = -2, yend = 12),
      linetype = "dashed",
      colour = "darkred"
    ) +
    labs(x = "Annual consommation", y = "Number of countries")

  ggsave(
    here::here("figures", "histo_perso.png"),
    plot = plot1,
    width = 7,
    height = 7
  )
  return(plot1)
}
