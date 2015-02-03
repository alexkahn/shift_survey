# expenditure stories
 
setwd('C:/Users/Alex/Desktop/basic_transfer_survey') # Windows
bts <- dget("data/basic_transfer_data.R")
 
library('lattice')
library('ggplot2')
trim <- function (x) {gsub("^\\s+|\\s+$", "", x)}
 
# ages
plot(density(bts$age), main="Age Distribution", xlab="Age (N = 104)",
     ylab="Frequency")
abline(v = mean(bts$age))
 
ggplot(bts, aes(x=age)) + 
       geom_histogram(aes(y=..density..), binwidth=3, colour="black", 
                      fill="white") +
       geom_density(alpha=.2, fill="#FF6666") +  
       geom_vline(aes(xintercept=mean(age)), color="red",
                  linetype="dashed", size=1) +
       ggtitle("Age Distribution") + 
       theme(plot.title = element_text(face="bold")) + 
       xlab("Age (years)")
 
ggplot(bts, aes(x=age)) + geom_histogram(binwidth=.5,
                                         colour="black", fill="white") +
    geom_vline(aes(xintercept=mean(age, na.rm=T)),   # Ignore NA values for mean
               color="red", linetype="dashed", size=1)
 
boxplot(bts$age, main="Age Distribution", ylab="Age")
abline(h = mean(bts$age))
 
# sort the highest_edu_attained variable by greatest freq. to least
edu <- factor(bts$highest_edu_attained,
              levels(bts$highest_edu_attained)[c(3,4,1:2,5)])
 
barchart(edu, col=c("blue","red","green","purple", "orange"),
         horizontal = FALSE,
         main="Highest Level of Education Attained",
         xlab="Level of Education",
         ylab="Number of Women")
 
# put age into bins
f_age <- cut(bts$age, breaks = 10)
qplot(f_age, data = bts, fill=highest_edu_attained)
qplot(f_age, data = bts, fill=personal_items)
 
norm_wages <- (bts$wage_per_week - mean(bts$wage_per_week))/sd(bts$wage_per_week)
 
qplot(norm_wages, fill=f_age, binwidth=32778)
 
qplot(age, data = bts, facets= . ~ work_days_per_week)
 
out <- xtabs(wage_per_week ~ age + highest_edu_attained, bts)
 
# farming
table(bts$years_as_farmer, bts$farmer)
 
ftable(xtabs(~ bts$farmer + bts$years_as_farmer + bts$enjoy_life + bts$enjoy_farming))
 
ggplot(bts) + 
    geom_bar(aes(x=enjoy_life)) +
    facet_grid(enjoy_farming ~ years_as_farmer)
 
xtabs(~ var1 + var2, data = bts)
 
# 1 UGX = 0.000372 USD
# how many women live above the $1/day level?
daily_wage_usd <- ((bts$wage_per_week * 0.000372))/7
 
(length(which(daily_wage_usd < 1)) / nrow(bts))*100
(length(which(daily_wage_usd < 1.25)) / nrow(bts))*100
(length(which(daily_wage_usd < 2)) / nrow(bts))*100
medication_for
 
par(mfrow=c(1,3), mar=c(4,4,2,1), oma = c(0,0,2,0))
with(bts, {
    qplot(food, fill="blue")
    qplot(personal_items, fill="red")
    qplot(house_repairs, fill="green")
})
ggplot(bts, aes(x=food, y=personal_items, z=house_repairs)) + 
    geom_bar(stat="identity")
    geom_histogram(aes(x = food),fill="blue", alpha=1) +
    geom_histogram(aes(x = personal_items), fill="red", alpha=0.5) +
    geom_histogram(aes(x = house_repairs), fill = "green", alpha = 0.5)
 
## Greatest Expense
ggplot(bts, aes(x=greatest_expense)) + 
    geom_bar(fill=c("blue", "green", "red", "purple"), alpha=0.7) + 
    ggtitle("Reported Greatest Expense") + xlab("Expense") + 
    ylab("Number of women")
 
ggplot(bts) + 
    geom_bar(aes(x=greatest_expense), fill="purple", alpha=0.8) + 
    facet_grid(. ~ num_children) +
    ggtitle("Reported Greatest Expense") + xlab("Expense") + 
    ylab("Number of women")
 
ggplot(bts, aes(x=greatest_expense, fill = num_children)) + 
    geom_bar() +
    ggtitle("Reported Greatest Expense") + xlab("Expense") + 
    ylab("Number of women")
 
## Income Effect Goods
ggplot(bts, aes(income_effect_goods)) + geom_bar()