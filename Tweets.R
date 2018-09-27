# Twitter use
library(twitteR)
library(lubridate)
library(tidyverse)

#load credentials
consumer_key <- "GHg7Dr5xk0UzzmKr89v5zGKLk"
consumer_secret <- "nIwOVir3XGV5YaMPzw3yNR7ht5o6ewXC4U1c6x9cbpU8sLCbQd"
access_token <- "14378096-NoknJsEnkdXd17fOrVg0yvTjZHaOZao34eGHtY5gO"
access_secret <- "oFo8e0bff908DVVkXRqWyk2kT4I6lFHurGzRf58eWMlGH"

#set up to authenticate
setup_twitter_oauth(consumer_key ,consumer_secret,access_token ,access_secret)


#fetch tweets associated with that hashtag , 12 tweets-n in 
#(en)glish-lang since the indicated date yy/mm/dd

#autism_tweets_2018 <- twitteR::searchTwitter("autism", n = 10000, lang = "en", since = as.character(ymd("2018-08-01")))
#commented to make sure this is not run (twitter limit)
autism_tweets_2018 <- strip_retweets(autism_tweets_2018)

# convert to data frame using the twListtoDF function
autism_tweets_2018_df <- twListToDF(autism_tweets_2018)

#extract the data frame save it locally
saveRDS("/Users/lbarcelo/R_Repo/Rdatasets/Autism/Twitter", file = "tweets_autism_sept_25_2018.rds")

autism_tweets_2017_08_01 <- twitteR::searchTwitter("autism", n = 1000, lang = "en", since = as.character(ymd("2017-08-01")), until = as.character(ymd("2017-08-02")))

#clean up any duplicate tweets from the data frame using #dplyr::distinct
distinct(autism_tweets_2018_df)

winner <- autism_tweets_2018_df %>% select(text,retweetCount,screenName,id )%>% filter(retweetCount == max(retweetCount))
View(winner)
