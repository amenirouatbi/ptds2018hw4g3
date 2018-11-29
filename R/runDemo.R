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

devtools::document()

