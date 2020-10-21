## code to prepare `covid_19_all` dataset goes here
library(tidyverse)

covid_19_all <- read_csv(here::here("data-raw/covid_19_all/covid-19-all.csv"))

covid_19_all <- covid_19_all %>%
  janitor::clean_names() %>%
  drop_na() %>%
  group_by(country_region,date) %>%
  select(-longitude,-latitude)

covid_19_all$`country_region`[covid_19_all$`country_region`  == "US"] = "United States of America"

usethis::use_data(covid_19_all, overwrite = TRUE)
