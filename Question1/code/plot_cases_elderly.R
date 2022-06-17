plot_cases_elderly <- function(covid_owid, xaxis_size = 5, xaxis_rows = 3){


    g <-ggplot(covid_owid)+
        geom_line(aes(x = date, y = aged_65_older), alpha = 0.8,
                  size = 1) +
        theme_bw() + theme(legend.position = "bottom") + labs(x = "Date",
                                                              y = "Total Cases", title = "Total Number of COVID cases per region",
                                                              caption = "Our World in Data")



    g

}

