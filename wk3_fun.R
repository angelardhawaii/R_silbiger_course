#Making plots with ggplot2
#By Angela Richards Donà
#created on 9/10/24

#open libraries
library(palmerpenguins)
library(tidyverse)

#look at the data
view(penguins)
head(penguins)
tail(penguins)
glimpse(penguins)
penguins

#make a plot
ggplot (data = penguins, 
        mapping = aes(x = bill_depth_mm,
                      y = bill_length_mm,
                      color = species,
                      size = body_mass_g,
                      alpha = flipper_length_mm)) +
  geom_point() +
  labs(title = "Bill depth and length",
       subtitle = "Dimensions for Adelie, Chinstrap, and Gentoo Penguins",
       x = "Bill depth (mm)",
       y = "Bill length (mm)",
       color = "Species",
       caption = "Source: Palmer Station") +
  scale_color_viridis_d()


ggplot (data = penguins,
        aes(x = bill_depth_mm,
            y = bill_length_mm,
            color = species)) +
  geom_point() +
  facet_wrap(species~sex) + #make 2 columns 
  scale_color_viridis_d()

#will be doing stuff soon
