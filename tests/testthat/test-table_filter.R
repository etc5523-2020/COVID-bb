test_that("table_filter()", {
  expect_equal(table_filter(covid_19_data,"China","deaths","2020-08-23"),


               covid_19_data <- covid_19_data %>%
                 dplyr::filter(country_region == "China",
                               type == "deaths",
                               observation_date == "2020-08-23")%>%
                 kableExtra::kable(align = 'lccr', caption = "Daily cases of COVID-19") %>%
                 kableExtra::kable_styling(
                   font_size = 12,
                   bootstrap_options = c("striped", "hover", "condensed"))
  )
})
