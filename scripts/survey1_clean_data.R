#===============================================================================
# Shift (fmr Basic Transfer) Initial Survey
# Author: Alex Kahn (https://github.com/alexkahn)
# Data cleaning script (initial survey)
# Reads a .csv from the data directory, processes and outputs a clean .csv along
# with an R object for easy interaction within the software.
#===============================================================================
setwd('~/Shift')
data <- read.csv("data/Basic_transferv2_2014_10_27.csv", stringsAsFactors=FALSE)
data <- data[, 10:(ncol(data) -3 )]
 
# descriptive/ demographic information
descriptive <- data[,1:18]
child_ages <- descriptive[,9:13] 
descriptive <- descriptive[, -(9:13)]
 
colnames(descriptive) <- c("district", "name", "age", "sex",
                           "ethnic_group", "highest_edu_attained",
                           "married", "num_children", "children_in_school",
                           "num_child_in_school", "head_of_household",
                           "time_living_at_house",
                           "num_people_living_in_house")
 
descriptive$sex <- as.factor(descriptive$sex)
 
descriptive$num_children <- factor(descriptive$num_children,
                                   labels = c("1", "2", "3", "4", "5+"))
 
descriptive$highest_edu_attained <- factor(descriptive$highest_edu_attained,
                                            labels = c("Never attended",
                                            "Preschool",
                                            "Primary/basic",
                                            "Secondary",
                                            "Tertiary and University"))
 
descriptive$married <- as.logical(descriptive$married)
descriptive$children_in_school <- as.logical(descriptive$children_in_school)
descriptive$num_child_in_school <- as.numeric(descriptive$num_child_in_school)
descriptive$head_of_household <- as.logical(descriptive$head_of_household)
descriptive$time_living_at_house <- factor(descriptive$time_living_at_house,
                                                 labels = c("0-2 years",
                                                            "3-5 years",
                                                            "6-10 years", "10+",
                                                            "Don't Know"))
descriptive$num_people_living_in_house <- factor(descriptive$num_people_living_in_house,
                                                 labels = c("1", "2", "3",
                                                            "4", "5+"))
 
colnames(child_ages) <- c("0-2","3-5","6-10","11-15","16+")
 
# employment information
employment <- data[,19:23]
colnames(employment) <- c("farmer", "work_days_per_week",
                          "wage_per_week", "years_as_farmer",
                          "enjoy_farming")
employment$farmer <- as.logical(employment$farmer)
employment$work_days_per_week <- factor(employment$work_days_per_week, 
                                        labels = c("1-2 days", "3-4 days",
                                                   "5-7 days", "Never"))
employment$years_as_farmer <- factor(employment$years_as_farmer,
                                     labels = c("0-2 years", "3-5 years",
                                                "6-10 years", "10+", "n/a"))
employment$enjoy_farming <- factor(employment$enjoy_farming, 
                                   labels = c("Yes", "No", "Unsure", "n/a"))
 
# health information
health <- data[,24:31]
colnames(health) <- c("healthy", "medication", "meds_for",
                      "healthy_family", "family_takes_meds",
                      "meals_per_day", "spend_on_food_in_last_month",
                      "spend_on_food_in_last_week")
health$healthy <- factor(health$healthy, 
                         labels = c("Yes", "No"))
health$medication <- factor(health$medication, 
                            labels = c("Yes", "No"))
health$healthy_family <- factor(health$healthy_family, 
                                labels = c("Yes", "No"))
health$family_takes_meds <- factor(health$family_takes_meds, 
                                   labels = c("Yes", "No"))
health$meals_per_day <- as.factor(health$meals_per_day)
health$spend_on_food_in_last_month <- factor(health$spend_on_food_in_last_month,
                                             labels = c("Yes", "No"))
health$spend_on_food_in_last_week <- factor(health$spend_on_food_in_last_week,
                                            labels = c("Yes", "No"))
 
# financials
financials <- data[, 32:39]
# food_purchase -> Groups -> Every Day, etc..
colnames(financials) <- c("food","house_repairs", "personal_items", 
                          "school_fees_for_kids", "greatest_expense",
                          "greatest_expense_other", "income_effect_goods",
                          "income_effect_goods_other")
 
financials$food <- factor(financials$food, labels = c("Everyday",
                                                      "Every 7 days",
                                                      "Every 14 days",
                                                      "> 30 days ago",
                                                      "Never"))
financials$house_repairs <- factor(financials$house_repairs, 
                                   labels = c("Everyday",
                                              "Every 7 days",
                                              "Every 14 days",
                                              "> 30 days ago",
                                              "Never"))
financials$personal_items <- factor(financials$personal_items, 
                                    labels = c("Everyday", "Every 7 days",
                                               "Every 14 days", "> 30 days ago",
                                               "Never"))
financials$school_fees_for_kids <- as.logical(financials$school_fees_for_kids)
 
# no respondants indicated their greatest expense as any of the following:
#  1. Home repairs
#  2. Personal Items
financials$greatest_expense <- factor(financials$greatest_expense, 
                                      labels = c("Food", "School fees",
                                                 "Work supplies", "Other"))
 
financials$income_effect_goods <- factor(financials$income_effect_goods, 
                                         labels = c("Food", "Home repairs", 
                                                    "School fees", 
                                                    "Work supplies", 
                                                    "Personal items", "Other"))
 
# personal
personal <- data[,40:53]
ent_dev_business <- personal[,5:10] # enterprise development/ business
personal <- personal[,-(5:10)]
personal <- personal[, -(5)]
 
colnames(personal) <- c("enjoy_life", "live_elsewhere", "different_job",
                        "more_money", "mobile_money", "used_mobile_money", "carrier")
personal$enjoy_life <- factor(personal$enjoy_life, 
                              labels = c("Yes", "No", "Unsure"))
personal$live_elsewhere <- factor(personal$live_elsewhere, 
                              labels = c("Yes", "No", "Unsure"))
personal$different_job <- factor(personal$different_job, 
                              labels = c("Yes", "No", "Unsure"))
 
# sanity check variable - everyone said yes.
# personal$more_money <- factor(personal$more_money, 
#                                  labels = c("Yes", "No", "Unsure"))
 
personal$mobile_money <- as.logical(personal$mobile_money)
personal$used_mobile_money <- as.logical(personal$used_mobile_money)
 
# Enterprise development/ Business
colnames(ent_dev_business) <- c("business_idea","business_idea_other",
                                "profit_use", "profit_use_other", 
                                "keep_money_where", "keep_money_where_other")
 
ent_dev_business$business_idea <- factor(ent_dev_business$business_idea,
                                         labels = c("Agricultural",
                                                    "Trader/Retail", 
                                                    "Processor (food)",
                                                    "Transportation",
                                                    "Other"))
ent_dev_business$profit_use <- factor(ent_dev_business$profit_use, 
                                      labels = c("Re-invest in the same business",
                                                 "Open up other business",
                                                 "Buy personal items",
                                                 "Improve my housing",
                                                 "Other"))
ent_dev_business$keep_money_where <- factor(ent_dev_business$keep_money_where, 
                                            labels = c("With Bank", 
                                                       "On the phone",
                                                       "SACCO",
                                                       "With a friend",
                                                       "With my husband",
                                                       "Other"))
 
X <- cbind(descriptive, health, personal, employment, financials, ent_dev_business)
X$ethnic_group[-82] <- "Acholi"
write.csv(X, file="data/basic_transfer_clean.csv")
dput(X, "data/basic_transfer_data.R")
  