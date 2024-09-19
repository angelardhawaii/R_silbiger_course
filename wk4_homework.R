#Homework from Week 4 lesson 
#By Angela Richards Donà
#September 17, 2024

#load packages
library(tidyverse)
library(here)
library(ggh4x)

#load data
library(palmerpenguins)
glimpse(penguins)

#1. calculate the mean and variance of body mass by species, island, and sex, without NAs
pen_means_var <- penguins %>% #assign new dataframe to a new name
  drop_na(sex) %>% #drop the NAs first
  group_by(species, island, sex) %>% #group by, as the name suggests
  summarise(mean_bm = mean(body_mass_g, na.rm = TRUE), #tell the code what you want to see in the group
            var_bm = var(body_mass_g, na.rm = TRUE)) #will return a table with mean and variance by the groupings
view(pen_means_var)

            
#2. filter out male penguins then calculate the log body mass, then select only the columns for species, island, sex and
#log body mass, then use these data to make any plot, Make sure the plot has clean
#and clear labels and follows best practices. Save the plot in the correct output folder.
male_log_body <- penguins %>%
  filter(sex == "male") %>% #get males only
  mutate(log_body_mass = log(body_mass_g)) %>% #make a new column based on the log of body mass
  select(species, island, sex, log_body_mass) #new dataframe will have only these variables per the previous steps

#I want to view the mean on the plot. This gets a mean of log_body_mass
mean_log_body <- mean(male_log_body$log_body_mass)

#make a plot to display the data
male_pen_plot <- male_log_body %>% #assign a name to the plot that is different from the assigned dataframe
  ggplot(mapping = aes(x =  species, y = log_body_mass, color = species)) + #set overall aesthetics
  geom_boxplot() +
  geom_jitter(alpha = 0.5, size = 3) + #visualize all datapoints
  facet_wrap("island") + #make separate strips based on island variable
  labs(title = "Male Penguins by Species", 
       subtitle = "Distribution by Island",
      x = "Species",
      y = "Log of body mass (g)") +
  scale_color_viridis_d() +
  geom_hline(yintercept = mean_log_body, color = "red", linetype = "solid", size = 0.25) + #mean line on plot
  theme_bw(base_family = "avenir") + #applies white background and black lines + my favorite font
  theme(axis.title = element_text(size = 12), #define font sizes
        plot.title = element_text(size = 16, face = "bold"), #make title larger and bold
        panel.grid.major.x = element_blank(), #remove the x-axis lines on plot
        strip.text = element_text(size = 12), #sets font size for the Island names
        legend.position = "none") #remove the legend because unnecessary
        
ggsave(filename = "images/male_pen_logbodymass.jpg", plot = male_pen_plot,
       height = 6, width = 8)
#include both parts 1 and 2 in script and push to github in the appropriate folders
            