library(shiny)
library(ptds2018hw4g3)

shinyServer(function(input, output) {

    simulate <- reactive({

        time.taken <- system.time({
            if(input$method == "estimate_pi") {
                my_pi <- estimate_pi(input$B, input$seed)
            } else {
                my_pi <- estimate_pi2(input$B, input$seed)
            }

        })


        return(
            list(
            time.taken, my_pi
         )
        )

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
