library(palmerpenguins)

library(ggthemes)

View(penguins)

ggplot(data=penguins,
       mapping = aes(x = flipper_length_mm, y= body_mass_g)
       ) + 
  geom_point(mapping = aes(color=bill_length_mm, shape = species)) +
  geom_smooth(method="lm") +
  labs(
    title = "Body mass and flipper length",
    subtitle = "Dimensions for Adelie, Chinstrap, and Gentoo Penguins",
    x = "Flipper length (mm)", y = "Body mass (g)",
    color = "Species", shape = "Species",
    caption = "Data come from the palmerpenguins package."
  )
