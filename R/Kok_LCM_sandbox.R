#=== === === === === === === ===
# Script started by Rebekah Stiling, Bailey Keeler, and Jim Bower Spring 2024
# This is the beginning of a Kokanee lifecycle model
# rstiling@kingcounty.gov, bkeeler@
#=== === === === === === === ====

#lists based on observations
hat_egg_surv_list <-c(1, 1,1,1,1,.5,.8) #Jim estimate
percent_female_list <-c(0.29, 0.28, 0.49, 0.26, 0.39, 0.41, 0.34 ,0.36, 0.30, 0.32, 0.37, 0.34) #spreadsheet

nat_egg_surv_min <- 0.015
nat_egg_surv_max <- 0.176
n_nat_eggs_start <- 120000
n_hat_eggs_start <- 7500
nat_fry_to_spawn_survival <- .11
hat_fry_to_spawn_survival <- .01
# nat_brood_to_spawn_2 <- c(.04, 0.03, 0.05) prep to build randomness in the future
portion_nat_brood_to_spawn_age <- c(.0434, .7405, .2123, .0038) #average values for a composition that sums to 1, to estimate the percent of brood that later returned as spawners from 2009-2018
portion_hat_brood_to_spawn_age <- c(.0782, .8842, .0376, 0) 

## Create an empty matrix for filling in a loop 
#natural fish df
nat_df <- matrix(data = NA, nrow = 5, ncol = 4)
rownames(nat_df) <- c("SPAWN_01", "SPAWN_02","SPAWN_03","SPAWN_04","SPAWN_05")
colnames(nat_df) <- c("2yo", "3yo","4yo","5yo")

#hatchery fish df
hat_df <- matrix(data = NA, nrow = 5, ncol = 4)
rownames(hat_df) <- c("SPAWN_01", "SPAWN_02","SPAWN_03","SPAWN_04","SPAWN_05")
colnames(hat_df) <- c("2yo", "3yo","4yo","5yo")


#One simple cohort ##

#egg to fry ####
n_nat_eggs <- n_nat_eggs_start

n_hat_eggs <- n_hat_eggs_start
nat_egg_surv <- runif(n = 1, min = nat_egg_surv_min, max = nat_egg_surv_max)
hat_egg_surv <- sample(x = hat_egg_surv_list, size = 1, replace = TRUE)
n_nat_fry <- n_nat_eggs*nat_egg_surv
n_hat_fry <- n_hat_eggs*hat_egg_surv

#fry to lake survival to transition to spawner by ages ####

## natural org fish ####
n_nat_spawner <- n_nat_fry*nat_fry_to_spawn_survival

n_nat_year_2_spawners<-n_nat_spawner*portion_nat_brood_to_spawn_age[1]
n_nat_year_3_spawners<-n_nat_spawner*portion_nat_brood_to_spawn_age[2]
n_nat_year_4_spawners<-n_nat_spawner*portion_nat_brood_to_spawn_age[3]
n_nat_year_5_spawners<-n_nat_spawner*portion_nat_brood_to_spawn_age[4]

nat_df["SPAWN_02","2yo"] <- n_nat_year_2_spawners
nat_df["SPAWN_03","3yo"] <- n_nat_year_3_spawners
nat_df["SPAWN_04","4yo"] <- n_nat_year_4_spawners
nat_df["SPAWN_05","5yo"] <- n_nat_year_5_spawners

nat_spawners <- sum(nat_df["SPAWN_03",], na.rm = TRUE) ## Remove NA REMOVE IN THE FUTURE

## hatchery fish ####
n_hat_spawner <- n_hat_fry*hat_fry_to_spawn_survival

n_hat_year_2_spawners<-n_hat_spawner*portion_hat_brood_to_spawn_age[1]
n_hat_year_3_spawners<-n_hat_spawner*portion_hat_brood_to_spawn_age[2]
n_hat_year_4_spawners<-n_hat_spawner*portion_hat_brood_to_spawn_age[3]
n_hat_year_5_spawners<-n_hat_spawner*portion_hat_brood_to_spawn_age[4]

hat_df["SPAWN_02","2yo"] <- n_hat_year_2_spawners
hat_df["SPAWN_03","3yo"] <- n_hat_year_3_spawners
hat_df["SPAWN_04","4yo"] <- n_hat_year_4_spawners
hat_df["SPAWN_05","5yo"] <- n_hat_year_5_spawners

hat_spawners <- sum(hat_df["SPAWN_03",], na.rm = TRUE) ## Remove NA REMOVE IN THE FUTURE

# spawner to egg ####
total_spawners <- nat_spawners + hat_spawners
