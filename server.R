# Developing data products week 4 assignment

# Use shiny library
library(shiny)

# Load activity data that included 3 Variables: Steps, Date and Interval
myActivity <- read.csv("activity.csv")


function(input, output, session) {
 
    output$data <- renderTable({
    # Get rid of NA data
    myActivity <- na.omit(myActivity)
    myActivity[, c("steps", input$variable), drop = FALSE]
  
  }, rownames = TRUE)  
  
  # Generate a summary of the data ----
  output$summary <- renderPrint({
    summary(myActivity)
  })
  
  # Show information about Varibles
  output$strings <- renderPrint({
    str(myActivity)
  })
  


  
}

