library(targets)
library(ggplot2)

## Load packages & functions ----
targets::tar_source()

list(
  tar_target(
    name = data_files,
    command = download_world_data(),
    format = "file"
  ),
  tar_target(
    name = world_db,
    command = load_world_data()
  )
)
