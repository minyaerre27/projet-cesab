#
#
# Project description
# ...
#
# Author:
# Date: 2025/12/04

# Setup project ----

## Install packages ----
rcompendium::add_dependencies()
devtools::install_deps(upgrade = "never")


targets::tar_make()
targets::tar_visnetwork()

# quarto::quarto_render(".")
