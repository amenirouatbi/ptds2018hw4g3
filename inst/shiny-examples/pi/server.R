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

    time <- reactive({

        system.time({
            if(match(input$method, c("estimate_pi", "estimate_pi2")) == 1) {

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

        return()
    })


    output$plot <- renderPlot({
        plot(simulate())
    })

    output$time <- renderPrint({
        # extract the time of the execution
        #cat(c("The time taken to run the code is:",time()))
        print(system.time( if(match(input$method, c("estimate_pi", "estimate_pi2")) == 1) {

            B <- input$B
            seed <- input$seed
            my_pi <- estimate_pi(B, seed)


        } else {

            B <- input$B
            seed <- input$seed
            my_pi <- estimate_pi2(B, seed)

        }))
    })

    output$pi <- renderPrint({
        # extract the estimated value
        cat(c("The esimated value of pi is:",simulate()$estimated_pi))
    })

})
