Developing Data Products Week 4 Assigment
========================================================
author: 
date: 
autosize: true

Introduction
========================================================

It is now possible to collect a large amount of data about personal movement using activity monitoring devices such as a Fitbit, Nike Fuelband, or Jawbone Up. These type of devices are part of the quantified self movement, a group of enthusiasts who take measurements about themselves regularly to improve their health, to find patterns in their behavior, or because they are tech geeks. But these data remain under-utilized both because the raw data are hard to obtain and there is a lack of statistical methods and software for processing and interpreting the data.
This assignment makes use of data from a personal activity monitoring device. This device collects data at 5 minute intervals through out the day. The data consists of two months of data from an anonymous individual collected during the months of October and November, 2012 and include the number of steps taken in 5 minute intervals each day.

About the data
========================================================
The variables included in this dataset are:
steps: Number of steps taking in a 5-minute interval (missing values are coded as NA
date: The date on which the measurement was taken in YYYY-MM-DD format
interval: Identifier for the 5-minute interval in which measurement was taken
The dataset is stored in a comma-separated-value (CSV) file and there are a total of 17,568 observations in this dataset.

Slide With Code: ui.R
========================================================


```r
shinyUI(navbarPage("Activity",
                   tabPanel("Activity",
                            
                            # Show checkboxed for Variables Date and Interval
                            # Steps is shown by defail
                            checkboxGroupInput("variable", "Variables to show:",
                                               c("Date" = "date",
                                                 "Interval" = "interval")),
                         
                           
                          
                          mainPanel(
                            
                            # Output: Tabset with data, summary, and Variables
                            tabsetPanel(type = "tabs",
                                        tabPanel("Data", tableOutput("data")),
                                        tabPanel("Summary", verbatimTextOutput("summary")),
                                        tabPanel("Variables", tableOutput("strings"))
                              )
                             )
                                            
                   )
)
)
```

Slide With code: server.R
========================================================


```r
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
```
How to use the shiny app
========================================================

In this shiny app you can see the Steps data by default and can optionally display Date and Interval via a check box
There exists 3 tabs:
Data tab: display Steps data by default
Summary tab: display a summary of the data
Variables: display an overview of the variables
