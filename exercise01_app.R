ui <- shinyUI(fluidPage(
  
  textInput("identity", "Who are you?", value = "World"),
  
  #-------------------------------------------------------------------------------------------------
  # use shiny::selectInput to add an input box in here asking the user what language they would like
  # copy the choices from the language column in the lookup dataframe on line x below to put in here
  #-------------------------------------------------------------------------------------------------
  
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
    
    #-------------------------------------------------------------------------------------------------
    # Change how we say hello to the user depending on what language they have chosen
    #-------------------------------------------------------------------------------------------------
  
  })
  
})

shinyApp(ui = ui, server = server)
