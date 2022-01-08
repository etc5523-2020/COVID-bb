#' Add selectInput sidebar for shiny app
#'
#' @description
#' Function `select_input()` can help users select input object within the Shiny Application
#'
#' @param inputId The ID of the input object
#' @param label  The text label set for the input object
#' @param choices  List of values to select from
#' @param selected  The default selected option
#'
#'@import shiny
#'
#' @examples
#' \dontrun{
#' select_input("type",label = NULL, choices = NULL,selected = NULL)
#'}
#'
#' @return A shiny selected-input sidebar
#'
#' @export
select_input <- function(inputId,label,choices,selected){

  shiny::selectInput(
    inputId = 'type',
    label = "Which type to explore?",
    choices = sort(unique(covid_19_data$type)),
    # choose seventh option as default selected
    selected = sort(unique(covid_19_data$type))[1]
  )

}

