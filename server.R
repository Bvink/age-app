library(shiny)
library(datasets)

# Define server logic required to summarize and view the selected
# dataset
function(input, output) {	
  
  # Return the requested age
  datasetInput <- reactive({	
  
  ages <- ageData[which(ageData$Country == input$country), ]
  ages <- ages[ , c("Country", input$gender)]
  
  currentAge <- verifyAgeInput(input)
  ages <- calculateYearsLeft(ages, currentAge)
  
  output <- ages
  })
 
 
  # Show the ages per country/gender.
  output$view <- renderTable({
    datasetInput()
  })
  
  
  # Check if the input is a number, finite, and larger than 0
  verifyAgeInput <- function(input) {
  return(ifelse(is.finite(input$age) && input$age > 0, input$age, 0))
  }
  
  
  # Calculate how many years the user has left
  calculateYearsLeft <- function(ages, currentAge) {
  ages[1,2] <- ages[1,2] - currentAge
  ages[1,2] <- ifelse(ages[1,2]>0, ages[1,2], 0)
  return(ages)
  }
  
}
