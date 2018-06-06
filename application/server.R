library(shiny)
library(shinythemes)
library(readr)
library(ggplot2)
library(stringr)
library(dplyr)
library(DT)
library(tools)
library(marital)
library(ggpubr)

function(input, output, session) {
  # Create a subset of data filtering for selected County
  CT <- reactive({
    
    req(input$county) # ensure availablity of value before proceeding
    county <- as.character(codebook$county[codebook$NAME %in% input$county])
    #Pad the county code
    
    paddedCounty <- str_pad(county, 3, "left", pad = "0")
    
    recordNumber <- which(floridaCountyMarital@geography$county == paddedCounty)
    #Subset the data by county
    NG<-floridaCountyMarital[recordNumber]
    # Create a subset of data filtering for selected County
    x<-ncol(floridaCountyMarital[recordNumber]@estimate)
    NR<-matrix(floridaCountyMarital[recordNumber]@estimate,x,1)
    colons <- str_locate_all(NG@acs.colnames, ":")[[1]]
    rownames(NR)<-str_sub(NG@acs.colnames, colons[1] +2, -1)
    colnames(NR)<-"Estimate"
    NR
  })
  
  
  
  # Create scatterplot object the plotOutput function is expecting
  output$maleNeverPlot <- renderPlot({
    agePlot(input$county,  "Male", "Never married")
  })
  output$femaleNeverPlot <- renderPlot({
    agePlot(input$county,  "Female", "Never married")
  })
  output$maleMarriedPlot <- renderPlot({
    agePlot(input$county,  "Male", "Married")
  })
  output$femaleMarriedPlot <- renderPlot({
    agePlot(input$county,  "Female", "Married")
  })
  output$maleabsentPlot <- renderPlot({
    agePlot(input$county,  "Male", "Married, spouse absent")
  })
  output$femaleabsentPlot <- renderPlot({
    agePlot(input$county,  "Female", "Married, spouse absent")
  })
  output$maleotherPlot <- renderPlot({
    agePlot(input$county,  "Male", "Married, other")
  })
  output$femaleotherPlot <- renderPlot({
    agePlot(input$county,  "Female", "Married, other")
  })
  output$maleWidowedPlot <- renderPlot({
    agePlot(input$county,  "Male", "Widowed")
  })
  output$femaleWidowedPlot <- renderPlot({
    agePlot(input$county,  "Female", "Widowed")
  })
  output$maleDivorcedPlot <- renderPlot({
    agePlot(input$county,  "Male", "Divorced")
  })
  output$femaleDivorcedPlot <- renderPlot({
    agePlot(input$county,  "Female", "Divorced")
  })
  
  # Update code below to render data table regardless of current county of input$show_data
  output$Demotable <- DT::renderDataTable({
    DT::datatable(data = CT(),
                  options = list(pageLength = 10),
                  rownames = TRUE)
  })
  
  # Display data table tab only if show_data is checked
  observeEvent(input$show_data, {
    if(input$show_data){
      showTab(inputId = "tabspanel", target = "Data", select = TRUE)
    } else {
      hideTab(inputId = "tabspanel", target = "Data")
    }
  })
  
  # Render data table for codebook
  output$codebook <- DT::renderDataTable({
    DT::datatable(data = codebook,
                  options = list(pageLength = 10, lengthMenu = c(10, 25, 40)),
                  rownames = FALSE)
  })
  
}