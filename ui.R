###########################################
###########################################
### ui

ui <- fluidPage(
  titlePanel("Museums of the United States"),
  sidebarLayout(
    sidebarPanel(
      radioButtons("rev_inc",
                   label = "Museums printed by:",
                   choices = c("revenue","income"),
                   #selected = 0
      ),
      
      radioButtons("value",
                   label = "You want the revenue/income to be:",
                   choices = c("higher than","lower than"),
                   #selected=0
      ),
      
      numericInput("value2","Value of Income/Revenue to truncate in $" , 100000 ,
                   min = -2127393,
                   max = 83181439574),
      
      radioButtons("order",
                   label = "Show the table in sort:",
                   choices = c("ascending","descending")),
      
      selectInput("City", "Select a city", select_options),
    ),
    
    
    mainPanel(
      tabsetPanel(
        tabPanel("Museums Revenue/Income", value = "REVENUE / INCOME",
                 tableOutput("rev_inc")),
        tabPanel("Cities Museums", tableOutput("Museum_Data")  ),
        tabPanel("Category Histograms", value = "HISTOGRAMS",
                 
                 radioButtons("Histogramms",
                              label = "Which Histogram want to see:",
                              choices = c("Museums Categories","Museums Cities"),
                 ),
                 
                 plotOutput("Histograms"),
                 tableOutput("Myabbreviation")) 
      ))
  ))















