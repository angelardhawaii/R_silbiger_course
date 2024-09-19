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

#now make your own plot
ggplot (data = penguins, mapping = aes(x = species, 
                                       y = flipper_length_mm)) +
  geom_boxplot() +
  geom_jitter(alpha = 0.5, size = 2, aes(color = sex)) +
  scale_color_grey() +
  labs(x = "Species", y = "Flipper length (mm)") +
  theme_bw() +
  theme(axis.title = element_text(size = 12), 
        panel.grid.major.x = element_blank(), 
        legend.position = "right")

  