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
   