# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#

shinyUI(fluidPage(
  titlePanel("Population Change"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Population by selected state using
        information from the 2010 US Census.
        (which includes future predictions)"),
      
      selectInput("var", 
                  label = "Choose a state to display",
                  choices = c("Alabama", 
                              "Alaska", 
                              "Arizona", 
                              "Arkansas",
                              "California",
                              "Colorado", 
                              "Connecticut",
                              "Delaware",
                              "Florida", 
                              "Georgia", 
                              "Hawaii", 
                              "Idaho", 
                              "Illinois",
                              "Indiana", 
                              "Iowa", 
                              "Kansas", 
                              "Kentucky", 
                              "Louisiana", 
                              "Maine", 
                              "Maryland", 
                              "Massachusetts", 
                              "Michigan", 
                              "Minnesota", 
                              "Mississippi", 
                              "Missouri", 
                              "Montana",
                              "Nebraska", 
                              "Nevada", 
                              "New Hampshire", 
                              "New Jersey", 
                              "New Mexico", 
                              "New York", 
                              "North Carolina", 
                              "North Dakota", 
                              "Ohio", 
                              "Oklahoma", 
                              "Oregon", 
                              "Pennsylvania",
                              "Rhode Island", 
                              "South Carolina", 
                              "South Dakota", 
                              "Tennessee", 
                              "Texas", 
                              "Utah", 
                              "Vermont", 
                              "Virginia", 
                              "Washington", 
                              "West Virginia", 
                              "Wisconsin", 
                              "Wyoming"
                              ),
                  selected = "Alaska"),

      helpText("This next section is where you can make your own predictions.  
                All you have to do is to enter a few estimates of your own for your 
               chosen state and this app will calculate an estimated population based on your 
               entries.
               First, enter the total number of Births you predict in your chosen state.
               Second, enter the total number of Deaths you predict in your chosen state.
               Finally, enter the total number of new Immigrants into your chosen state.
               The application will dynamically adjust as you change your estimates."),
      
      numericInput("yrBirths", "Total births for the year:", 1000),      
      numericInput("yrDeaths", "Total deaths for the year:", 100),
      numericInput("yrNetMigration", "Net Migration for the year:",0)
    ),
    
    mainPanel(
      textOutput("text1"),
      textOutput("text2"),
      plotOutput("popplot"),
      textOutput("text3")
    )
  )
))