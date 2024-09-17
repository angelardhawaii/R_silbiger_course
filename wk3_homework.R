#Homework assignment to make nice penguin plot
#By Angela Richards Donà
#September 17, 2024

#load packages
library(palmerpenguins)
library(tidyverse)

#look at the data
view(penguins)
glimpse(penguins)

#make plot with species on x and flipper length on y
ggplot (data = penguins, mapping = aes(x = species, 
                                       y = flipper_length_mm)) +
  geom_boxplot() + #add boxplot
  geom_jitter(alpha = 0.5, size = 2, aes(color = sex)) + #visualize all datapoints
  scale_color_grey() + #make datapoints in greyscale
  labs(title = "Penguin Flipper Length by Species",
       subtitle = "Distribution by Island",
       x = "Species", 
       y = "Flipper length (mm)") + #change to nicer labels
  theme_bw(base_family = "avenir") + #customize the fonts to my favorite Avenir
  theme(axis.title = element_text(size = 12), #define font sizes
        plot.title = element_text(size = 16, face = "bold"), #make title larger and bold
        panel.grid.major.x = element_blank(), #remove the x-axis lines on plot
        legend.position = "right") + #define where legend is displayed
  facet_wrap(vars(island)) #visualize distribution by island
