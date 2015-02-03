#===============================================================================
#
#===============================================================================
setwd('~/Shift')

bts1 <- dget("data/basic_transfer_data.R")
bts2 <- dget("data/shift_data.R")

bts1.names <- tolower(bts1$name)
bts2.names <- tolower(bts2$Name)

s1.matches <- which(intersect(bts1.names, bts2.names) %in% bts1.names)
s2.matches <- which(intersect(bts1.names, bts2.names) %in% bts2.names)

survey1 <- bts1[s1.matches,]
survey2 <- bts2[s2.matches,]

# s1 <- read.csv('Basic_transferv2_2014_10_27.csv', stringsAsFactors = FALSE)
# s2 <- read.csv('shift_survey_p2.csv', stringsAsFactors = FALSE)

# s1.names <- tolower(s1$discriptive_info.q3)
# s2.names <- tolower(s2$Name)

# s1.matches <- which(intersect(s1.names, s2.names) %in% s1.names)
# s2.matches <- which(intersect(s1.names, s2.names) %in% s2.names)

# survey1 <- s1[s1.matches,]
# survey2 <- s2[s2.matches,]
