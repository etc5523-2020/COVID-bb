test_that("select_input", {
  expect_equal(select_input("type",label = NULL, choices = NULL,selected = NULL),

               shiny::selectInput(
                 inputId = 'type',
                 label = "Which type to explore?",
                 choices = sort(unique(covid_19_data$type)),
                 # choose seventh option as default selected
                 selected = sort(unique(covid_19_data$type))[1]
               ))


})
