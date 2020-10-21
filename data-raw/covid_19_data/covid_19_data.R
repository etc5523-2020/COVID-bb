## code to prepare `covid_19_data` dataset goes here

library(tidyverse)


covid_19_data <- read_csv(here::here("data-raw/covid_19_data/covid_19_data.csv"))


usethis::use_data(covid_19_data, overwrite = TRUE)

