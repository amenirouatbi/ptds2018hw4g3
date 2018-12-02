#' @title Run Shiny app
#'
#' @description This function allows for launching the Shiny app when the
#' package is loaded.
#' This app will allow you to compare the two different functions that estimate
#' pi.
#' @author Vanessa Armistead
#' @author Bart Roes
#' @author Luisa Pricken
#' @author Ameni Rouatbi
#' @export
runDemo <- function() {

    appDir <- system.file("shiny-examples", "pi", package = "ptds2018hw4g3")
    if (appDir == "") {
        stop(
            "Could not find example directory. Try re-installing ptds2018hw4g3."
            , call. = FALSE
        )
    }

    shiny::runApp(appDir, display.mode = "normal")

}
