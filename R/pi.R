estimate_pi <- function(B = 5000, seed = 10){
    # Control seed
    set.seed(seed)

    # Simulate B points
    points <- data.frame(
        x = runif(n = B, min = -1, max = 1),
        y = runif(n = B, min = -1, max = 1),
        inside = rep(NA, B)
    )


    points <- points %>% mutate(inside = ifelse(sqrt(x^2 + y^2 <= 1), TRUE, FALSE))

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


plot.pi <- function(x) {
    points <- x[["points"]]

    circle <- data.frame(
        x = c(seq(-1, 1, 0.01), seq(1, -1, -0.01)),
        y = c(sqrt(1 - seq(-1, 1, 0.01) ^ 2),
              -sqrt(1 - seq(1, -1, -0.01) ^ 2))
    )

    # plot points
    ggplot(points) +
        geom_point(aes(x = x, y = y, color = inside)) +
        geom_rect(aes(xmin = -1, xmax = 1, ymin = -1, ymax = 1),
                  color = "black", fill = NA) +
        geom_path(mapping = aes(x, y), data = circle) +
        xlim(-1, 1) +
        ylim(-1, 1) +
        theme(aspect.ratio = 1) %>%
        print()
}
