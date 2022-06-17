average_score_per_movier <- function(titles, xaxis_size = 5, xaxis_rows = 3){


    #how many movies per year
    titles %>% filter(release_year>2021)


    df <- titles %>% count(release_year)#shows me how many movies were released per year
    #new merged data frame
    df_titles <- left_join(titles, df) %>% mutate(imdb_per_movie = imdb_score/n)
    #new data frame that merges and creates new column with imdb score per movie
    df_titles %>% mutate(imdb_per_movie = imdb_score/n)


    #now plot imdb score per movie by release year

    g <-   df_titles %>%
        ggplot() +
        geom_bar(aes(x = release_year, y = imdb_per_movie), stat = "identity") +
        theme_grey() + labs(x= "Release Year",
                            y = "Average IMDb Score",
                            title = "Average IMDb Score per year") +
        theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
        scale_x_continuous(limits = c(2000, 2022)) +
        ylim(0,1)
    g

}




