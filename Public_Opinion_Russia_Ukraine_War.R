library(tidyverse)

# https://www.kaggle.com/datasets/asaniczka/public-opinion-russia-ukraine-war-updated-daily

df <- read_csv("reddit_opinion_ru_ua.csv")

df <- df %>%
  select(comment_id, self_text, subreddit, created_time, author_name, post_title, post_self_text, ups) %>%
  rename(votes = ups, comment_text = self_text, post_text = post_self_text) %>%
  mutate(created_time = as.Date(created_time)) 

df$year <- format(as.Date(df$created_time), "%Y")
df$month <- format(as.Date(df$created_time), "%m")

df <- df %>% 
  select(comment_id, created_time, year, month, subreddit, author_name, post_title, post_text, comment_text, votes)

write_csv(df, "preprocessed_reddit_opinion_ru_ua.csv")
