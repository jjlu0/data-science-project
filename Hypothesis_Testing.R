
#### one-sample t-test ####
sleep_hours <- c(5, 5, 5, 6, 6, 7, 7, 7, 8, 9)
mean(sleep_hours)
sd(sleep_hours)

#right direction
t.test(sleep_hours, mu = 7, alternative = "less")

#wrong direction
t.test(sleep_hours, mu = 7, aternative = "greater")



##Using iris dataset

pop_mean <- mean(iris$Sepal.Length)

setosa <- filter(iris, Species == "setosa")

t.test(setosa$Sepal.Length, mu = pop_mean)

#if the sample mean of setosa sepal lengths is 5.843333 (same is pop mean),
#then 0.0000000002% of the time, this difference (or more) will happen by chance
#alternate hypothesis supported, true mean of all setosa

##Practice 
#choose a different numeric variable, Sepal.Width, Petal.Length, Petal.Width and 
# compare any of the 3 species to the population mean


pop_mean <- mean(iris$Petal.Length)

virginica <- filter(iris, Species == "virginica")

t.test(virginica$Petal.Length, mu = pop_mean)

# 0.0000000000002% of the time, difference will happen by chance, means that this
#data supports alternate hypothesis and is a significant difference. The true mean
# for virginica petal lengths is not equal to 3.758. 


#### two-sample t-test ####
versicolor <- filter(iris, Species == "versicolor")
setosa <- filter(iris, Species == 'setosa')

t.test(versicolor$Sepal.Length, setosa$Sepal.Length)
#mean of setosa sepal lengths - mean of versicolor sepal lengths != 0

#true difference in means is not equal to 0 proves that
#mean of setosa sepal lengths != mean of versicolor sepal lengths

## Practice: Compare versicolor and virginica sepal lengths. what is the p-value? 
#is it significant?
# We want to know is there a difference between the sepal lengths of virginica 
#and versicolor?

virginica <- filter(iris, Species == "virginica")

t.test(versicolor$Sepal.Length, virginica$Sepal.Length)

#the p-value is 1.866e-07 which means 0.000000187% of the time, the difference will happen by chance
# and the significance is high. The data supports the null hypothesis







#### paired t-test ####
#paired t-tests calculate differences between two groups (like before) but here, 
#it's comparing differences between pairs!!! 
install.packages("datarium")
library(datarium)
?mice2
mice2
#dataset of mice weights before and after
#comparing before and after

t.test(mice2$before, mice2$after, paired = T)
#significant difference, shows that mean of the differences between each pair 
# is not 0 and therefore there is significant difference

#when choosing pairs, must make sure they are pair-able






#### ANOVA ####
sepal_len_aov <- aov(data = iris, Sepal.Length ~ Species)
#want to save output of aov function into variable, then get an 
#overall summary if ANY categories are different and tells us which categories
#are different
#anova compares the variance

## are any categories different?
summary(sepal_len_aov)

# from 0 --> 0.001 (high significance) and so on until 0.05 --> 1 (10% of time chance, meh)
#if there's any star, means is significant

## which groups are different?
TukeyHSD(sepal_len_aov)
#says the p-values are so small, they're just written as 0
#diff gives the difference of the means 
#Tukey goes back to comparing means

## Let's look at diamonds dataset
View(diamonds)
price_of_color_aov <- aov(data = diamonds, price ~ color)
summary(price_of_color_aov)

#to save results,
signif_results <- TukeyHSD(price_of_color_aov)$color
head(signif_results)
#use the $color to just get the table and not the words on top
#convert to dataframe so we can use dplyr functions
arrange(as.data.frame(signif_results), 'p adj')






