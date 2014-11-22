# ui.R

shinyUI(fluidPage(
    titlePanel("Plot 2013 Census Data by County on US Map"),
    
    sidebarLayout(
        sidebarPanel(
            helpText("Create demographic maps with 
        information from the 2013 US Census."),
            
            selectInput("var", 
                        label = "Choose a variable to display",
                        choices = c("Population",
                           "Change",
                           "Population per mile",
                           "Under 5",
                           "Under 18",
                           "65 and Over",
                           "Percent White",
                           "Percent Black",
                           "Percent Hispanic",
                           "Percent Asian",
                           "Median Income",
                           "Below Poverty"),
                        selected = "Population")
            
        ),
        
        mainPanel(plotOutput("map"))
    )
))