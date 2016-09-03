# package build helper

mypath <- # path where your files are stored
  #mypath <- "C:\\Users\\kross-smith\\Documents\\02_projects\\Training\\satRday\\shinyGadget"
  
  devtools::build(mypath)
devtools::install(mypath)
