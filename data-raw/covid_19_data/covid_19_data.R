## code to prepare `covid_19_data` dataset goes here

library(tidyverse)


covid_19_data <- read_csv(here::here("data-raw/covid_19_data/covid_19_data.csv"))

covid_19_data <- covid_19_data %>%
  janitor::clean_names() %>%
  filter(!country_region %in% 'Others') %>%
  group_by(country_region) %>%
  select(observation_date, confirmed, recovered, deaths,country_region) %>%
  group_by(observation_date,country_region) %>%
  summarise(confirmed = sum(confirmed),
            recovered = sum(recovered),
            deaths = sum(deaths)) %>%
  pivot_longer(cols = confirmed : deaths, names_to = "type", values_to = "count")

covid_19_data$`country_region`[covid_19_data$`country_region`  == "Mainland China"] = "China"
covid_19_data$`country_region`[covid_19_data$`country_region`  == "US"] = "United States of America"


usethis::use_data(covid_19_data, overwrite = TRUE)

