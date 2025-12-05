#' Compare to residence country
#' Function to plot the difference between
#' @param data_diff_pays data with user's consumption,

plot_diff_pays <- function(data_diff_pays) {
  data2 <- data_diff_pays |>
    dplyr::mutate(position = ifelse(cons_year > conso, "over", "under"))

  plot_diff <- ggplot(data2) +
    geom_segment(aes(
      x = pseudonyme,
      xend = pseudonyme,
      y = cons_year,
      yend = conso
    )) +
    geom_point(aes(x = pseudonyme, y = cons_year, color = position), size = 3) +
    scale_color_manual(values = c("over" = "darkred", "under" = "darkgreen")) +
    geom_point(
      aes(x = pseudonyme, y = conso, shape = country.residence),
      size = 3
    ) +
    geom_text(aes(
      x = pseudonyme,
      ifelse(position == "under", cons_year - 1, cons_year + 1),
      label = round(diff.meanCountry, 2)
    )) +
    labs(
      x = "Pseudo",
      y = "Yearly consumption",
      color = "Comparison",
      shape = "Country"
    ) +
    theme_minimal() +
    theme(axis.text.x = element_text(angle = 45, vjust = 0.5, hjust = 0.5))

  ggsave(
    here::here("figures", "country_diff.png"),
    plot = plot_diff,
    width = 8,
    height = 5
  )
  return(plot_diff)
}
