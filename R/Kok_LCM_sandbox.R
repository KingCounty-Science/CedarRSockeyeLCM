#=== === === === === === === ===
# Script started by Rebekah Stiling, Bailey Keeler, and Jim Bower Spring 2024
# This is the beginning of a Kokanee lifecycle model
# rstiling@kingcounty.gov, bkeeler
#=== === === === === === === ====

hat_egg_surv_list <-c(1, 1,1,1,1,.5,.8)
nat_egg_surv_min <- 0.015
nat_egg_surv_max <- 0.176
n_nat_eggs_start <- 10000
n_hat_eggs_start <- 75000
nat_fry_to_spawn_survival <- .11
hat_fry_to_spawn_survival <- 
# nat_brood_to_spawn_2 <- c(.04, 0.03, 0.05) prep to build randomness in the future
portion_nat_brood_to_spawn_age <- c(.0434, .7405, .2123, .0038) #average values for a composition that sums to 1, to estimate the percent of brood that later returned as spawners from 2009-2018

## Create an empty matrix for filling in a loop 
nat_df <- matrix(data = NA, nrow = 5, ncol = 4)
rownames(nat_df) <- c("SPAWN_01", "SPAWN_02","SPAWN_03","SPAWN_04","SPAWN_05")
colnames(nat_df) <- c("BROOD_2yr", "BROOD_3yr","BROOD_4yr","BROOD_5yr")

nat_df


#One simple cohort ##

#egg to fry ####
n_nat_eggs <- n_nat_eggs_start
n_hat_eggs <- n_hat_eggs_start
nat_egg_surv <- runif(n = 1, min = nat_egg_surv_min, max = nat_egg_surv_max)
hat_egg_surv <- sample(x = hat_egg_surv_list, size = 1, replace = TRUE)
n_nat_fry <- n_eggs*nat_egg_surv* 
n_hat_fry <- n_hat_eggs*hat_egg_surv

#fry to lake survival and transition to spawner by ages ####

n_nat_year_2_spawners<-n_nat_fry*portion_nat_brood_to_spawn_age[1]
n_nat_year_3_spawners<-n_nat_fry*portion_nat_brood_to_spawn_age[2]
n_nat_year_4_spawners<-n_nat_fry*portion_nat_brood_to_spawn_age[3]
n_nat_year_5_spawners<-n_nat_fry*portion_nat_brood_to_spawn_age[4]

nat_df["SPAWN_02","BROOD_2yr"] <- n_nat_year_2_spawners
nat_df["SPAWN_03","BROOD_3yr"] <- n_nat_year_3_spawners
nat_df["SPAWN_04","BROOD_4yr"] <- n_nat_year_4_spawners
nat_df["SPAWN_05","BROOD_5yr"] <- n_nat_year_5_spawners

nat_spawners <- sum(df["SPAWN_03",], na.rm = TRUE) ## Remove NA REMOVE IN THE FUTURE

