library(shiny)

ui <- fluidPage(
  h1("Example app"),
  sidebarLayout(
    sidebarPanel(
      numericInput("nrows", "Number of rows", 10)
    ),
    mainPanel(
      plotOutput("plot"),
      tableOutput("table")
    )
  )
)

server <- function(input, output, session) {
  #-------------------------------------------------------------------------------------------------
  # Make the code below more efficient using a reactive function
  #-------------------------------------------------------------------------------------------------
  
  output$plot <- renderPlot({
    plot(head(cars, input$nrows))
  })
  
  output$table <- renderTable({
    head(cars, input$nrows)
  })
}

shinyApp(ui, server)