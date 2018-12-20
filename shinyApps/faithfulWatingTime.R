library(shiny)

# define the UI for the app
ui <- fluidPage(

  # app title
  titlePanel("Waiting Times at Old Faithful"),
  
  # sidebar layout with input and output definitions
  sidebarLayout(
    
    # sidebar panel for inputs
    sidebarPanel(

      # input slider for the number of bins
      sliderInput(
        inputId = "bins", 
        label = "Number of bins:", 
        min = 1, 
        max = 50, 
        value = 30
      ),
      
      # input dropdown
      selectInput(
        inputId = "colors", 
        choices = c("Red","Blue","Green","Yellow"), 
        label = "Choose bar color:"
      )
    ),
    
    # main panel for displaying outputs
    mainPanel(
      
      # output plot
      plotOutput(outputId = "distPlot")
    )
  )
)

# define server logic
server <- function(input, output) {
    output$distPlot = renderPlot({
    x = faithful$waiting
    bins = seq(min(x), max(x), length.out = input$bins + 1)
    hist(
      x, 
      breaks = bins, 
      col = input$colors, 
      border = "white",
      xlab = "Waiting time to next eruption (in mins)",
      main = "Histogram of waiting times")
  })
}

# difine the app
shinyApp(ui = ui, server = server)
