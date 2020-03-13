
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

#mutate to get a new column
mutate(gapminder,gdp = gdpPercap * pop)
mutate(gapminder, popM = pop/1000000)

# log- logerithem function the base of 10
mutate(gapminder, log(pop))


#to get an abbreviation of a column use substring
mutate(gapminder, country_abb = str_sub(country, start =1, end = 4))


#str_length - to get the number of letters in the cell or name
mutate(gapminder, country_name_length = str_length(country))

index_numbers <- 1:1704 

# to number the rows in your data set
mutate(gapminder, row_numn = index_numbers)

#to combined multiple new columns using mutate
mutate(gapminder, gdp = gdpPercap * pop, log(pop))


mutate(
  gapminder,
  gdp = gdpPercap * pop,
  log_gdp =(gdp)
)


mutate(gapminder, life_exp_days = lifeExp*365)
mutate(gapminder, gdp = gdpPercap * pop, GDP_BILL = gdp / 1E9)

mutate(gapminder, life_exp_days = lifeExp*365, gdp_bil = gdpPercap * pop / 1e9)


#grouping Select and FIlter commands ****
aus_cut <- select(gapminder, country, year, pop,)
aust_data <- filter(aus_cut, country == "Australia")

#aust_data is now only australia with country, year and Pop***

#nesting commands - Hot dog

aus_dataagain <- filter(select(gapminder, 1,3,5),country == "Australia")

#using pipe to next commands - keyboard shortcut(ctrl shift M)

aus_cut <- select(gapminder, country, year, pop) %>% 
  filter(aus_cut, country == "Australia")


aus_cut <- gapminder %>% select(country, year, pop) %>% filter(country == "Australia")

#below to arguments are the same
mutate(gapminder, gdp = gdpPercap *pop)



gapminder %>% mutate(gdp = gdpPercap*pop) %>% select(gdp)


#USING PIPE FILTER
aus_cut <- gapminder %>% select(country, year, pop) %>% filter(country == "Australia")

#best way to use pipe command 
final_cut <- gapminder %>% 
  select(country, year, pop,gdpPercap) %>%
  filter(country == "Australia") %>% 
  rename(gdp_per_cap = gdpPercap)

view(final_cut)

mutate(gapminder, year_pop = year)


#summarise function

summarise(gapminder, mean_life_exp = mean(lifeExp))

summarise(gapminder, 
          mean_life_exp = mean(lifeExp),
          sd_life_exp = sd(lifeExp),
          mean_gdp_per_cap = mean(gdpPercap),
          max_gdp_per_cap = max(gdpPercap))


summarise(gapminder, mean_pop = mean(pop),
          med_pop = median(pop))


#grouping fields and then summarising the data

gapminder_by_country <- group_by(gapminder,country)
summarise(gapminder_by_country,mean_pop = mean(pop))

gapminder %>% 
  group_by(continent) %>% 
  summarise(mean_life = mean(lifeExp))

summarise(gapminder_by_country, mean_life_exp = mean(lifeExp))


Cont_by_pop <- gapminder %>% 
  group_by(continent) %>% 
  summarise(mean_pop = mean(pop), med_pop = median(pop))  
            
view(Cont_by_pop)

gapminder_by_comp <- group_by(gapminder,continent)
summarise(gapminder_by_comp,
          mean_pop = mean(pop),
          mead_pop = median(pop))


#Arrange 
arrange(gapminder,gdpPercap)

arrange(gapminder,desc(gdpPercap))


arrange(gapminder,lifeExp)

#Group and sort 

group_by_Count <- group_by(gapminder, country)
summarise(group_by_Count,mean_life_exp = mean(lifeExp)) %>% 
          arrange(mean_life_exp)

 #descending order 
group_by_Count <- group_by(gapminder, country)
summarise(group_by_Count,mean_life_exp = mean(lifeExp)) %>% 
  arrange(desc(mean_life_exp))

#accending order
summarise_life_exp <- summarise(gapminder_by_country,mean_life_exp = mean(lifeExp))
arrange(summarise_life_exp,mean_life_exp)

#descending order  
summarise_life_exp <- summarise(gapminder_by_country,mean_life_exp = mean(lifeExp))
arrange(summarise_life_exp,desc(mean_life_exp))

#counting the number of observations

n()

summarise(gapminder,num_rows = n())

summarise(gapminder_by_country, num_rows = n())

summarise(gapminder_by_country, se_pop = sd(pop)/sqrt(n()))

#summarise the number of row for each continent sort lowest to highest

group_by_cont <- group_by(gapminder,continent)
summarise(group_by_cont, num_row = n()) %>% 
  arrange(num_row)


#another way to answer above question

gapminder %>% 
  group_by(continent) %>% 
  summarise(num_row = n()) %>% 
              arrange(num_row)



gapminder %>% 
  group_by(continent)








gapminder %>%
  group_by(year)
 



#COMBINING DATA**** MUST READ DATA to use in R


gapminder_2012 <- read_csv("data/gapminder_2012.csv")

gapminder

combined_gapminder <- bind_rows(gapminder, gapminder_2012)

#RENAME THE HEADINGS

rename_2012 <-  rename(gapminder_2012, population=pop)

combined_gapminder_again <- bind_rows(gapminder, rename_2012)          

mismatched <- bind_rows(gapminder, rename_2012)
head (mismatched)
tail(mismatched)


df1 <- tibble(sample = c(1, 2, 3), measure1 = c(4.2, 5.3, 6.1))

df1 <- tibble(sample = c(1, 2, 3), measure1 = c(4.2, 5.3, 6.1))
df2 <- tibble(sample = c(1, 3, 4), measure2 = c(7.8, 6.4, 9.0))

inner_join(df1,df2)
full_join(df1,df2)
left_join(df1,df2)

#what is column headings do not match - to change the heading name***

df3 <- tibble(ID = c(1,2,4),measure3 = c (4.7,3.5, 9.3))

df3
full_join(df1,df3)
full_join(df1,df3, by = c("sample" = "ID"))

sex_ratio <- read_csv("data/gapminder_sex_ratios.csv")

sex_ratio

full_join(gapminder,sex_ratio)
left_join(gapminder,sex_ratio)

####GATHER AND SPREADDDD
cows <- tibble(id = c(1,2,3),weight1 = c(207,208,209), weight2 = c(300, 309,401))
cows

gather(cows, key = weight_type, value = weight, weight1,weight2)

cows_long <- gather(cows, key = weight_type, value = weight, -id)
cows_long

spread(cows_long, key = weight_type, value = weight)

#get wide  gapminder data

gapminder_wide <- read_csv("data/gapminder_wide.csv")
gapminder_wide

#move the rows into columns
gap_long <- gather(gapminder_wide,key = orig_names, value = amount, -continent,-country)
gap_long

gap_separated <- separate(gap_long, orig_names, into = c("measure","year"), sep = "_")
gap_separated

#move the columns into rows
gap_final <- spread(gap_separated, key = measure, value =amount)
