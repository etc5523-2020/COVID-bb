#' Global epidemic situation of COVID-19
#'
#' This dataset contains daily epidemic information of COVID-19 for 222 countries or regions, from 2020-01-22 to 2020-09-24.
#'
#' @name covid_19_data
#'
#' @keywords datasets
#'
#' @format
#' A data frame (tibble) with 116355 observations and 4 variables:
#'
#' - **observation_date**: Observation date
#' - **country_region**: The name of the country or region
#' - **type**: The type of the case (confirmed, recovered, deaths)
#' - **count**: The number of daily cases of each type
#'
#'
#'
#'
#' @examples
#' library(COVID19bb)
#' data(covid_19_data)
#'
#' @source
#' This data comes from [World Health Organization]<https://www.who.int/emergencies/diseases/novel-coronavirus-2019>
#'
"covid_19_data"
