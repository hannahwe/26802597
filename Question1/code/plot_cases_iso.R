
#change data frame based on iso code
plot_cases_iso <- function(covid_owid_iso, xaxis_size = 5, xaxis_rows = 3){

    library(lubridate)
    iso_continent <- c("OWID_AFR", "OWID_ASI", "OWID_EUR", "OWID_OCE", "OWID_NAM")
    #selects 5 continents

    covid_owid_iso <- covid_owid %>% filter(iso_code %in% iso_continent) %>% mutate(across(contains('date'), ymd))
    #this filters the regions according to the OWID filter (continents)

    df_plot_general_iso <- covid_owid_iso %>% group_by(iso_code)

g <- df_plot_general_iso %>%
    ggplot()+
    geom_line(aes(x = date, y = total_cases, color = iso_code), alpha = 0.8,
              size = 1) +
    theme_bw() + theme(legend.position = "bottom") + labs(x = "Date",
                                                            y = "Total Cases", title = "Total Number of COVID cases per continent",
                                                            caption = "Our World in Data") +
    scale_x_date()  + scale_y_continuous()



g

}
