#shows how total cases evolved over time grouped by continents --> problem: missing values for continents
plot_cases_continent1 <- function(covid_owid, xaxis_size = 5, xaxis_rows = 3){

    library(lubridate)
    covid_owid_adj <-  covid_owid %>% mutate(across(contains('date'), ymd))


    df_plot_general <- covid_owid_adj %>% group_by(continent)
g <- df_plot_general %>%
    ggplot()+
    geom_line(aes(x = date, y = total_cases, color = continent), alpha = 0.8,
              size = 1) +
    theme_bw() + theme(legend.position = "bottom") + labs(x = "Date",
                                                          y = "Total Cases", title = "Total Number of COVID cases per region",
                                                          caption = "Our World in Data") +
    scale_x_date()  + scale_y_continuous()
g


}
