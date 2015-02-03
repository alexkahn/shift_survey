setwd('C:/Users/Alex/Desktop/basic_transfer_survey') # Windows
bts <- dget("data/basic_transfer_data.R")
 
A <- cbind(bts$healthy, bts$medication, bts$healthy_family,
          bts$family_takes_meds, bts$spend_on_food_last_month,
          bts$spend_on_food_last_week)
cor(A)