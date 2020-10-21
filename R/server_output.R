#' Create distribution map
#'
#' @description
#' Function `distribution_map()` can create a distribution map of desired objects
#'
#' @param
#' data: The data used to draw the distribution
#' Var1: The variable whose distribution is intended to be displayed in the map
#' Var2: The variable used to join the data with worldgeojson list. (i.e. the country or the region name)
#'
#'@import highcharter
#'
#' @examples
#' \dontrun{
#' distribution_map(data = covid_19_data,Var1 = count, Var2 = country_region)
#' }
#'
#' @return A distribution world map of certain objects
#'
#' @export
#'
distribution_map <- function(data,Var1,Var2){

  data(worldgeojson, package = "highcharter")

  highcharter::highchart() %>%
    hc_add_series_map(worldgeojson, {{data}}, value = '{{Var1}}', joinBy = c('name','{{Var2}}'))  %>%
    #hc_colors(c("darkorange", "darkgray")) %>%
    hc_colorAxis(stops = color_stops()) %>%
    hc_title(text = "Global Distribution") %>%
    hc_subtitle(text = 'of Total Cases -  Figures')


}

