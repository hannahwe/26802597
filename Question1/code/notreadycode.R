plot_cases_elderly <- function(covid_owid, xaxis_size = 5, xaxis_rows = 3){}

#compute who is poorest
summary(covid_owid$extreme_poverty) #min 0.1%,, max 77.6%
covid_owid$iso_code %>% filter( grepl("OWID"))
covid_owid$extreme_poverty %>% group_by(iso_code (grepl()))
unique(covid_owid$iso_code) #shows you all the ISO codes --> can take UMC, LMC,
covid_countrygroup <- c()
LMC <- covid_owid %>% filter (grepl("OWID_LMC", iso_code))  %>% mutate(across(contains('date'), ymd)) #this creates a new data frame with only LMC countries
View(LMC)
LMC %>% ggplot()+
    geom_line(aes(x = date, y = total_cases), alpha = 0.8,
              size = 1) +
    theme_bw() + theme(legend.position = "bottom") + labs(x = "Date",
                                                          y = "Total Cases", title = "Total Number of COVID cases for LMC countries",
                                                          caption = "Our World in Data") +
    scale_x_date() + scale_y_continuous()
#total number of cases for LMC countries, compare this now to other groups of countries

UMC <- covid_owid %>% filter (grepl ("OWID_UMC", iso_code))  %>% mutate(across(contains('date'), ymd))
#creates data frame for upper middle income countries

MIC <- left_join(LMC, UMC) #there are 876 observations for all of them, therefore 876 days of pandemic
View(MIC)
View(UMC)

UMC %>% ggplot()+
    geom_line(aes(x = date, y = total_cases), alpha = 0.8,
              size = 1) +
    theme_bw() + theme(legend.position = "bottom") + labs(x = "Date",
                                                          y = "Total Cases", title = "Total Number of COVID cases for LMC countries",
                                                          caption = "Our World in Data") +
    scale_x_date() + scale_y_continuous()


HIC <- covid_owid %>% filter (grepl ("OWID_HIC", iso_code))  %>% mutate(across(contains('date'), ymd))

HIC %>% ggplot()+
    geom_line(aes(x = date, y = total_cases), alpha = 0.8,
              size = 1) +
    theme_bw() + theme(legend.position = "bottom") + labs(x = "Date",
                                                          y = "Total Cases", title = "Total Number of COVID cases for HIC countries",
                                                          caption = "Our World in Data") +
    scale_x_date() + scale_y_continuous()


countries_income <- c("OWID_UMC", "OWID_HIC", "OWID_LMC", "OWID_LIC")
#new data frame which includes the different income variables

countries_income_gr <- covid_owid %>% filter(iso_code %in% countries_income) %>% mutate(across(contains('date'), ymd))

df_plot_income <- countries_income_gr %>% group_by(iso_code)

 df_plot_income %>%
    ggplot()+
    geom_line(aes(x = date, y = total_deaths, color = iso_code), alpha = 0.8,
              size = 1) +
    theme_bw() + theme(legend.position = "bottom") + labs(x = "Date",
                                                          y = "Total Cases", title = "Total Number of COVID deaths",
                                                          caption = "Our World in Data") +
    scale_x_date()  + scale_y_continuous()

 summary(countries_income$extreme_poverty)

