# ui.R

library(shiny);  library(leaflet)

shinyUI(fluidPage(
  
  # Application title
  titlePanel("NYC Annual Max Rainfall (mm/day)"),
  
  # Sidebar with a slider input for the number of bins
  sidebarLayout(
    sidebarPanel(
      h2("Instruction "),
      p("The barplots show the Annul Max Rainfall (AMR) at 3 main rain gauge stations in New York City and one in New Jersey from 1900-2016, depending on the availability of data at a station:
        1-Centarl Park Station
        2- LGA airport Station
        3- JFK airport Station
        4- EWR airport Station
        Different thresholds and years can be chosen at each station for demonstratig the desired data sets. 
        The data is in daily resolution (mm/day), provided by Global Historical Climatology Network (GHCN) and archived in NCDC(https://www.ncdc.noaa.gov/). 'rnoaa' package is used to retrieve the data sets. 
        
        "),
      #img(src="111.jpg", height = 300, width = 300),
      
      
      br(),
      br(),
      br(),
      br(),
      br(),
      sliderInput("thresh1", label = h4("Threshold (mm) - CP"),
                  min = 0, max = 100, value = 50),
      sliderInput("year1", label = h4("Year"),
                  min = 1900, max = 2016, value = c(1940, 1980)),
      br(),
      br(),
      br(),
      br(),
      br(),
      br(),
      br(),
      br(),
      
      sliderInput("thresh2", label = h4("Threshold (mm) - LGA"),
                  min = 0, max = 100, value = 20),
      sliderInput("year2", label = h4("Year"),
                  min = 1900, max = 2016, value = c(1950, 2000)),
      
      br(),
      br(),
      br(),
      br(),
      br(),
      br(),
      br(),
      
      sliderInput("thresh3", label = h4("Threshold (mm) - JFK"),
                  min = 0, max = 100, value = 70),
      sliderInput("year3", label = h4("Year"),
                  min = 1900, max = 2016, value = c(1920, 2010)),
      br(),
      br(),
      br(),
      br(),
      br(),
      br(),
      br(),
      
      sliderInput("thresh4", label = h4("Threshold (mm) - EWR"),
                  min = 0, max = 100, value = 70),
      sliderInput("year4", label = h4("Year"),
                  min = 1900, max = 2016, value = c(1920, 2000))
      ),
    
    #mainPanel(plotOutput("plot"))    
    # Show a plot of the generated distribution
    mainPanel(
      
      
      leafletOutput("mymap"),
      p(),
      
      
      
      
      
      
      plotOutput("distPlot1"),
      plotOutput("distPlot2"),
      plotOutput("distPlot3"),
      plotOutput("distPlot4")
      
    )
    )
  ))