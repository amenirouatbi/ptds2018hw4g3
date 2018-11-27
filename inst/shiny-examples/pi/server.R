library(shiny)
#library(ptds2018hw4g3)

shinyServer(function(input, output) {

    simulate <- reactive({

        start.time <- Sys.time()

        if(input$method == "estimate_pi") {
            estimate_pi(input$B, input$seed)
        } else {
            estimate_pi2(input$B, input$seed)
        }

        end.time <- Sys.time()

        time.taken <- end.time-start.time

    })

    output$plot <- renderPlot({
        plot(simulate)
    })

    output$time <- renderText({
        # extract the time of the execution
        print(time.taken)
    })

    output$pi <- renderText({
        # extract the estimated value
        print(simulate$estimated_pi)
    })

})
