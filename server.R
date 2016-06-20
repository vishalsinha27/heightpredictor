library(HistData)
library(caret)
selectedCols <- c(4:8)
trainingData <- as.data.frame(GaltonFamilies[,selectedCols], stringsAsFactors=FALSE)
trainingData$midparentHeight <- trainingData$midparentHeight*2.54
trainingData$childHeight <- trainingData$childHeight*2.54
lmModel <- train(childHeight ~ ., data=trainingData, method="lm" )
t2 <- trainingData[1,]
shinyServer(
  function(input, output) {
    output$father <- renderText(
      {
        paste("Father's Height: ",input$father," cm")
      }
    )
    
    output$mother <- renderText(
      {
        paste("Mother's Height: ", input$mother, " cm")
      }
    )
    
    output$gender <- renderText(
      {
        paste("Gender: ", input$gender)
      }
    )
    
    output$numOfChild <- renderText(
      {
        paste("Total Number of Child: ", input$numOfChild)
      }
    )
    
   
    output$childNum <- renderText(
      {
        paste("Child Number: ", input$childNum)
      }
    )
    
   
    # Call the predict function to predict the child height
    output$childHeight <- renderText({
      # validate the child number
      validate(
        need(!is.na( as.numeric(input$childNum)), "Please enter a number for child number")
      )
      #validate that the child number is not greater than the number of child.
      validate(
        need(as.numeric(input$childNum) <= as.numeric(input$numOfChild), "Child Number cannot be greater than Total Number of child")
      )
      
      t2$midparentHeight <- (input$father + 1.08*input$mother)/2
      t2$children <- input$numOfChild
      t2$childNum <- as.numeric(input$childNum)
      t2$gender <- input$gender
      t2$childHeight <- round(predict(lmModel,t2),1)
      
      
      paste("Child Height would be ",t2$childHeight, " cm")
    })
    
  }
 
)

