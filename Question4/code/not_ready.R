#group by genre (use grepl), then show IMDB rating for different genres
unique(titles$genre)
titles %>% filter(grepl("comedy"))
titles %>% pull(genres) %>% unique

titles %>% filter(grepl(pattern="war"))

titles %>%
    ggplot() +
    geom_bar(aes(x = release_year, y = imdb_score), stat = "identity") +
    theme_grey() + labs(x= "Release Year",
                        y = "IMDb Score",
                        title = "IMDb Score according to release year") +
    theme(axis.text.x = element_text(angle = 90, hjust = 1))

summary(titles$imdb_score)

summary(titles$release_year) #1945 until 2022

#how many movies per year
titles %>% filter(release_year>2021)


df <- titles %>% count(release_year)#shows me how many movies were released per year
 #new merged data frame
df_titles <- left_join(titles, df) %>% mutate(imdb_per_movie = imdb_score/n)
#new data frame that merges and creates new column with imdb score per movie
df_titles %>% mutate(imdb_per_movie = imdb_score/n)


#now plot imdb score per movie by release year

df_titles %>%
    ggplot() +
    geom_bar(aes(x = release_year, y = imdb_per_movie), stat = "identity") +
    theme_grey() + labs(x= "Release Year",
                        y = "Average IMDb Score",
                        title = "Average IMDb Score per year") +
    theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
    scale_x_continuous(limits = c(2000, 2022)) +
    ylim(0,1)

summary(df_titles$imdb_per_movie)



#filter data according to different genres

#most popular genres are:
table(titles$genres)
df_genre <- as.data.frame(table(titles$genres)) %>% arrange(desc(Freq))
View(df_genre) #now take first values and arrange them in table
df_genre_1 <- df_genre[1:9, ]
View(df_genre_1)
library(data.table)
t <- setDT(df_genre_1)
t
library(gt)
gt(df_genre_1   , rowname_col = "Genre", caption = "Most Popular Movie Genres",
   tab_header(title=  "Most Popular Movie Genres"))

df_genre_1 %>%
    gt()%>%
    tab_header(
        title = md("**Most Popular Movie Genres**")
    ) %>% tab_source_note(
        source_note = "Source: IMDb"
    )
#can see, comedy and drama most popular

