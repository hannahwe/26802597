#filter data according to different genres

#most popular genres are:
table_genre <- function(titles){

    df_genre <- as.data.frame(table(titles$genres)) %>% arrange(desc(Freq))
    #now take first values and arrange them in table
    df_genre_1 <- df_genre[1:9, ]
    #make table
    library(gt)

    df_genre_1 %>%
        gt()%>%
        tab_header(
            title = md("**Most Popular Movie Genres**")
        ) %>% tab_source_note(
            source_note = "Source: IMDb"
        )
    #can see, comedy and drama most popular

}
