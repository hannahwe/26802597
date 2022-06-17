plot_cases_separate <- function(covid_owid, xaxis_size = 5, xaxis_rows = 3){

    h <- plot_cases_iso(covid_owid, xaxis_rows = 2, xaxis_size = 5)
    h <- g + facet_wrap(~iso_code)


h
}
