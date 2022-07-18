## Practice plotting with your dataset

ggplot(data = books_dataset, aes(x = as.numeric(average_rating))) +
  geom_histogram(binwidth = 0.25) 

ggplot(data = books_dataset, aes(x = ratings_count, y = as.numeric(average_rating))) +
  geom_line(stat = "summary",
            fun = "mean")


## Practice subsetting data
# use a combination of:
# filter, select, mutate, arrange, summarize, group_by, sample, and/or slice
# create a visualization using your new subset of data

View(books_dataset)


#### cleaning data Day 1 ####



clean_data <- books_dataset %>%
  select(-isbn13, -text_reviews_count) %>%
  group_by(authors) %>% 
  summarise(mean_rating = mean(as.numeric(average_rating), na.rm = T)) %>%
  arrange(mean_rating) %>%
  sample_n(4)

?group_by
View(clean_data)

#### plotting Day 1 ####
plot <- ggplot(clean_data, aes(x = authors, y = mean_rating)) +
  geom_point() +
  theme(axis.text.x = element_text(angle = 45)) +
  labs(title = "Mean rating for each author")
plot  

#should do as bar plot instead

names(books_dataset) #pulls the names of all the columns

#### clean data Day 2 ####

clean_data <- books_dataset %>%
  select(-isbn13, -text_reviews_count, -ratings_count) %>%
  mutate(book_length = )


