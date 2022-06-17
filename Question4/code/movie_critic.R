movie_critic <- function(titles, xaxis_size = 5, xaxis_rows = 3){

    titles <- read.csv("data/netflix/titles.csv")

    a <- titles %>%
        ggplot() +
        geom_bar(aes(x = release_year, y = imdb_score), stat = "identity", fill = "#6669ff") +
        theme_grey() + labs(x= "Release Year",
                            y = "IMDb Score",
                            title = "IMDb Score in respective release year") +
        theme(axis.text.x = element_text(angle = 90, hjust = 1))
    a

    #imdb score over time

    b <- titles %>%
        ggplot() +
        geom_bar(aes(x = release_year, y = tmdb_score), stat = "identity", fill = "#FF6666") +
        theme_grey() + labs(x= "Release Year",
                            y = "TMDb Score",
                            title = "TMDb Score in respective release year") +
        theme(axis.text.x = element_text(angle = 90, hjust = 1))
    b
    #tmdb score over time

    c <- titles %>%
        ggplot() +
        geom_bar(aes(x = release_year, y = imdb_votes), stat = "identity", fill ="#8ce91b") +
        theme_grey() + labs(x= "Release Year",
                            y = "IMDb Votes",
                            title = "Number of IMDb Votes in respective release Year") +
        theme(axis.text.x = element_text(angle = 90, hjust = 1))
    c

    library(patchwork)
   g<- c/ ( a+b) +
        plot_annotation(
            title = 'Evolution of Movie Critique',
            caption = 'Source: IMDb'
        ) &
        theme(text = element_text('bold'))
   g

}


