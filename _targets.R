library(targets)
library(ggplot2)

## Load packages & functions ----
targets::tar_source()

list(
  # get path file world data
  tar_target(
    name = data_file,
    command = download_world_data(),
    format = "file"
  ),

  tar_target(
    name = world_db,
    command = load_data(data_file)
  ),

  tar_target(mean_data, mean_global(world_db)),

  tar_target(
    name = small_data,
    command = load_data(here::here("data", "smallData.csv"))
  ),

  # get mean alcohol values per country
  tar_target(mean_data, mean_global(world_db)),

  tar_target(name = year_consumption, command = consumption_year)
)
