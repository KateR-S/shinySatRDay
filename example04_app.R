ui <- shinyUI(fluidPage(
  
  sidebarLayout(
    
    sidebarPanel(
      
      h1("An Introduction to R"),
      h2("The R environment"),
      h3("from the R help pages")
  
  ),
  
  mainPanel(
    p("R is an integrated suite of software facilities for data manipulation, 
     calculation and graphical display. Among other things it has an effective 
     data handling and storage facility, a suite of operators for calculations 
     on arrays, in particular matrices, a large, coherent, integrated collection 
     of intermediate tools for data analysis, graphical facilities for data 
     analysis and display either directly at the computer or on hardcopy, and
     a well developed, simple and effective programming language (called 'S') 
     which includes conditionals, loops, user defined recursive functions and 
     input and output facilities. (Indeed most of the system supplied functions
     are themselves written in the S language.)"),
         
  p("The term 'environment' is intended to characterize it as a fully planned 
     and coherent system, rather than an incremental accretion of very specific 
     and inflexible tools, as is frequently the case with other data analysis 
     software.
     R is very much a vehicle for newly developing methods of interactive 
     data analysis. It has developed rapidly, and has been extended by a large 
     collection of packages. However, most programs written in R are essentially 
     ephemeral, written for a single piece of data analysis.")
  )
  )
))

server <- shinyServer(function(input, output) {
  
  
})

shinyApp(ui = ui, server = server)
