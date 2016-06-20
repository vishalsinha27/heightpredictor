library(shiny)

shinyUI(fluidPage(
  #Application title
  titlePanel("Child Height Predictor"),
  p("This height predictor app takes input the parents height in cms, total number of 
          child they have, gender of the child, and number of the child. For e.g 
    If parents have 3 child and they want to predict the height of 2nd child then 
    total number of child is 3 and number of child is 2."),
  p(),
  sidebarLayout(
    sidebarPanel(
      sliderInput("father", "Select Father's height in cm", 80, 250, 175 ,step=0.5),
      sliderInput("mother", "Select Mother's height in cm", 80, 250, 170 ,step=0.5),
      selectInput("gender", "Gender:", c("Male" = "male", "Female" = "female")),
      sliderInput("numOfChild", "Total Number of Child", 1, 10, 3 ,step=1),
      textInput("childNum", "Enter the Child number", value = 2)
      
    
    ),
    mainPanel(
      textOutput('father'),
      p(),
      textOutput('mother'),
      p(),
      textOutput('gender'),
      p(),
      textOutput('numOfChild'),
      p(),
      textOutput('childNum'),
      p(),
      textOutput('childHeight'),
      tags$head(tags$style("#childHeight{color: blue;
                           font-style: italic;
                           }"
                         ))
    
      
      
      
      
    )
  )
  
))