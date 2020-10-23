#' Global epidemic situation of COVID-19 (more observations)
#'
#' This dataset contains daily epidemic information of COVID-19 for 215 countries or regions, from 2020-01-22 to 2020-10-03.
#'
#'
#' @name covid_19_all
#'
#' @keywords datasets
#'
#' @format
#' A data frame (tibble) with 679981 observations and 6 variables:
#'
#' - **country_region**: The name of the country or region
#' - **province_state**: The name of the province or state of different countries
#' - **confirmed**: The confirmed case
#' - **recovered**: The confirmed case
#' - **deaths**: The death case
#' - **date**: The observation date
#'
#'
#'
#' @examples
#' library(COVID19bb)
#' data(covid_19_all)
#'
#' @source
#' This data comes from 'COVID19 Daily Updates' <https://www.kaggle.com/gpreda/coronavirus-2019ncov>
#'
"covid_19_all"
