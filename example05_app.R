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
      
      

    )
  )

))

server <- shinyServer(function(input, output) {
  
  
})

shinyApp(ui = ui, server = server)
