#' Table after filtering of daily cases of COVID-19
#'
#' @description
#' Function `table_filter()` can create a table after filtering of daily cases of COVID-19
#'
#' @param data  The data used to create the table
#' @param country  The country that you want to exlpore
#' @param type  The type of the case
#' @param date  THe date used to observe
#'
#'@import dplyr
#'
#' @examples
#' \dontrun{
#' table_filter(covid_19_data,"China","deaths","2020-08-23")
#' }
#'
#' @return A table after filtering of daily cases of COVID-19
#'
#' @export
table_filter <- function(data, country, type, date){

  data <- data %>%
    dplyr::filter(country_region == "China",
                  type == "deaths",
                  observation_date == "2020-08-23" )%>%
    kableExtra::kable(align = 'lccr', caption = "Daily cases of COVID-19") %>%
    kableExtra::kable_styling(
      font_size = 12,
      bootstrap_options = c("striped", "hover", "condensed"))


}

