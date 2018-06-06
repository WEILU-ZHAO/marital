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

data("floridaCountyMarital")

countyNames<-levels(as.factor(floridaCountyMarital@geography$NAME))

codebookColon<-str_locate(countyNames, "County")[,1]

codebook<- data.frame(cbind(str_sub(countyNames, 0, codebookColon - 2),
                            floridaCountyMarital@geography$county))

colnames(codebook)<-c("NAME","county")
 fluidPage(
  theme=shinytheme("flatly"),
  titlePanel("Marital by sex, 2009 - 2016", windowTitle = "Marital by sex"),
  
  # Sidebar layout with a input and output definitions
  sidebarLayout(
    
    # Inputs
    sidebarPanel(
      
      h3("County"),      # Third level header: County
      
      # Select County for agePlot
      selectInput(inputId = "county",
                  label = "Choose a County:",
                  choices = c(as.character(codebook$NAME)),
                  selected = "Miami-Dade"),
      
      hr(),
      
      
      # Show data table
      checkboxInput(inputId = "show_data",
                    label = "Show data table",
                    value = FALSE),
      
      br(),
      
      # Built with Shiny by RStudio
      br(),
      h5("Built with",
         img(src = "https://www.rstudio.com/wp-content/uploads/2014/04/shiny.png", height = "30px"),
         "by",
         img(src = "https://www.rstudio.com/wp-content/uploads/2014/07/RStudio-Logo-Blue-Gray.png", height = "30px"),
         "."),width=3
      
    ),
    
    # Output:
    mainPanel(
      
      tabsetPanel(id = "tabspanel", type = "tabs",
                  tabPanel(title = "Plot",
                           fluidRow(
                             column(6, plotOutput("maleNeverPlot", height = 250)), # notice the ,
                             column(6, plotOutput("femaleNeverPlot", height = 250))
                           ), #end of this fluidRow notice comma needed before the next fluidRow()
                           fluidRow(
                             column(6, plotOutput("maleMarriedPlot", height = 250)), # notice the ,
                             column(6, plotOutput("femaleMarriedPlot", height = 250))
                           ), #end of this fluidRow notice comma needed before the next fluidRow()
                           fluidRow(
                             column(6, plotOutput("maleabsentPlot", height = 250)), # notice the ,
                             column(6, plotOutput("femaleabsentPlot", height = 250))
                           ), #end of this fluidRow notice comma needed before the next fluidRow()
                           fluidRow(
                             column(6, plotOutput("maleotherPlot", height = 250)), # notice the ,
                             column(6, plotOutput("femaleotherPlot", height = 250))
                           ), #end of this fluidRow notice comma needed before the next fluidRow()
                           fluidRow(
                             column(6, plotOutput("maleWidowedPlot", height = 250)), # notice the ,
                             column(6, plotOutput("femaleWidowedPlot", height = 250))
                           ), #end of this fluidRow notice comma needed before the next fluidRow()
                           fluidRow(
                             column(6, plotOutput("maleDivorcedPlot", height = 250)), # notice the ,
                             column(6, plotOutput("femaleDivorcedPlot", height = 250))
                           ) #end of this fluidRow notice comma needed before the next fluidRow()
                  ),
                  tabPanel(title = "Data",
                           br(),
                           DT::dataTableOutput(outputId = "Demotable")),
                  # New tab panel for Codebook
                  tabPanel("Codebook",
                           br(),
                           DT::dataTableOutput("codebook"))
                  
      )
    )
  ))
