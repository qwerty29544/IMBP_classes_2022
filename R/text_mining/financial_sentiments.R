
# libraries ---------------------------------------------------------------

library(stringr)
library(dplyr)


# read_csv ----------------------------------------------------------------

df <- read.csv(file = "./data/data.csv")


# tokenizer ---------------------------------------------------------------

tokenizer <- function(text, min_token_length=3, token_regexp="[\\w\\d]+") {
    text <- stringr::str_extract_all(string = text, pattern = token_regexp)
    return(list(text = text[[1]][nchar(text[[1]]) >= min_token_length]))
}

delete_charset <- function(text, charset = "[:punct:0-9$]") {
    text <- stringr::str_remove_all(text, pattern = charset)
    return(text)
}

# df transform ------------------------------------------------------------

tokenizer(delete_charset(df[9, 1,]), 3)


