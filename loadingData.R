#### Loading in csv file ####

books_dataset <- read.csv("data/books.csv") #reads the csv file,
View(books_dataset)
library(ggplot2)

## Practice plotting with your dataset

#can't subset the num_pages bc is calculating the whole dataset

ggplot(data = books_dataset, aes(x = as.numeric(average_rating))) +
  geom_histogram(binwidth = 0.25) 

ggplot(data = books_dataset, aes(x = average_rating)) +
  labs(x = "Average Rating")

ggplot(data = books_dataset, aes(x = ratings_count, y = as.numeric(average_rating))) +
  geom_line(stat = "summary",
            fun = "mean")
  


