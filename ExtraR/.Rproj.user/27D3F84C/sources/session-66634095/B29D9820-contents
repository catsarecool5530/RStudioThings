
xVal <- rnorm(100)

zVal <- rnorm(100, 5, 3)


error <- rnorm(100, 0, 20)
yVal <- 15 + 20 * xVal + 10 * zVal + error

library(rgl)

fit <- lm(yVal ~ xVal + zVal)

plot3d(x=xVal, y=yVal, z=zVal)
plot3d(fit, 
       add = FALSE, 
       plane.col = "red",  # Color of the plane
       plane.alpha = 0.5,  # Transparency
       )            # Thickness of the grid lines on the plane (optional)

