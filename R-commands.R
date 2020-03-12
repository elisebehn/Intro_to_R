
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
select(gapminder, 1,3,5,6)


#renaming variables = rename(new = old)
rename(gapminder,country_name = country)

rename(gapminder, life = lifeExp, cap = gdpPercap)


# column functions 
#Select & Rename

#filter (== to include , != to exclude, greater Than> less than<)

filter(gapminder, country== "Australia")

filter(gapminder, year>=1997)


filter(gapminder, lifeExp >80)
filter(gapminder,continent == "Europe")
