library(shiny)

# Define UI for dataset viewer application
fluidPage(
  
  # Application title
  titlePanel("How much longer do I have to live?"),
  
  # Sidebar with controls to select a country and specify your age & gender
  sidebarLayout(
    sidebarPanel(
	#TODO: Find out how to get these from the dataset
      selectInput("country", "Select your country:",
	  choices = c(as.character(ageDataSorted[,1]))),
      
	  selectInput("gender", "Select your gender:", 
                  choices = c("Male", "Female")),
				  
	  numericInput("age", "Your current age:", 0),
	  p(a("Source: World Health Organization", href = "http://www.who.int/gho/publications/world_health_statistics/2016/Annex_B/en/", target = "_blank"))
    ),
    
    # Show a summary of the dataset and an HTML table with the 
	 # requested number of observations
    mainPanel(
      tableOutput("view")
    )
  )
)
