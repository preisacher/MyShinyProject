shinyServer(function(input, output) {
  
  output$text1 <- renderText({ 
    paste("You have selected:", input$var)
  })
  
  output$text2 <- renderText({
    statepop <- read.csv("data/CENSUS_STATEPOP.csv")
    state <- statepop[statepop$name == input$var,]$name
    paste("The population of ", input$var, " in 2010 was: ", 
          format(statepop[statepop$name == state,]$census, big.mark = ",", small.interval = 3), 
          " In 2015 it was estimated to be: ", 
          format(statepop[statepop$name == state,]$pop2015, big.mark = ",", small.interval = 3))
  })
  
  output$text3 <- renderText({
    statepop <- read.csv("data/CENSUS_STATEPOP.csv")
    state <- statepop[statepop$name == input$var,]$name
    
    totalPop <- statepop[statepop$name == state,]$pop2015
    
    # Population Calculation
    birthRate1k<-(input$yrBirths/totalPop)
    deathRate1k<-(input$yrDeaths/totalPop)
    rateNaturalIncr<-(birthRate1k - deathRate1k)
    estimatedPopulation<-(totalPop*rateNaturalIncr) + input$yrNetMigration + totalPop
    
    paste("Based on your assumptions, the population of ", input$var, " in 2016 will be: ", 
          format(estimatedPopulation, big.mark = ",", small.interval = 3))
  })

    output$popplot <- renderPlot({
    statepop <- read.csv("data/CENSUS_STATEPOP.csv")
    state <- statepop[statepop$name == input$var,]$name
    year2011 <- statepop[statepop$name == state,]$pop2011 - statepop[statepop$name == state,]$census
    year2012 <- statepop[statepop$name == state,]$pop2012 - statepop[statepop$name == state,]$pop2011
    year2013 <- statepop[statepop$name == state,]$pop2013 - statepop[statepop$name == state,]$pop2012
    year2014 <- statepop[statepop$name == state,]$pop2014 - statepop[statepop$name == state,]$pop2013
    year2015 <- statepop[statepop$name == state,]$pop2015 - statepop[statepop$name == state,]$pop2014
    population <- matrix(c(year2011,year2012,year2013,year2014,year2015),ncol=5,byrow=TRUE)
    colnames(population) <- c("2011","2012","2013","2014","2015")
    opt <- options("scipen" = 20)
    population <- as.table(population)
    barplot(population, 
            main=statepop[statepop$name == input$var,]$name, 
            xlab="Population Change from previous year",
            col=c("cyan")) 
            #gray.colors(length(unique(population)))[as.factor(population)])
})
  
}
)
