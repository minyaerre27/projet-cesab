#' @title Calculation annual consumption
#' @description Calculates the annual consumption in liters of alcohol per person
#' @param data Database with at least 4 columns : wine, beer, liquor, apetizer

consumption_year <- function(data){
    alcool_wine <- data$wine*0.12*0.1
    alcool_beer <- data$beer*0.05*0.25
    alcool_liquor <- data$liquor*0.4*0.025
    alcool_apetizer <- data$apetizer*0.18*0.07
    cons_week <- alcool_wine+alcool_beer+alcool_liquor+alcool_apetizer
    cons_year <- cons_week*52
    return(cons_year)
}

