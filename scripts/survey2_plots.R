#===============================================================================
# Shift (fmr Basic Transfer) Initial Survey
# Author: Alex Kahn (https://github.com/alexkahn)
# Plots script (exit survey)
# Reads an R data file from the data directory, processes and outputs plots of
# the data to be used in the corresponding report.
#===============================================================================
setwd('~/Shift')
bts2 <- dget("data/shift_data.R")

ggplot(bts2, aes(x=avg_daily_meals)) + geom_histogram(binwidth=.5, fill='blue', alpha=0.8) +
  ggtitle("Average Meals per Day") + xlab("Number of meals") + ylab("Count")

ggplot(bts2, aes(x=shift_money_use)) + geom_histogram(binwidth=.45, fill = c('blue', 'red', 'green', 'orange'), alpha=0.8) +
  ggtitle("Shift Income Use") + xlab("Spending Category") + ylab("Count")

ggplot(bts2, aes(x=greatest_expense)) + 
  geom_histogram(binwidth=.45, fill = c('blue', 'red', 'purple','gold', 'green', 'orange'),
                 alpha=0.8) +
  ggtitle("Shift Income Use") + xlab("Spending Category") + ylab("Count")

ggplot(bts2, aes(x=greatest_expense)) + 
  geom_histogram(binwidth=.45, fill = c('blue', 'red', 'purple','gold', 'green',
                                        'orange'), alpha=0.8) +
  ggtitle("Greatest Expense") + xlab("Spending Category") + ylab("Count")


ggplot(bts2, aes(x=additional_money)) + 
  geom_histogram(binwidth=.45, fill=c('blue', 'red', 'gold','purple', 'green'),
                 alpha=0.8) +
  ggtitle('Additional Shift Income Use') + 
  xlab('Spending Category') + ylab('Count')