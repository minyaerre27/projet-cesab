library(targets)
library(ggplot2)

## Load packages & functions ----
targets::tar_source()

list(
  tar_target(
    name = data_file,
    command = download_world_data(),
    format = "file"
  ),

  tar_target(
    name = world_db,
    command = load_data(data_file)
  ),

  tar_target(mean_data, mean_global(world_db))
)
