# server.R

library(maps)
library(mapproj)
source("helperNew.R")

counties <- read.table("data/DataSet.txt", header=TRUE, sep=",")


#remove state and US totals
counties<-subset(counties, fips%%1000!=0)

shinyServer(
    function(input, output) {
        output$map <- renderPlot({
            data <- switch(input$var, 
                           "Population" = counties$PST045213,
                           "Change" = counties$PST120213,
                           "Population per mile" = counties$POP060210,
                           "Under 5"= counties$AGE135213,
                           "Under 18"= counties$AGE295213,
                           "65 and Over"= counties$AGE775213,
                           "Percent White" = counties$RHI125213,
                           "Percent Black" = counties$RHI225213,
                           "Percent Hispanic" = counties$RHI725213,
                           "Percent Asian" = counties$RHI425213,
                           "Median Income" = counties$INC110212,
                           "Below Poverty" = counties$PVY020212
                           )
            
            
            legend <- switch(input$var, 
                             "Population" = "Population by County, 2013 estimate",
                             "Change" = "Population by County, percent change - April 1, 2010 to July 1, 2013",
                             "Population per mile" = "Population per square mile by county, 2010",
                             "Under 5"= "Persons under 5 years, percent by county",
                             "Under 18"= "Persons under 18 years, percent by county",
                             "65 and Over"= "Persons 65 years and over, percent by county",
                             "Percent White" = "% White by county",
                             "Percent Black" = "% Black by county",
                             "Percent Hispanic" = "% Hispanic by county",
                             "Percent Asian" = "% Asian by county",
                             "Median Income" = "Median household income, 2008-2012 by county",
                             "Below Poverty" = "Persons below poverty level, percent, 2008-2012 by county")
            
            percent_map(var = data, 
                        title = legend)
        })
    }
)