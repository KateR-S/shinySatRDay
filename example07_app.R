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
  
  getData <- reactive({
    
    print("dummyBox1 recalc")
    db1 <- as.numeric(input$dummyBox)
    print("dummyBox2 recalc")
    db2 <- as.numeric(input$dummyBox2)
    print("slider recalc")
    ds <- input$dummySlider
    
    c(db1, db2, ds)
  })
  
  output$clickPlot <- renderPlot({
    
    barplot(getData(), 
            names.arg = c("checkBox 1", "checkBox 2", "slider"),
            ylim = c(0,1))
    
  })
  
})

shinyApp(ui = ui, server = server)
