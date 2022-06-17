plot_sunshine <- function(weather, xaxis_size = 5, xaxis_rows = 3){


    g<- weather %>%
        ggplot() +
        geom_col(aes(x = date, y= sunshine), alpha = 0.9, size =1) +
        theme_grey() + labs(x= "Date",
                            y = "Sunshine",
                            title = "Amount of Sunshine in London in 2020",
                            caption = "Source:\nUK National Weather Service")
    gg <- g %+% subset(weather, date > as.Date("2019-12-31"))
    gg
}
