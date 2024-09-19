#Learn about the TidyVerse
#By Angela Richards Donà
#September 17, 2024

#load packages
library(palmerpenguins)
library(tidyverse)
library (here)

#load the data
glimpse(penguins)
head(penguins)

#one equal sign I am naming it, if two I am filtering T or F
#this will filter out only the female, which is T anything else F so excluded
filter(.data = penguins, sex == "female")

filter(.data = penguins, year == "2008")
filter (.data = penguins, body_mass_g > 5000 & year == "2008")
filter(.data = penguins, year == "2008" | year == "2009")
filter(.data = penguins, year %in% c("2008", "2009"))
filter(.data = penguins, island != "Dream")
filter(.data = penguins, species %in% c("Adelie", "Gentoo")) # this one tricksy

#mutate
data2<-mutate(.data = penguins, 
              body_mass_kg = body_mass_g/1000)
view(data2)

data2 <- mutate(.data = penguins,
                body_mass_g = body_mass_g/1000,
                bill_length_depth = bill_length_mm/bill_depth_mm)
view(data2)

# mutate conditionally

data2<- mutate(.data = penguins,
               after_2008 = ifelse(year>2008, "After 2008", "Before 2008"))
view(data2)

#add flipper length and body mass and make a new column
data3 <- mutate(.data = penguins,
                length_mass = flipper_length_mm + body_mass_g,
                thick_pengs = ifelse(body_mass_g >4000, "Big", "Small"))
view(data3)

#select
penguins %>% # use penguin dataframe
  filter(sex == "female") %>% #select females
  mutate(log_mass = log(body_mass_g)) %>% #calculate log biomass
  select(species, island, sex, log_mass)

#rename a column
penguins %>% # use penguin dataframe
  filter(sex == "female") %>% #select females
  mutate(log_mass = log(body_mass_g)) %>% #calculate log biomass
  select(Species = species, island, sex, log_mass)

penguins %>%
  summarise(mean_flipper = mean(flipper_length_mm, na.rm = TRUE))

#use group_by to summarise
penguins %>%
  group_by(island) %>%
  summarise(mean_flipper = mean(flipper_length_mm, na.rm = TRUE),
            min_flipper = min(flipper_length_mm, na.rm = TRUE)
#drop_na
