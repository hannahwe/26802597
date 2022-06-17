#change data frame based on iso code

plot_deaths_iso <- function(df_covid_owid, xaxis_size = 5, xaxis_rows = 3){

    library(lubridate)
    iso_continent <- c("OWID_AFR", "OWID_ASI", "OWID_EUR", "OWID_OCE", "OWID_NAM")
    #selects 5 continents

    covid_owid_deaths <- df_covid_owid %>% filter(iso_code %in% iso_continent)
    #this filters the regions according to the OWID filter (continents)

    df_plot_deaths_iso <- covid_owid_deaths %>% group_by(iso_code)

h <- df_plot_deaths_iso %>%
        ggplot()+
        geom_line(aes(x = date, y = total deaths, color = iso_code), alpha = 0.8,
                  size = 1) +
        theme_bw() + theme(legend.position = "bottom") + labs(x = "Date",
                                                              y = "Total Deaths", title = "Total Number of deaths per region",
                                                              caption = "Our World in Data")


h

}



