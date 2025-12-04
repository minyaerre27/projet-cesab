library(targets)
library(ggplot2)

## Load packages & functions ----
targets::tar_source()

list(

  # get path file world data
  tar_target(
    name = data_files,
    command = download_world_data(),
    format = "file"
  ),
  
  # load file world data
  tar_target(
    name = world_db,
    command = load_data(data_files)
  ),

  # get mean alcohol values per country
  tar_target(mean_data, mean_global(world_db))

)
