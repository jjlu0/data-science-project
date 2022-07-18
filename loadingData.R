#### load in required libraries ####
library(ggplot2)



#### Load in csv file ####
books_dataset <- read.csv("data/books.csv") #reads the csv file,
View(books_dataset)

#### Save R object as file to github ####
saveRDS(books_dataset, "data/books_dataset.RDS") #compress dataset to make smaller than 5 mg

