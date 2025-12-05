


whereAreU <- function(year_cons, m_world_data, pseudonyme) {

pseudonyme <- "tenayuco"
conso_pseu <- year_cons$cons_year[year_cons$pseudonyme==pseudonyme]

countries <- m_world_data$Entity[abs(m_world_data$conso- conso_pseu) <0.1]  
listCountries <- ""
for (i in countries){listCountries <- paste(listCountries, i, sep=" ")}  
  
  # Small multiple
plot1 <- ggplot(m_world_data, aes(x=conso, fill=Entity))+
    geom_histogram(aes(group=Entity), col="black", binwidth = 0.1)+
    theme_minimal()+
    theme(legend.position = "none")+
    scale_fill_viridis_d() +
  geom_text(x=conso_pseu+1, y=12, label=paste0("You drink like people in", listCountries)) +
  geom_segment(aes(x=conso_pseu, xend = conso_pseu,y=-2, yend = 12), linetype="dashed", colour= "darkred")+
  labs(x = "Annual consommation", y="Number of countries")

return(plot1)
  
}