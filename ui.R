#to run, uncomment below:
#runApp("project_jpgard", display.mode = "showcase")

library(shiny)

# Define UI for application

shinyUI(fluidPage(
    titlePanel("mpgCalc"),
    
    sidebarLayout(
        sidebarPanel(
          h1("Input Panel"),
          selectInput("trans", "Transmission Type:", choices = c(1, 0)),   
          helpText("0 = automatic, 1 = manual."),
          sliderInput("cyl", "Cylinders",
                      min = 0, max = 12, value = 6),
          sliderInput("wt", "Weight (x1000 pounds)",
                      min = 0, max = 6, value = 2, step = 0.1),
          helpText("To determine the weight in pounds,", 
                   "you can multiply the weight in kilograms by 2.2."),
          sliderInput("hp", "Horsepower",
                      min = 0, max = 1500, value = 200, step = 10),
          sliderInput("gear", "Number of (forward) gears",
                      min = 0, max = 7, value = 5),
          helpText("Note: if you don't know any of these values,", 
                   "you should be able to verify them in your vehicle's owner's manual,",
                   "or you can simply input your best estimate.")
        ),
        
        mainPanel(
            tabsetPanel(
                tabPanel("mpgCalc",
                  h1("Estimated MPG:", textOutput("mpgtext"), align = "center"), 
                  tableOutput("values"),
                  textOutput("transtext"),
                  textOutput("cyltext"),
                  textOutput("wttext"),
                  textOutput("hptext"),
                  textOutput("geartext"),
                  h2("Estimated mpg (blue line) vs. mtcars dataset", align = "center"),
                  plotOutput("histplot"),
                  h2("Explanation of estimate"),
                  p("This estimate is based on the cars included in the mtcars dataset, extracted from the 1974 MotorTrend",
                    "US magazine for 32 automobiles (1973-74 models). For more information, type '?mtcars' in your R console.",
                    "This prediction was generated using a linear regression model, which has an r-squared value",
                    "of 0.8493, a p-value of 6.687e-10, and a residual standard error of 2.555.")
                    ),
                tabPanel("Getting Started",
                    h1("mpgCalc - App Summary", align = "center"),
                    p("mpgCalc is designed to be a quick, simple, and user-friendly tool to provide you with",
                      "an estimate of any car, provided basic information about that car.",
                      "This app allows you to obtain a reliable estimate for any car's fuel",
                      "efficiency without even having to look inside the glovebox, using",
                      "basic information that any car owner should know or have easy access to."),
                    h1("How to use mpgCalc", align = "center"),
                    p("To use this app, simply enter the specifications for which you would like to",
                      "calculate an estimated mpg for. Your estimate will automatically be displayed",
                      "on the main panel, and your estimated mpg will be plotted (in a blue dashed line)",
                      "overlaying the histogram of the mpg for the mtcars dataset."),
                    p("If you'd like to see how changing different parameters would affect your mpg,",
                      "you can simply adjust the input parameters as desired--the data in the main panel",
                      "will update automatically."
                      ),
                    h3("Happy calculating!", align = "center")
                )
            )
        )
    )
))
