#
#
# Project description
# ...
#
# Author:
# Date: 2025/12/04

# Setup project ----

## Install packages ----
#rcompendium::add_dependencies()
devtools::install_deps(upgrade = "never")


# source(here::here("analyses", "download_data.R"))

targets::tar_make()
targets::tar_visnetwork()
