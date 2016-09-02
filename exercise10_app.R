library(shiny)
library(miniUI)

ui <- shinyUI(fluidPage(

    titlePanel("Render Plot in a Shiny App"),
    
    sidebarLayout(
      sidebarPanel(
        sliderInput("numberInput", "Select size of data:", 
                     min = 0, max = 500, value = 100),
        selectInput("colInput", "Select a colour", 
                    choices = sample(colours(), 10))
      ),
      
      mainPanel(
        plotOutput("plotOutput")
      )
    )

))

server <- shinyServer(function(input, output) {
  
  getData <- reactive({ 
    rnorm(input$numberInput)
  })
  
  output$plotOutput <- renderPlot(
    hist(getData(), col = input$colInput)
  )
  
})

shinyApp(ui = ui, server = server)
