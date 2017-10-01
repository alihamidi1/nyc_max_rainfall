

library(shiny);  library(leaflet)

shinyServer(function(input, output) {
  
  x    <- read.csv('AMS.csv')
  x.cp=x$CP*0.1
  x.jfk=x$JFK*0.1
  x.lga=x$LGA*0.1
  x.ewr=x$EWR*0.1
  year1a=x$year
  loc=cbind(c(-73.9669,-73.88,-73.78,-74.1694) , c(40.783,  40.7792, 40.66, 40.71))
  
  
  
  output$distPlot1 <- renderPlot({
    ind.yr=which(year1a>=input$year1[1] & year1a<=input$year1[2])
    x1=x.cp[ind.yr]
    year2=year1a[ind.yr]
    
    thresh1<-input$thresh1
    x2=x1[(x1)> (thresh1)]
    year3=year2[(x1)> (thresh1)]
    
    #bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    # draw the histogram with the specified number of bins
    barplot(x2, ylab='Annual Max Rainfall (mm/day)' , xlab = 'Year', main='AMR at Central Park Station', width = 0.85, 
            cex.lab=1.5, cex.axis=1.5, cex.main=2,col=rainbow(length(x2)))
    axis(1,at=c(year3), labels=FALSE)
    text(1:(length(year3)), par("usr")[3]-0.25, srt = 90, adj= 1, xpd = TRUE,
         labels = (year3), cex=0.8)
    abline(h = thresh1, v = NULL, col = "gray60", lwd=2);grid(nx=NULL, ny=10)
  })
  
  
  
  output$distPlot2 <- renderPlot({
    ind.yr=which(year1a>=input$year2[1] & year1a<=input$year2[2])
    x1=x.lga[ind.yr]
    year2=year1a[ind.yr]
    
    thresh1<-input$thresh2
    x2=x1[(x1)> (thresh1)]
    year3=year2[(x1)> (thresh1)]
    
    #bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    # draw the histogram with the specified number of bins
    barplot(x2, ylab='Annual Max Rainfall (mm/day)' , xlab = 'Year', main='AMR at LGA Airport Station',width = 0.85, 
            cex.lab=1.5, cex.axis=1.5, cex.main=2,col=rainbow(length(x2)))
    axis(1,at=c(year3), labels=FALSE)
    text(1:(length(year3)), par("usr")[3]-0.25, srt = 90, adj= 1, xpd = TRUE,
         labels = (year3), cex=0.8)
    abline(h = thresh1, v = NULL, col = "gray60", lwd=2);grid(nx=NULL, ny=10)
  })
  
  output$distPlot3 <- renderPlot({
    ind.yr=which(year1a>=input$year3[1] & year1a<=input$year3[2])
    x1=x.jfk[ind.yr]
    year2=year1a[ind.yr]
    
    thresh1<-input$thresh3
    x2=x1[(x1)> (thresh1)]
    year3=year2[(x1)> (thresh1)]
    
    #bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    # draw the histogram with the specified number of bins
    barplot(x2, ylab='Annual Max Rainfall (mm/day)' , xlab = 'Year', main='AMR at JFK Airport Station',width = 0.85, 
            cex.lab=1.5, cex.axis=1.5, cex.main=2,col=rainbow(length(x2)))
    axis(1,at=c(year3), labels=FALSE)
    text(1:(length(year3)), par("usr")[3]-0.25, srt = 90, adj= 1, xpd = TRUE,
         labels = (year3), cex=0.8)
    abline(h = thresh1, v = NULL, col = "gray60", lwd=2);grid(nx=NULL, ny=10)
  })
  
  
  output$distPlot4 <- renderPlot({
    ind.yr=which(year1a>=input$year4[1] & year1a<=input$year4[2])
    x1=x.ewr[ind.yr]
    year2=year1a[ind.yr]
    
    thresh1<-input$thresh4
    x2=x1[(x1)> (thresh1)]
    year3=year2[(x1)> (thresh1)]
    
    #bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    # draw the histogram with the specified number of bins
    barplot(x2, ylab='Annual Max Rainfall (mm/day)' , xlab = 'Year',main='AMR at EWR Airport Station', width = 0.85, 
            cex.lab=1.5, cex.axis=1.5, cex.main=2,col=rainbow(length(x2)))
    axis(1,at=c(year3), labels=FALSE)
    text(1:(length(year3)), par("usr")[3]-0.25, srt = 90, adj= 1, xpd = TRUE,
         labels = (year3), cex=0.8)
    abline(h = thresh1, v = NULL, col = "gray60", lwd=2);grid(nx=NULL, ny=10)
  })
  
  
  output$mymap <- renderLeaflet({
    leaflet() %>%
      addProviderTiles(providers$Stamen.TonerLite,
                       options = providerTileOptions(noWrap = TRUE)
      ) %>%
      addMarkers(data = loc,  label = c('Central Park Station', 
                                        'LGA Airport Station', 'JFK Airport Station',
                                        'EWR Airport Station'))
  })
  
  
})
