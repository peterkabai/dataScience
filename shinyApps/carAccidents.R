library(shiny)

dat = read.csv("https://raw.githubusercontent.com/peterkabai/dataScience/master/data/crashData.csv")
dat[dat == "N/A"] = NA

ui <- fluidPage(
  titlePanel("Rear and Non-Rear End Collisions per Hour"),
  sidebarLayout(
    position = "right",
    sidebarPanel(
      h3("Configure Settings"),
      br(),
      sliderInput(
        inputId = "hours",
        label = "Choose Hour Range to Plot:",
        min = 0,
        max = 23,
        value = c(0, 23)
      ),
      checkboxInput(
        inputId = "checkbox", 
        label = "Show the Bars Proportionally", 
        value = FALSE
      )
    ),
    mainPanel(
      plotOutput(outputId = "distPlot"),
      textOutput("colorText")
    )
  )
)

server <- function(input, output) {
  output$distPlot <- renderPlot({
    
    dateVector = strptime(as.character(dat$Crash.Date.Time), "%m/%d/%Y %I:%M:%S %p", tz="EST")
    tbl = table(ifelse(dat$Collision.Type != "SAME DIR REAR END", "Non-Rear End", "Rear End"), dateVector$hour)
    
    if (input$checkbox) {
      vals = seq(from = 1, to = length(tbl), by = 2)
      for ( val in vals) {
        temp1 = tbl[val] / (tbl[val] + tbl[val+1])
        temp2 = tbl[val+1] / (tbl[val] + tbl[val+1])
        
        tbl[val] = temp1
        tbl[val+1] = temp2
      }
    }
    
    par(mar=c(5,5,3,3))
    barplot(
      tbl[,(input$hours[1]+1):(input$hours[2]+1)], 
      main = "Collision Type for Each Hour", 
      col = c("dark red", "red"), 
      xlab = "Hour of the Day", 
      ylab = ifelse(input$checkbox, "Proportion of Accidents", "Number of Accidents"),
      legend = rownames(tbl)
    )
    
  })
}

shinyApp(ui = ui, server = server)