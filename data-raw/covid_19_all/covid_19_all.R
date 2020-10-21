## code to prepare `covid_19_all` dataset goes here
library(tidyverse)

covid_19_all <- read_csv(here::here("data-raw/covid_19_all/covid-19-all.csv"))

usethis::use_data(covid_19_all, overwrite = TRUE)
