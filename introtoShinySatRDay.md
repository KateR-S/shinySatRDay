# Getting Started With Shiny
Kate Ross-Smith  

## Pre-requisites

Before we start the workshop, please make sure you have the following installed:

|Essential|Nice to Have|
|:-------:|:----------:|
|Workshop Files|RStudio
|R|devtools
|shiny|miniUI
|||ggplot2

<p class="note"> Workshop files are on the memory sticks floating around or on github /KateR-S/shinySatRDay</p>


## Outline
|||
|:-:|:-:|
|Section 1|Make a basic app|
|Section 2|Make a kick-ass app|
|Section 3|Make the app into an add-in|

<p class="note"> If you want to take a break at any point, please just do so... slides are on the memory stick too so you can always catch up!</p>

# Let's start with an app!

## A super basic app

1. Load Shiny
1. Open ```example01_app.r```
1. Run the app

# The anatomy of an app

## What the user sees:

* Some kind of web page
* Input elements
* Output elements

## What's in the code


```r
ui <- shinyUI(
  fluidPage(                        <-- Web page
   
  textInput("identity",             <-- Input element
            "Who are you?", 
            value = "World"),
  
  textOutput("helloAns")            <-- Output element
   
))
```

## What the user does:

* sees a different answer
* depending on what they've put in the text box


## What's in the code


```r
server <- shinyServer(function(input, output) {
                                                        
  output$helloAns <- renderText({   <-- A different answer
                                                        
    paste("Hello", 
          input$identity)           <-- Contents of the text box
  })
  
})
```

## Full anatomy

1. ui
    * object created by shinyUI function
    * in basic apps contains the "user interface" functionality

2. server
    * object created by shinyServer function
    * controls what R does during user interactivity

3. shinyApp
    * the function that kicks off the running of the app

# Some important points

## UI elements are function calls

* ui elements are often **calls to functions**. 
* But they can have **a lot** of arguments. 
* So we often put them on multiple lines.
* **IT IS REALLY EASY TO FORGET TO COMMA SEPARATE THE ARGUMENTS!**

## How and where to run... choices

* you can run shiny apps by either:
    * using ```runApp()``` or 
    * by clicking Run App in RStudio
* you can also choose where the app runs
    * Window
    * Viewer pane
    * External

## Exercise 01

Have a look at ```exercise_01_app.R```.
The code indicated by the comments needs finishing.

Finish it!

# Splitting the page

## Main layout options

* Split the page into columns
* Add a sidebar

## Columns

* Uses the ```column()``` function
* Where the page is split into a 'grid'
* With a max width of 12

<p class="note"> This is implemented with an html-generating function


## Sidebar

* Within ```fluidpage()```
* Uses a ```sidebarLayout()```
* With a ```sidebarPanel()``` and a ```mainPanel()```

<p class="note"> Have a look at example03_app.R to see this</p>

## Exercise 02

Have a look at ```exercise_02_app.R```.
The code indicated by the comments needs finishing.

Finish it!

# Inputs and Outputs

## What's available?

## 1. Input widgets

Examples:

* __Buttons__: actionButton, downloadButton, submitButton
* __Simple Choices__: checkboxInput, radioButtons, sliderInput
* __Pickers__: selectInput, selectizeInput, dateInput
* __Simple input__: numericInput, textInput
* __Special cases__: fileInput, passwordInput


## 2. Output widgets
* dataTableOutput - renderDataTable
* img - renderImage
* plotOutput - renderPlot
* textOutput - renderText
* tableOutput - renderTable

## 3. Html output
|||
|:-:|:-:|
|Headings|h1(), h2(), h3(), h4(), h5()...
|Dividers|span(), br()
|Text formatting|strong(), em(), pre(), code()
|Objects|img(), a()
|Raw html|html()

## Want more?

But there are more available!

<a>http://shiny.rstudio.com/reference/shiny/latest</a>

## Exercise 03

Create a ui that has:

* two checkboxes
* one slider going from 0 to 1

<p class="note"> Use ```exercise03_app.R``` for the app barebones </p>

## Exercise 04

Now on that same file:

* Add a bar plot that displays the values of the inputs
* hint: use as.numeric for the checkbox values

<p class="note"> Use ```exercise04_app.R``` if you haven't finished the previous exercise </p>

