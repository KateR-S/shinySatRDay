ui <- shinyUI(fluidPage(
  
  sidebarLayout(

    sidebarPanel(
      
      checkboxInput("dummyBox",
                    "Check and uncheck"),
      
      checkboxInput("dummyBox2",
                    "Check and uncheck"),
      
      sliderInput("dummySlider",
                  "Move the slider",
                  min = 0,
                  max = 1,
                  value = 0.5)
    ),
    
    mainPanel(

      plotOutput("clickPlot")

    )
  )

))

server <- shinyServer(function(input, output) {
  
  output$clickPlot <- renderPlot({
    
    barplot(c(as.numeric(input$dummyBox), 
              as.numeric(input$dummyBox2),
              input$dummySlider), 
            names.arg = c("checkBox 1", "checkBox 2", "slider"),
            ylim = c(0,1))
  
  })
  
})

shinyApp(ui = ui, server = server)
