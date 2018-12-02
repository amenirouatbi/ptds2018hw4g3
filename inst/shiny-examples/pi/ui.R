library("shiny")

shinyUI(fluidPage(

    titlePanel("Pi Estimation"),

    sidebarLayout(

        sidebarPanel(

            selectInput("method", "Estimation method:",
                        c("estimate_pi", "estimate_pi2"),
                        multiple = FALSE),

            numericInput("seed", "Seed:", value = 10,
                         min = 0, max = 5000),

            sliderInput("B", "Number of samples:",
                        min = 0, max = 100000,
                        value = 5000)

        ),

        mainPanel(

            plotOutput("plot"),

            textOutput("time"),

            textOutput("pi")
        )
    )
))
