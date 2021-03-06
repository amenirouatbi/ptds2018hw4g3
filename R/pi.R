#' @title Estimate Pi from random sampling
#'
#' @description Compute an approximation of pi by drawing x and y coordinates
#' from a uniform distribution and checking whether or not they fall inside a
#' unit circle.
#' @param B A \code{numeric} (integer) used to denote the number of sample
#' coordinates used to approximate pi
#' @param seed A \code{numeric} used to control the seed of the random number
#' generator used by this function.
#' @return A \code{list} containing the following attributes:
#' \describe{
#'      \item{estimated_pi}{Estimated value of pi }
#'      \item{points}{Dataframe of the generated coordinates with an indication
#'      whether or not the coordinate is inside the circle}
#' }
#' @author Vanessa Armistead
#' @author Bart Roes
#' @author Luisa Pricken
#' @author Ameni Rouatbi
#' @importFrom stats runif
#' @export
#' @examples
#' estimate_pi(B=10)


estimate_pi <- function(B = 5000, seed = 10){
    # Control seed
    set.seed(seed)

    # Simulate B points
    points <- data.frame(
        x = runif(n = B, min = -1, max = 1),
        y = runif(n = B, min = -1, max = 1),
        inside = rep(NA, B)
    )


    points$inside <- ifelse(sqrt(points$x^2 + points$y^2 <= 1), TRUE, FALSE)

    # Approximation of pi
    estimated_pi = 4*(sum(points$inside)/B)

    # create a new list
    rval <- list(
        estimated_pi = estimated_pi,
        points = points
    )

    # assign pi class to rval
    class(rval) <- "pi"
    # return rval
    return(rval)
}



#' @title Plot objects of class pi
#' @description Creating a plot representing the random coordinates created by
#' the function "estimate_pi".
#' @param x A \code{list} of type pi
#' @return A \code{plot} of the object
#' @author Vanessa Armistead
#' @author Bart Roes
#' @author Luisa Pricken
#' @author Ameni Rouatbi
#'
#' @export
#' @examples
#' obj <- estimate_pi()
#' plot(obj)
plot.pi <- function(x) {
    points <- x[["points"]]

    circle <- data.frame(
        x = 0,
        y = 0,
        r = 1
    )

    # plot points
    ggplot2::ggplot(points) +
        ggplot2::geom_point(ggplot2::aes(x = x, y = y, color = inside)) +
        ggplot2::geom_rect(ggplot2::aes(xmin = -1, xmax = 1,
                                        ymin = -1, ymax = 1),
                           color = "black", fill = NA) +
        ggforce::geom_circle(ggplot2::aes(x0=x, y0=y, r=r), data = circle) +
        ggplot2::xlim(-1, 1) +
        ggplot2::ylim(-1, 1) +
        ggplot2::theme(aspect.ratio = 1)
}

#' @title Estimate Pi from random sampling with Rcpp integration
#'
#' @description Compute an approximation of pi by drawing x and y coordinates
#' from a uniform distribution and checking whether or not they fall inside a
#' unit circle.
#' @param B A \code{numeric} (integer) used to denote the number of sample
#' coordinates used to approximate pi
#' @param seed A \code{numeric} used to control the seed of the random number
#' generator used by this function.
#' @return A \code{list} containing the following attributes:
#' \describe{
#'      \item{estimated_pi}{Estimated value of pi}
#'      \item{points}{Dataframe of the generated coordinates with an indication
#'      whether or not the coordinate is inside the circle}
#' }
#' @author Vanessa Armistead
#' @author Bart Roes
#' @author Luisa Pricken
#' @author Ameni Rouatbi
#' @importFrom stats runif
#' @export
#' @examples
#' estimate_pi2(B=10)

estimate_pi2 <- function(B = 5000, seed = 10){
    # Control seed
    set.seed(seed)

    # Simulate B points
    points <- data.frame(
        x = runif(n = B, min = -1, max = 1),
        y = runif(n = B, min = -1, max = 1)
    )

    points <- as.matrix(points)

    logic.vec <- is_inside(points = points)

    # Approximation of pi
    estimated_pi = 4*(sum(logic.vec)/B)

    points <- as.data.frame(points)
    points$inside <- logic.vec


    # create a new list
    rval <- list(
        estimated_pi = estimated_pi,
        points = as.data.frame(points)
    )

    # assign pi class to rval
    class(rval) <- "pi"
    # return rval
    return(rval)
}