## Exercise 05

Start with a blank R script, and make a shiny app that:

* asks a user for:
    * a number between 1 and 500
    * a colour from a list (hint: ```?colours```)
* and displays:
    * a histogram of random samples from the normal distribution
    * with n being the number input by the user
    * filled with the user's colour choice

# ...we need to talk about reactivity

## Reactivity

We've been using a version of it in a lot of our apps so far. It's just the way that shiny handles:

* the user doing something
* and the app 'reacting' to that

So why change?

## INPUT - RENDER - OUTPUT model

When the user changes their choices, we're actually __re-running all of the code in the app__. 

Not good.


## INPUT - RENDER - REACTIVE() - OUTPUT

We can put the "changing" code in a ```reactive()``` function.

This means that this portion of the code is only re-run when that value is changed.

The more things are separated out, the more targetted the code re-run is.

<p class="note"> Have a look at ```example07_app.R``` and ```example08_app.R``` to see this</p>

## Exercise 06

Take the output from the last exercise (exercise 05) and make it more efficient using the ```reactive()``` function.

<p class="note"> Use ```exercise06_app.R``` if you haven't finished the previous exercise </p>

## Other reactives

We can make our reactive more specific other types of reactive. These functions create a reactive dependency on a specfic object type. e.g.:

* reactiveValues
* reactiveText
* reactivePlot
* reactivePoll

## Observers

As well as creating a chain of events with ```reactive()``` we can use observers.

* Observers are blocks of code that perform actions.
* They are executed in response to changing reactive values/expressions.
* They don't return a value.

## Observers come in two flavours

> 1. **Implicit:** Depend on _all_ reactive values/expressions encountered during execution.  
`observe({...})`  
&nbsp;
> 2. **Explicit:** Just depend on _specific_ reactive value/expression; ignore all others. (Also known as "event handler".)  
`observeEvent(eventExpr, {...})`

## Exercise 08

Open `Exercise08_app.R`.

Add server logic so that when the `input$save` button is pressed, the data is saved to a CSV file called `"data.csv"` in the current directory.

# Reactive expressions vs. observers

## `reactive()`

> 1. It **can be called** and **returns a value**, like a function. Either the last expression, or `return()`.
> 2. It's **lazy**. It doesn't execute its code until somebody calls it (even if its reactive dependencies have changed). Also like a function.
> 3. It's **cached**. The first time it's called, it executes the code and saves the resulting value. Subsequent calls can skip the execution and just return the value.
> 4. It's **reactive**. It is notified when its dependencies change. When that happens, it clears its cache and notifies it dependents.

## `observe()` / `observeEvent()`

> 1. It **can't be called** and **doesn't return a value**. The value of the last expression will be thrown away, as will values passed to `return()`.
> 2. It's **eager**. When its dependencies change, it executes right away.
> 3. (Since it can't be called and doesn't have a return value, there's no notion of caching that applies here.)
> 4. It's **reactive**. It is notified when its dependencies change, and when that happens it executes (not right at that instant, but ASAP).

## Huh?

A **calculation** is a block of code where you don't care about whether the code actually executesâ€”you just want the answer. Safe for caching. **Use `reactive()`.**

An **action** is where you care very much that the code executes, and there is no answer (return value), only side effects. **Use `observe()`/`observeEvent()`.**

# Gadgets

## Gadgets
Gadgets are a way of packaging shiny apps into a single function.

If you can create a shiny app, you can create a gadget

## Cool, huh... huh?

So why would you want to use this?

Well, to create a cool RStudio addin of course!

## What's an addin?

```devtools::install_github("rstudio/addinexamples", type = "source")```

## How do you get from a shiny app to an add-in?

1. Use miniUI
2. Put all your code into a function
3. Put your ui code into miniPage instead of shinyUI
4. Make server into a normal function too!
5. Add the addtional "session" variable to your server file
6. Add runGadget at the end of the function

<p class="note"> Have a look at ```example12_app.R``` </p>

## Exercise 10

* Take the code from exercise 06 (this is already in ```exercise10_app.R``` if you need it)
* Make it into a gadget

<p class="note"> Remeber to install miniUI if you don't already have it </p>

## Making a gadget into an add-in

To register this on the drop-down menu, you need to:

1. make it into a package
2. add a special file in directory

