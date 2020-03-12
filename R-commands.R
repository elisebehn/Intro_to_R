
library(tidyverse)

gapminder <-  read_csv("data/gapfinder.csv")


summary(gapminder)
my_life_exp <- gapminder$lifeExp

#to choose certain columns
select(gapminder,year, country, pop)
select(gapminder, 3,1,5)

#TO DROP OFF CERTAIN COLUMNS
select(gapminder,-pop, -year)


