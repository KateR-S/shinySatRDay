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
  
  getd1 <- reactive({
    print("dummyBox1 recalc")
    as.numeric(input$dummyBox)
  })
  
  getd2 <- reactive({ 
    print("dummyBox2 recalc")
    as.numeric(input$dummyBox2)
  })
  
  getd3 <- reactive({
    print("dummySlider recalc")    
    input$dummySlider
  })
  
  output$clickPlot <- renderPlot({
    
    barplot(c(getd1(), getd2(), getd3()), 
            names.arg = c("checkBox 1", "checkBox 2", "slider"),
            ylim = c(0,1))
    
  })
  
})

shinyApp(ui = ui, server = server)
