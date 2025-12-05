library(targets)
library(ggplot2)
library(sf)

## Load packages & functions ----
targets::tar_source()

list(
  # download the world data if needed and get the path to the .csv file
  tar_target(
    name = world_data_path,
    command = download_world_data(),
    format = "file"
  ),

  # load the world data in the working environment
  tar_target(
    name = world_db,
    command = load_data(world_data_path)
  ),

  # get mean alcohol conusmption values per country
  tar_target(name = mean_world_data, command = mean_global(world_db)),

  # load personal data
  tar_target(
    name = personal_data,
    command = load_data(here::here("data", "smallData.csv"))
  ),

  # compute the yearly consumption of the participants
  tar_target(
    name = year_consumption,
    command = consumption_year(personal_data)
  ),

  tar_target(
    name = data_pays_simi,
    command = pays_similaire(year_consumption, mean_world_data)
  ),

  tar_target(
    name = data_pays_diff,
    command = diff_ton_pays(year_consumption, mean_world_data)
  ),

  tar_target(
    name = spatial_countries,
    command = import_spatial_countries()
  ),

  tar_target(
    name = spatial_results,
    command = join_countries(spatial_countries, data_pays_simi)
  ),

  tar_target(
    name = plot_map_results,
    command = plot_map(spatial_results)
  ),

  tar_target(
    name = plot_diff_countries,
    command = plot_diff_pays(data_pays_diff)
  ),
  tar_target(
    name = plot_histo_perso,
    command = whereAreU(
      year_consumption,
      mean_world_data,
      pseudonyme = "pepe"
    )
  )

  #,tarchetypes::tar_quarto(report, priority = 0)
)
