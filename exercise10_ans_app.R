library(shiny)
library(miniUI)

myGadget <- function() {

  ui <- miniPage(
    miniContentPanel(
        sliderInput("numberInput", "Select size of data:", 
                     min = 0, max = 500, value = 100),
        selectInput("colInput", "Select a colour", 
                    choices = sample(colours(), 10)),
        plotOutput("plotOutput")
      )
  )
  

  server <- function(input, output, session) {
  
  getData <- reactive({ 
    rnorm(input$numberInput)
  })
  
  output$plotOutput <- renderPlot(
    hist(getData(), col = input$colInput)
  )
  
  }

  runGadget(ui, server)
}
