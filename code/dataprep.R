#Data Preparation

#Create a csv data file nba2018-teams.csv that will contain
#the required variables to be used in the ranking analysis.

#inputs: nba2018.csv
#outpus: efficiency-summary.txt, teams-summary.txt
libarary(dplyr)

nba2018$experience[nba2018$experience == "R"] <- 0
nba2018$experience <- as.integer(nba2018$experience)

nba2018$salary <- (nba2018$salary)/1000000

nba2018$position <- factor(nba2018$position)
levels(nba2018$position)[nba2018$position == "C"] <- 'center'
levels(nba2018$position)[nba2018$position == "PF"] <- 'power_fwd'
levels(nba2018$position)[nba2018$position == "PG"] <- 'point_guard'
levels(nba2018$position)[nba2018$position == "SF"] <- 'small_fwd'
levels(nba2018$position)[nba2018$position == "SG"] <- 'shoot_guard'

nba2018 <- mutate(nba2018, missed_fg = nba2018$field_goals_atts - nba2018$field_goals, missed_ft = nba2018$points1_atts - nba2018$points1, rebounds = nba2018$off_rebounds + nba2018$def_rebounds)
nba2018 <- mutate(nba2018, efficiency = (nba2018$points + nba2018$rebounds + nba2018$assists + nba2018$steals + nba2018$blocks
                                         - nba2018$missed_fg - nba2018$missed_ft - nba2018$turnovers) / nba2018$games_played)

