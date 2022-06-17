plot_precipitation <- function(df_weather, xaxis_size = 5, xaxis_rows = 3){


    g<- df_weather %>%
        ggplot() +
        geom_bar(aes(x = date, y = precipitation), stat = "identity") +
        theme_grey() + labs(x= "Date",
                            y = "Precipitation",
                            title = "Amount of Rain in London from 1979-2020",
                            caption = "Source:\nUK National Weather Service") +
        theme(axis.text.x = element_text(angle = 90, hjust = 1))
    g
}
