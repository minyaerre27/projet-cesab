library(targets)
library(ggplot2)
library(sf)

## Load packages & functions ----
targets::tar_source()

list(
  # download the data if needed and get the path to the .csv files
  tar_target(
    name = world_data_path,
    command = download_world_data(),
    format = "file"
  ),

  tar_target(
    name = small_data_path,
    command = here::here("data", "smallData.csv"),
    format = "file"
  ),

  tar_target(
    name = alcolo_data_path,
    command = here::here("data", "alcolo_example.csv")
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
    command = load_data(small_data_path)
  ),

  # load alcolo data
  tar_target(
    name = alcolo_data,
    command = load_data(alcolo_data_path)
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
    name = plot_map_results_group,
    command = plot_map(
      spatial_results,
      dest = "group_figs"
    )
  ),

  tar_target(
    name = plot_diff_countries_group,
    command = plot_diff_pays(
      data_pays_diff,
      dest = "group_figs"
    ),
  ),
  tar_target(
    name = plot_histo_perso_group,
    command = whereAreU(
      year_consumption,
      mean_world_data,
      dest = "group_figs",
      pseudonyme = "pepe"
    )
  ),

  # compute the yearly consumption of the participants
  tar_target(
    name = alcolo_year_consumption,
    command = consumption_year(alcolo_data)
  ),

  tar_target(
    name = alcolo_pays_simi,
    command = pays_similaire(alcolo_year_consumption, mean_world_data)
  ),

  tar_target(
    name = alcolo_pays_diff,
    command = diff_ton_pays(alcolo_year_consumption, mean_world_data)
  ),

  tar_target(
    name = alcolo_spatial_results,
    command = join_countries(spatial_countries, alcolo_pays_simi)
  ),

  tar_target(
    name = plot_map_results_alcolo,
    command = plot_map(
      alcolo_spatial_results,
      dest = "alcolo"
    )
  ),

  tar_target(
    name = plot_diff_countries_alcolo,
    command = plot_diff_pays(
      alcolo_pays_diff,
      dest = "alcolo"
    ),
  ),
  tar_target(
    name = plot_histo_perso_alcolo,
    command = whereAreU(
      alcolo_year_consumption,
      mean_world_data,
      dest = "alcolo",
      pseudonyme = "alcolo"
    )
  )

  # ,
  # tarchetypes::tar_quarto(report, priority = 0)
)
