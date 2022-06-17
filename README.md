# 26802597
 Solution to Data Science exam

# Purpose

Purpose of this README is to display the solutions to the exam questions.


```{r}

rm(list = ls()) # Clean your environment:
gc() # garbage collection - It can be useful to call gc after a large object has been removed, as this may prompt R to return memory to the operating system.
library(tidyverse)
list.files('code/', full.names = T, recursive = T) %>% .[grepl('.R', .)] %>% as.list() %>% walk(~source(.))
```
#Starting Off

I will now set the folder structure for the project, creating different folders for the different questions. 

```{r, eval = F}
CHOSEN_LOCATION <- "C:/Users/hanna/Documents/Studium/MA/3. Semester/Data Science/26802597/"
fmxdat::make_project(FilePath = glue::glue("{CHOSEN_LOCATION}/"), 
                     ProjNam = "26802597")
Texevier::create_template_html(directory = glue::glue("{CHOSEN_LOCATION}/"), template_name = "Question1")
Texevier::create_template_html(directory = glue::glue("{CHOSEN_LOCATION}/"), template_name = "Question2")
Texevier::create_template_html(directory = glue::glue("{CHOSEN_LOCATION}/"), template_name = "Question3")
Texevier::create_template_html(directory = glue::glue("{CHOSEN_LOCATION}/"), template_name = "Question4")
```
#Question 1 

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = FALSE, message = FALSE, warning = FALSE)
options(dplyr.summarise.inform=F)
if(!require("tidyverse")) install.packages("tidyverse")
library(tidyverse)
```


```{r}
#Load in data
covid_desc <- read.csv("Question1/data/COVID/covid_data_description.csv")
covid_deaths <- read.csv("Question1/data/COVID/Deaths_by_cause.csv")
covid_owid <- read.csv("Question1/data/COVID/owid-covid-data.csv")

#Source code
list.files('Question1/code/', full.names = T, recursive = T) %>% as.list() %>% walk(~source(.))
```


In question 1, I start with loading in the data and examining the data frames. I then group the different countries by continent, once using the continent variable and once by searching for "OWID". Since there are a lot of blank spaces under the continent column, it is more appropriate to rather use the continent indicators under the iso code. I then also looked at the number of deaths per region and made deductions about the relation of the number of deaths and poverty, old age, higher life expectancy etc. 

```{r, warning =  FALSE, fig.align = 'center', fig.cap = "Total Covid cases.\\label{Figure1}", fig.ext = 'png', fig.height = 5, fig.width = 7}
#shows the general distribution of cases over time by continent 
#problem: missing values for continent --> omitt missing values?
g <- plot_cases_continent1(covid_owid, xaxis_rows = 2, xaxis_size = 5)
g
```

```{r,  warning =  FALSE, fig.align = 'center', fig.cap = "Total Covid Cases.\\label{Figure2}", fig.ext = 'png', fig.height = 5, fig.width = 7}
#shows the general distribution of cases over time by continent (now via ISO code)
g <- plot_cases_iso(covid_owid, xaxis_rows = 2, xaxis_size = 5)
g
```

```{r,  warning =  FALSE, fig.align = 'center', fig.cap = "Total Covid Cases.\\label{Figure3}", fig.ext = 'png', fig.height = 5, fig.width = 7}
#COVID cases per region, can see that Africa has low number of cases 
h <- plot_cases_separate(covid_owid, xaxis_rows = 2, xaxis_size = 5)
h

```

```{r,  warning =  FALSE, fig.align = 'center', fig.cap = "Total Covid Cases.\\label{Figure5}", fig.ext = 'png', fig.height = 5, fig.width = 7}
#COVID cases per region, can see that Africa has low number of cases 
g <- plot_deaths_iso2(covid_owid, xaxis_rows = 2, xaxis_size = 5)
g

```



#Question 2

```{r}
#source in code files
list.files('Question2/code/', full.names = T, recursive = T) %>% as.list() %>% walk(~source(.))
#Load in data
weather <- read.csv("Question2/data/London/london_weather.csv")
View(weather)

#Change date column from integer to date column
library(lubridate)

weather <- transform(weather, date = as.Date(as.character(date), "%Y%m%d"))
df_weather <- weather
df_weather$date <- format(weather$date, format="%Y")
```
In question 2, I first had to chance the date column so that its class would be a date as well and no longer a character. Afterwards, I started plotting the snow depth, precipitation and mean temperature over the whole time period from 1979 to 2020, however changed the date so that it would no longer display every day and month, but only the year. For the sunshine, I only plotted the values for the year 2020. 

```{r,  warning =  FALSE, fig.align = 'center', fig.cap = "Snow Depth in London.\\label{Figure1}", fig.ext = 'png', fig.height = 5, fig.width = 7}
g <- plot_snow(weather)
g
```

```{r,  warning =  FALSE, fig.align = 'center', fig.cap = "Sunshine in London in 2020.\\label{Figure2}", fig.ext = 'png', fig.height = 5, fig.width = 7}

g <- plot_sunshine(weather, xaxis_rows = 2, xaxis_size = 5)
g
```

`

```{r, warning =  FALSE, fig.align = 'center', fig.cap = "Rain in London.\\label{Figure3}", fig.ext = 'png', fig.height = 5, fig.width = 7}
g <- plot_precipitation(df_weather, xaxis_rows = 2, xaxis_size = 5)
g
```

Then for the mean temperature, I researched the mean annual temperature for both London and Cape Town and added a horizontal line in different colors at their respective values. I also added a red line at 0 degrees to highlight where the temperature would drop below zero. 

```{r, warning =  FALSE, fig.align = 'center', fig.cap = "Temperature in London.\\label{Figure4}", fig.ext = 'png', fig.height = 5, fig.width = 7}
g <- plot_temp(df_weather, xaxis_rows = 2, xaxis_size = 5)
g
#average annual temp in cape town 22 degrees, in London 12.4 degrees
```


#Question 3




#Question 4

```{r}
# Source in all your functions:
# walk is the 'silent' version of map, which is similar to lapply.
list.files('Question4/code/', full.names = T, recursive = T) %>% as.list() %>% walk(~source(.))
```


In question 4, after setting up my Texevier template by changing my name, date etc., and sourcing in my relevant functions that I stored in the code file, I first start with reading in my data normally using the read.csv function. I read in both data frames separately because I do not see a common variable by which to join both data frames. I concentrated on the titles data frame since it had more variables and thus more information available for plots and tables. 

In my first graph I looked at the evolution of IMDb, TMDb scores and IMDb votes. I gave them different colours to make it visually nicer and then put all of the three graphs into one as a better overview and as an introduction into my short report. 

```{r,  warning =  FALSE, fig.align = 'center', fig.cap = "Evolution of Movie Critique.\\label{Figure1}", fig.ext = 'png', fig.height = 5, fig.width = 7}
titles <- read.csv("question4/data/netflix/titles.csv")
g<- movie_critic(titles)
g
```