###########################################
###########################################
### libraries 

library(shiny)
library(dplyr)
library(readr)
library(tidyr)
library(ggplot2)


###########################################
###########################################
###data handling

museums <- read_csv("museums.csv")
museums <- museums %>% drop_na(Income)
museums <- museums %>% drop_na(Revenue)
museums$'Museum Abbreviation' <- rep('abb', dim(museums)[1])
for( i in 1:dim(museums)[1] ){
  museums[i,'Museum Abbreviation'] <- abbreviate(museums[i,'Museum Type'], minlength = 4)
}
abbreviations <- unique(museums[,c('Museum Type','Museum Abbreviation')])
select_options <- sort(unique(museums$'City (Administrative Location)'))




source(ui.R)
source(server.R)


shinyApp(ui,server)







