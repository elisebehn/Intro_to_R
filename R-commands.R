
library(tidyverse)

gapminder <-  read_csv("data/gapfinder.csv")


summary(gapminder)
my_life_exp <- gapminder$lifeExp

#to choose certain columns
select(gapminder,year, country, pop)
select(gapminder, 3,1,5)

#TO DROP OFF CERTAIN COLUMNS
select(gapminder,-pop, -year)


cutdown_gapminder <- select(gapminder,-pop,-year)

select(gapminder, country, year,pop, gdpPercap)
select(gapminder,-pop,-lifeExp)
select(gapminder, 1,3,4,5)
