library(tidyverse)
library(ggplot2)
library(shiny)
library(plotly)
library(leaflet)
library(DT)
library(highcharter)
library(dplyr)
library(shinythemes)
library(COVID19bb)




# Define Navbar Pages

ui <- navbarPage(

  theme = shinytheme("flatly"),
  "COVID-19 Global Analysis",
  fluid = TRUE,
  tabPanel(
    "Distribution of cases",
    sidebarLayout(
      sidebarPanel = sidebarPanel(
        selectInput(
          inputId = 'type',
          label = "Which type to explore?",
          choices = sort(unique(covid_19_data$type)),
          # choose seventh option as default selected
          selected = sort(unique(covid_19_data$type))[1]
        ),
        textOutput(outputId = 'explain_region'),
        width = 4 # set the width of sidebar part
      ),
      mainPanel = mainPanel(
        textOutput(outputId = 'selected_type'),
        highchartOutput(outputId = 'map', height = '450px'),
        textOutput(outputId = 'explain_region_1'),
        width = 8,
      )
    )
  ),

  tabPanel(
    "Trend among regions over time",
    sidebarLayout(
      sidebarPanel = sidebarPanel(
        selectInput(
          inputId = 'province_state',
          label = "Which region to explore?",
          choices = sort(unique(covid_19_all$province_state)),
          # choose seventh option as default selected
          selected = sort(unique(covid_19_all$province_state))[35]
        ),
        textOutput(outputId = 'rate_2'),
        width = 4 # set the width of sidebar part
      ),
      mainPanel = mainPanel(
        textOutput(outputId = 'selected_region'),
        plotlyOutput(outputId = 'rate', height = '350px'),
        textOutput(outputId = 'rate_1'),

        width = 8,
      )
    )
  ),

  tabPanel(
    "Table",
    DT::dataTableOutput("table")

  ),


  navbarMenu(
    "More",
    tabPanel("About",
             fluidRow(
               column(6,
                      includeMarkdown("about.md")),
               column(3,
                      img(src='yiwen.jpeg', align = "right",height = '188.688px', width = '300px'),)
             )
    ),
    tabPanel("Instrcution",
             fluidRow(
               column(6,
                      includeMarkdown("README.md")),
               column(3,
                      img(src='covid19-russia.jpg', align = "right",height = '144.688px', width = '255px'),
                      tags$small(
                        "Source: Retrieved from The Wall Street Journal ",

                        a(href="https://www.wsj.com/articles/russia-seeks-to-register-first-coronavirus-vaccine-in-august-11596047326",
                          "The Wall Street Journal")))
             )
    ),
    tabPanel("Acknowledgements",
             fluidRow(

               includeMarkdown("reference.md"),
             )
    )

  )

)

server <- function(input, output, session) {
  output$selected_region <- renderText({
    paste('Selected Region: ', input$province_state)
  })

  output$rate <- renderPlotly({
    covid_19_filter <- covid_19_all %>% filter(province_state == input$province_state)
    ggplot(data = covid_19_filter) +
      geom_line(data = covid_19_filter, aes(x = obervation_date, y = recovered), color = "green") +
      geom_line(data = covid_19_filter, aes(x = obervation_date, y = deaths), color = "red") +
      geom_line(data = covid_19_filter, aes(x = obervation_date, y = confirmed), color = "yellow") +
      ggtitle("Comparing COVID-19 trends across regions globally over time") +
      xlab('Dates') +
      ylab('Cases')
  })

  output$selected_type <- renderText({
    paste('Selected Type: ', input$type)
  })

  output$explain_region <- renderText({
    "please select the type of the case then the global distribution of that will display on the right side!"
  })

  output$explain_region_1 <- renderText({
    "The figure compares the COVID-19 cases across regions by case type.
    The closer the color is to purple, the less the count is, and the closer the color is to yellow, the more the count is.
    The United States has the largest number of confirmed cases and deaths, which shows that the United States is the most serious epidemic area in the world. India has the largest number of cured cases, with the cure rate reaching to around 81.3%, which indicates that India's medical conditions are worthy of recognition in this case."
  })

  output$rate_2 <- renderText({
    "please select the province/state then the line chart of that will display on the right side!"
  })

  output$rate_1 <- renderText({
    "The figure shows the trends of confirmed, death and recovered cases in provinces/states around the world changing over time.
    The yellow line represents the confirmed case, the green line represents the recovered case and the red line represents the deaths.
    "
  })

  output$map <- renderHighchart({
    covid_19_data_filter <- covid_19_data %>% filter(type == input$type)
    highchart() %>%
      hc_add_series_map(worldgeojson, covid_19_data_filter, value = 'count', joinBy = c('name','country_region'))  %>%
      #hc_colors(c("darkorange", "darkgray")) %>%
      hc_colorAxis(stops = color_stops()) %>%
      hc_title(text = "Countries with COVID-19 exposure") %>%
      hc_subtitle(text = 'with Total Cases -  Figures')
  })

  output$table <- DT::renderDataTable({
    DT::datatable(covid_19_all)
  })

}

# Run the application
shinyApp(ui = ui, server = server)
