ui <- shinyUI(fluidPage(
  
  #-------------------------------------------------------------------------------------------------
  # use column or sidebar layout to put the input and output items on separate columns
  #-------------------------------------------------------------------------------------------------
  
  textInput("identity", "Who are you?", value = "World"),
  selectInput("language", 
              "What language would you like?", 
              choices = sort(c("English", "French", "German", "Spanish", "Italian", "Hungarian"))
  ),
  
  textOutput("helloAns")
  
))

server <- shinyServer(function(input, output) {
  
  lookup <- data.frame(
    language = c("English", "French", "German", "Spanish", "Italian", "Hungarian"),
    salutation = c("Hi", "Salut", "Hallo", "Hola", "Ciao", "Szia")
  )
  
  output$helloAns <- renderText({
    paste(lookup$salutation[lookup$language==input$language], input$identity)
  })
  
})

shinyApp(ui = ui, server = server)
