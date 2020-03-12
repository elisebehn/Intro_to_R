
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
eurpoe <- filter(gapminder,continent == "Europe")

#to look at whole data frame:

view(gapminder)

#to View you function
view(filter(gapminder, year>=1997))


#multiple filters starts with the first (,& AND)  (| OR) 
filter(gapminder, country=="Australia", year >=1997)
filter(gapminder, country=="Australia"|year >=1997)

#below function will not work as it is looking for both countries,
filter(gapminder, country== "Australia", country == "New Zealand")

# to fix this use %in%

filter(gapminder, country %in% c("Australia","New Zealand", "India"))

filter(gapminder, continent %in% c("Africa","asia", "Europe"))
       
