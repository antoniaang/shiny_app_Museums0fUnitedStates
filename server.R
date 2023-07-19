###########################################
###########################################
### server

server <- function(input, output, session) {
  
  output$rev_inc <- renderTable({
    if(input$rev_inc == "revenue"){
      data <- data.frame(museums = museums$`Museum Name`,
                         revenue = museums$Revenue
      )
      
      data$fullname <- paste0(data$`Museum Name`, data$Income, sep="    ")
      if(input$value == "higher than"){
        data <- filter(data, revenue >= input$value2)
      } 
      else if(input$value == "lower than") {
        data <- filter(data, revenue <= input$value2)
      }
    }
    else if (input$rev_inc == "income"){
      data <- data.frame(museums = museums$`Museum Name`,
                         income = museums$Income
      )
      
      data$fullname <- paste0(data$`Museum Name`, data$Income, sep="    ")
      
      if(input$value == "higher than"){
        data <- filter(data, income >= input$value2)
      } 
      else if(input$value == "lower than") {
        data <- filter(data, income <= input$value2)
      }
    }
    
    if(input$order == "ascending" & input$rev_inc == "revenue"){
      data <- arrange(data, revenue)
    }
    else if(input$order == "descending" & input$rev_inc == "revenue"){
      data <- arrange(data, desc(revenue))
    }
    
    if(input$order == "ascending" & input$rev_inc == "income"){
      data <- arrange(data, income)
    }
    else if(input$order == "descending" & input$rev_inc == "income"){
      data <- arrange(data, desc(income))
    }
    
    data
  })
  
  output$Histograms <- renderPlot({
    if(input$Histogramms=="Museums Categories"){
      ggplot(museums, aes(x = museums$`Museum Abbreviation`)) +
        geom_histogram(stat = 'count')
    }
    else if(input$Histogramms=="Museums Cities"){
      ggplot(museums, aes(x = museums$`City (Administrative Location)`)) +
        geom_histogram(stat = 'count') +
        coord_flip() 
    }
  })
  
  
  output$Myabbreviation <- renderTable({
    if(input$Histogramms=="Museums Categories"){
      data2 <- abbreviations
    }else{
      data2 <- data.frame( `0` = c(0) )
    }
  })
  
  
  output$Museum_Data=renderTable({
    stateFilter=subset(museums, museums$'City (Administrative Location)' == input$City)
    return( stateFilter[c("Museum Name", "Museum Type", "Income")] )
  })
}



