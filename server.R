library(shiny)

# generates regression model, utilizing only variables included in widget
mtcars$am <- factor(mtcars$am)
appcarfit <- lm(mpg ~ cyl + hp + wt + am + gear, data = mtcars)

shinyServer(function(input, output) {
    output$mpgtext <- renderText({
        ##prediction of mpg occurs here
        
        # Compose data frame of slider values with variable names matching mtcars predictors in 'appfit'
        
        predict_data <- data.frame(
            am = factor(input$trans), 
            cyl = input$cyl,
            wt = input$wt,
            hp = input$hp,
            gear = input$gear)
        pred_mpg <- predict(appcarfit, predict_data)
        pred_mpg
    }) 
    
    # creates table of values for display and easy reference (and just to demonstrate this capability in app)
    output$values <- renderTable({
        data.frame(
            am = factor(input$trans), 
            cyl = input$cyl,
            wt = input$wt,
            hp = input$hp,
            gear = input$gear)
    })
    output$histplot <- renderPlot({
        # Compute prediction again for use in plot
        
        predict_data <- data.frame(
            am = factor(input$trans), 
            cyl = input$cyl,
            wt = input$wt,
            hp = input$hp,
            gear = input$gear)
        pred_mpg <- predict(appcarfit, predict_data)
        
        #generate plot of data, using prediction to plot vertical line
        hist(mtcars$mpg, main = "MPG Distribution in mtcars Dataset", xlab = "mpg", col = "gray"); abline(v = pred_mpg, col = "cornflowerblue", lty = 2, lwd = 3)
    })    
    output$transtext <- renderText({ paste("Transmission:", input$trans)})
    output$cyltext <- renderText({ paste("Cylinders:", input$cyl)})
    output$wttext <- renderText({paste("Weight:", input$wt, "thousand pounds")})
    output$hptext <- renderText({paste("Horsepower:", input$hp)})
    output$geartext <- renderText({paste("Gears:", input$gear)})
}
)