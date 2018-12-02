library(shiny)
library(ptds2018hw4g3)
library(ggplot2)

shinyServer(function(input, output) {

    simulate <- reactive({

        my_pi <- if(match(input$method, c("estimate_pi", "estimate_pi2")) == 1) {

                B <- input$B
                seed <- input$seed
                my_pi <- estimate_pi(B, seed)
                return(my_pi)

            } else {

                B <- input$B
                seed <- input$seed
                my_pi <- estimate_pi2(B, seed)
                return(my_pi)
            }

        })


    output$plot <- renderPlot({
        plot(simulate())
    })

    output$time <- renderPrint({

        cat(
            c("The CPU times for respectively the user,
              system and the 'real' elapsed time are:","\n" ,system.time(

                if(match(input$method, c("estimate_pi", "estimate_pi2")) == 1) {

                    B <- input$B
                    seed <- input$seed
                    my_pi <- estimate_pi(B, seed)
                    plot(my_pi)

                    } else {

                    B <- input$B
                    seed <- input$seed
                    my_pi <- estimate_pi2(B, seed)
                    plot(my_pi)
                    }
                )[1:3]
              )
            )
    })

    output$pi <- renderPrint({
        # extract the estimated value
        cat(c("The estimated value of pi is:",simulate()$estimated_pi))
    })

})
