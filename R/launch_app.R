#' Load the shiny app
#'
#' @description
#' This function is used to launch the COVID-19 Global Analysis Shiny Application from the `COVID19bb` package.
#'
#' @import shiny
#'
#' @details
#' This app is intended to be used as an intuitive and easy-to-understand visualization tool for COVID-19 research, users can observe the total distribution of confirmed cases, death cases and recovered cases around the world by selecting the type of the distribution they want to view, as well as exploring the trends of mortality, diagnosis recovered counts among provinces or states of different countries all over the world.
#'
#' @examples
#' \dontrun{
#' launch_app()
#' }
#'
#' @export
launch_app <- function(){
  appAddr <- system.file("app", "app.R", package = "COVID19bb")
  if(appAddr == ""){
    stop("Could not find example directory. Try re-installing `COVID19bb` package.")
  }

  shiny::runApp(appAddr, display.mode = "normal")
}
