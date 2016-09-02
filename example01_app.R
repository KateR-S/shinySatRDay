ui <- shinyUI(fluidPage(
  
  textInput("identity", "Who are you?", value = "World"),
  
  textOutput("helloAns")
  
))

server <- shinyServer(function(input, output) {
  
  output$helloAns <- renderText({
    paste("Hello", input$identity)
  })
  
})

shinyApp(ui = ui, server = server)
