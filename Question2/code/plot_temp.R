plot_temp <- function(df_weather, xaxis_size = 5, xaxis_rows = 3){


    g<- df_weather %>%
        ggplot() +
        geom_line(aes(x= date, y= mean_temp), alpha = 0.9) +
        theme_grey() + labs(x= "Date",
                            y = "Average Temperature",
                            title = "Average annual temperature in London from 1979-2020",
                            caption = "Source:\nUK National Weather Service") +
         geom_hline(yintercept=0, color = "red", size=1) +
        geom_hline(yintercept=12, color = "blue", linetype = "dashed", size= 0.75) +
        geom_hline(yintercept=22, color = "green", linetype = "dashed", size= 0.75) +
        theme(axis.text.x = element_text(angle = 90, hjust = 1))
    g
}
