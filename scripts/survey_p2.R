#===============================================================================
# Shift (fmr Basic Transfer) Initial Survey
# Author: Alex Kahn (https://github.com/alexkahn)
# Data cleaning script (exit survey)
# Reads a .csv from the data directory, processes and outputs a clean .csv along
# with an R object for easy interaction within the software.
#===============================================================================
setwd('~/Shift')
survey2 <- read.csv('data/shift_survey_results.csv', stringsAsFactors=FALSE)

# munging
survey2 <- survey2[-c(4,13,26),] # remove obs. for people with all NA's
survey2 <- survey2[,-33] # remove a column that somehow got in there

# remove unnecessary columns
survey2 <- survey2[,-c(2:5)]

con <- file('scripts/col_names.txt')
isOpen(con)
col_names <- readLines(con)
close(con)
names(survey2)[4:ncol(survey2)] <- col_names

# type casting
for ( i in c(2:21,23:24,26,28)) {
  survey2[,i] <- as.factor(survey2[,i])
}

levels(survey2$farmer) <- c('Yes', 'No')

levels(survey2$healthy) <- c('Yes', 'No', 'Unsure')

levels(survey2$health_care_visit) <- c("Regularly, for check-ups",
                                    "Regularly, for treatment of a chronic illness or condition",
                                    "Only in emergencies", "Never for myself")

levels(survey2$health_care_visit_last_month) <- c('Yes', 'No', 'Unsure')

levels(survey2$health_care_visit_children) <- c("Regularly, for check-ups",
                                             "Regularly, for treatment of a chronic illness or condition",
                                             "Only in emergencies",
                                             'Never',"N/A")

levels(survey2$health_care_visit_children_last_month) <- c('Yes', 'No', 'Unsure')

levels(survey2$avg_daily_meals) <- c("0","1","2","3+")

levels(survey2$spend_on_food_last_month) <- c('Yes', 'No', 'Unsure')

levels(survey2$spend_more_on_food_last_month) <- c('Yes', 'No', 'Unsure')

levels(survey2$shift_money_use) <- c("Food", "Home repairs", "School fees",
                                  "Business capital", "Personal items", "Other")

levels(survey2$greatest_expense) <- c("Food", "Home repairs", "School fees",
                                   "Work supplies", "Personal items", "Other")

levels(survey2$additional_money) <- c("Food", "Home repairs", "School fees",
                                   "Work supplies", "Personal items", "Other")

levels(survey2$life_changed) <- c('Yes', 'No', 'Unsure')

levels(survey2$life_delta) <- c("Better", "Worse", "The Same")

levels(survey2$work_changed) <- c('Yes', 'No', 'Unsure')

levels(survey2$work_delta) <- c("Better", "Worse", "The Same")

levels(survey2$finance_business) <- c("Agricultural Venture- Land Expansion",
                                   "Trader : e.g  Open up a retail shop",
                                   "Processor - Start home food processing",
                                   "Transport business- buy boda boda",
                                   "Other specify")

levels(survey2$investments) <- c("Re-invest in the same business",
                             "Open up other business", "Buy personal items",
                             "Improve my housing", "Others")

levels(survey2$savings_group) <- c('Yes', 'No', 'Unsure')


levels(survey2$husband_concerns) <- c('Yes', 'No', 'Unsure')


levels(survey2$ideal_money_storage) <- c("SACCO saving account", "Cash box",
                                      "My home", "Mobile money account",
                                      "Unsure")

survey2$profit[c(28,66)] <- 3
survey2$profit <- as.factor(survey2$profit)
levels(survey2$profit) <- c('Yes', 'No', 'Unsure')

survey2$trust_savings_group[61] <- 3
survey2$trust_savings_group <- as.factor(survey2$trust_savings_group)
levels(survey2$trust_savings_group) <- c('Yes', 'No', 'Unsure')

survey2$sacco_or_savings[66] <- 3
survey2$sacco_or_savings <- as.factor(survey2$sacco_or_savings)
levels(survey2$sacco_or_savings) <- c('Yes', 'No', 'Unsure')

write.csv(survey2, file="data/shift_clean.csv")
dput(survey2, "data/shift_data.R")

# Make a plot of every variable
library('ggplot2')
setwd('~/Shift/plots')
for ( i in 1:ncol(survey2)) {
 png(filename=paste(i,'.png', sep=''))
 print(qplot(survey2[,i], main=names(survey2)[i]))
 dev.off()
}