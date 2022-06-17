plot_snow <- function(weather){


    g<- weather %>%
        ggplot() +
        geom_col(aes(x = date, y= snow_depth), alpha = 0.9, width= 2) +
    theme_grey() + labs(x= "Date",
                        y = "Snow Depth",
                        title = "Amount of Snow in London from 1979-2020",
                        caption = "Source:\nUK National Weather Service")
    g
}


