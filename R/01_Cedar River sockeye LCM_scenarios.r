options(scipen = 999)
      
## PICK ONE OF THE FOLLOWING SCENARIOS TO RUN ##

########################################################################
##    baseline: all inputs are a range of values seen in the past   ##
########################################################################
Input.data <- read.csv("data\\Input data.csv", header=TRUE) 
              #years with matching data for percent female, fecundity, natural egg-to-fry survival, and hatchery egg-to-fry survival
FryToPresmoltSurv.list <- c(0.0363,0.0661,0.0218,0.0451,0.0229,0.0089,0.0385,0.0384,0.0145,0.0135)  #Fry-PreSmolt Survival, minus low outlier
SAR.list <- c(0.1886,0.0359,0.4301,0.0250,0.0324,0.1186,0.0511,0.0465,0.0620,0.1676,0.3732)  #SAR to Locks
PropByAge.array <- read.csv("C:\\Users\\kendanwk\\OneDrive - Washington State Executive Branch Agencies\\WDFW\\Cedar River sockeye\\Life-cycle model\\PropAdultsByAge.csv", header=TRUE) 
                   #used years 2005,2006,2008--2019 from fish hauled from trap in Cedar River to the hatchery
EnRouteSurvLake.list <- c(0.467,0.448,0.304,0.304,0.244)  #2014-2018 only
PrespawnSurvRiverFem.hatch.list <- c(0.586,0.694,0.681,0.654,0.672,0.862)  #from M. Sedgwick hatchery data, 2014-2018 only
PrespawnSurvRiverMale.hatch.list <- c(0.431,0.569,0.606,0.711,0.540,0.855)   #from M. Sedgwick hatchery data, 2014-2018 only
PrespawnSurvRiver.nat.list <- c(0.66,0.78,0.7,0.654,0.672,0.862)  #Heidy Barnett's study plus hatchery values for some years, 2014-2018 only

plotname <- "baseline.png"
source("R\\Cedar River sockeye LCM_model.r")
source("R\\Cedar River sockeye LCM_abund figure.r")

########################################################################
##    baseline 1: inputs are just the higher values seen in the past (not the lowest values) ##
########################################################################
Input.data <- read.csv("C:\\Users\\kendanwk\\OneDrive - Washington State Executive Branch Agencies\\WDFW\\Cedar River sockeye\\Life-cycle model\\Input data.csv", header=TRUE) 
              #years with matching data for percent female, fecundity, natural egg-to-fry survival, and hatchery egg-to-fry survival
FryToPresmoltSurv.list <- c(0.05,0.0661,0.0451,0.05,0.05) #c(0.0363,0.0661,0.0218,0.0451,0.0229,0.0089,0.0385,0.0384,0.0145,0.0135)  #Fry-PreSmolt Survival, minus low outlier
SAR.list <- c(0.1886,0.4301,0.1186,0.0511,0.0620,0.1676,0.3732) #c(0.1886,0.0359,0.4301,0.0250,0.0324,0.1186,0.0511,0.0465,0.0620,0.1676,0.3732)  #SAR to Locks
PropByAge.array <- read.csv("C:\\Users\\kendanwk\\OneDrive - Washington State Executive Branch Agencies\\WDFW\\Cedar River sockeye\\Life-cycle model\\PropAdultsByAge.csv", header=TRUE) 
                   #used years 2005,2006,2008--2019 from fish hauled from trap in Cedar River to the hatchery
EnRouteSurvLake.list <- c(0.467,0.448,0.304,0.304,0.244)  #2014-2018 only
PrespawnSurvRiverFem.hatch.list <- c(0.586,0.694,0.681,0.654,0.672,0.862)  #from M. Sedgwick hatchery data, 2014-2018 only
PrespawnSurvRiverMale.hatch.list <- c(0.431,0.569,0.606,0.711,0.540,0.855)   #from M. Sedgwick hatchery data, 2014-2018 only
PrespawnSurvRiver.nat.list <- c(0.66,0.78,0.7,0.654,0.672,0.862)  #Heidy Barnett's study plus hatchery values for some years, 2014-2018 only

plotname <- "baseline1.png"
source("C:\\Users\\kendanwk\\OneDrive - Washington State Executive Branch Agencies\\WDFW\\Cedar River sockeye\\Life-cycle model\\Cedar River sockeye LCM_model.r")
source("C:\\Users\\kendanwk\\OneDrive - Washington State Executive Branch Agencies\\WDFW\\Cedar River sockeye\\Life-cycle model\\Cedar River sockeye LCM_abund figure.r")


########################################################################
##    scenario 1: increase fry to pre-smolt/smolt survival            ##
########################################################################
#1a
FryToPresmoltSurv.list <- seq(0.03,0.05,0.001)  #CHANGED for this scenario
plotname <- "scenario 1a.png"
source("C:\\Users\\kendanwk\\OneDrive - Washington State Executive Branch Agencies\\WDFW\\Cedar River sockeye\\Life-cycle model\\Cedar River sockeye LCM_model.r")
#source("C:\\Users\\kendanwk\\OneDrive - Washington State Executive Branch Agencies\\WDFW\\Cedar River sockeye\\Life-cycle model\\Cedar River sockeye LCM_abund figure.r")
TotalMedianNatSpawners <- MedianNatSpawners
#1b
FryToPresmoltSurv.list <- seq(0.03,0.08,0.005)  #CHANGED for this scenario
plotname <- "scenario 1b.png"
source("C:\\Users\\kendanwk\\OneDrive - Washington State Executive Branch Agencies\\WDFW\\Cedar River sockeye\\Life-cycle model\\Cedar River sockeye LCM_model.r")
#source("C:\\Users\\kendanwk\\OneDrive - Washington State Executive Branch Agencies\\WDFW\\Cedar River sockeye\\Life-cycle model\\Cedar River sockeye LCM_abund figure.r")
TotalMedianNatSpawners <- rbind(TotalMedianNatSpawners,MedianNatSpawners)
#1c 
FryToPresmoltSurv.list <- seq(0.03,0.12,0.005)  #CHANGED for this scenario
plotname <- "scenario 1c.png"
source("C:\\Users\\kendanwk\\OneDrive - Washington State Executive Branch Agencies\\WDFW\\Cedar River sockeye\\Life-cycle model\\Cedar River sockeye LCM_model.r")
#source("C:\\Users\\kendanwk\\OneDrive - Washington State Executive Branch Agencies\\WDFW\\Cedar River sockeye\\Life-cycle model\\Cedar River sockeye LCM_abund figure.r")
TotalMedianNatSpawners <- rbind(TotalMedianNatSpawners,MedianNatSpawners)
#1d
FryToPresmoltSurv.list <- seq(0.03,0.2,0.01)  #CHANGED for this scenario
plotname <- "scenario 1d.png"
source("C:\\Users\\kendanwk\\OneDrive - Washington State Executive Branch Agencies\\WDFW\\Cedar River sockeye\\Life-cycle model\\Cedar River sockeye LCM_model.r")
#source("C:\\Users\\kendanwk\\OneDrive - Washington State Executive Branch Agencies\\WDFW\\Cedar River sockeye\\Life-cycle model\\Cedar River sockeye LCM_abund figure.r")
TotalMedianNatSpawners <- rbind(TotalMedianNatSpawners,MedianNatSpawners)
#1e
FryToPresmoltSurv.list <- seq(0.03,0.3,0.01)  #CHANGED for this scenario
plotname <- "scenario 1e.png"
source("C:\\Users\\kendanwk\\OneDrive - Washington State Executive Branch Agencies\\WDFW\\Cedar River sockeye\\Life-cycle model\\Cedar River sockeye LCM_model.r")
#source("C:\\Users\\kendanwk\\OneDrive - Washington State Executive Branch Agencies\\WDFW\\Cedar River sockeye\\Life-cycle model\\Cedar River sockeye LCM_abund figure.r")
TotalMedianNatSpawners <- rbind(TotalMedianNatSpawners,MedianNatSpawners)
#1f
FryToPresmoltSurv.list <- seq(0.03,0.4,0.01)  #CHANGED for this scenario
plotname <- "scenario 1f.png"
source("C:\\Users\\kendanwk\\OneDrive - Washington State Executive Branch Agencies\\WDFW\\Cedar River sockeye\\Life-cycle model\\Cedar River sockeye LCM_model.r")
#source("C:\\Users\\kendanwk\\OneDrive - Washington State Executive Branch Agencies\\WDFW\\Cedar River sockeye\\Life-cycle model\\Cedar River sockeye LCM_abund figure.r")
TotalMedianNatSpawners <- rbind(TotalMedianNatSpawners,MedianNatSpawners)

plotname <- "scenario 1.png"
source("C:\\Users\\kendanwk\\OneDrive - Washington State Executive Branch Agencies\\WDFW\\Cedar River sockeye\\Life-cycle model\\Cedar River sockeye LCM_abund figure_mult.r")


########################################################################
##    scenario 2: increase SAR                                        ##
########################################################################
#5a
SAR.list <- seq(0.04,0.25,0.01)  #CHANGED for this scenario
plotname <- "scenario 5a.png"
source("C:\\Users\\kendanwk\\OneDrive - Washington State Executive Branch Agencies\\WDFW\\Cedar River sockeye\\Life-cycle model\\Cedar River sockeye LCM_model.r")
#source("C:\\Users\\kendanwk\\OneDrive - Washington State Executive Branch Agencies\\WDFW\\Cedar River sockeye\\Life-cycle model\\Cedar River sockeye LCM_abund figure.r")
TotalMedianNatSpawners <- MedianNatSpawners
#5b
SAR.list <- seq(0.05,0.3,0.01)  #CHANGED for this scenario
plotname <- "scenario 5b.png"
source("C:\\Users\\kendanwk\\OneDrive - Washington State Executive Branch Agencies\\WDFW\\Cedar River sockeye\\Life-cycle model\\Cedar River sockeye LCM_model.r")
#source("C:\\Users\\kendanwk\\OneDrive - Washington State Executive Branch Agencies\\WDFW\\Cedar River sockeye\\Life-cycle model\\Cedar River sockeye LCM_abund figure.r")
TotalMedianNatSpawners <- rbind(TotalMedianNatSpawners,MedianNatSpawners)
#5c
SAR.list <- seq(0.05,0.4,0.01)  #CHANGED for this scenario
plotname <- "scenario 5c.png"
source("C:\\Users\\kendanwk\\OneDrive - Washington State Executive Branch Agencies\\WDFW\\Cedar River sockeye\\Life-cycle model\\Cedar River sockeye LCM_model.r")
#source("C:\\Users\\kendanwk\\OneDrive - Washington State Executive Branch Agencies\\WDFW\\Cedar River sockeye\\Life-cycle model\\Cedar River sockeye LCM_abund figure.r")
TotalMedianNatSpawners <- rbind(TotalMedianNatSpawners,MedianNatSpawners)
#5d
SAR.list <- seq(0.1,0.3,0.01)  #CHANGED for this scenario
plotname <- "scenario 5d.png"
source("C:\\Users\\kendanwk\\OneDrive - Washington State Executive Branch Agencies\\WDFW\\Cedar River sockeye\\Life-cycle model\\Cedar River sockeye LCM_model.r")
#source("C:\\Users\\kendanwk\\OneDrive - Washington State Executive Branch Agencies\\WDFW\\Cedar River sockeye\\Life-cycle model\\Cedar River sockeye LCM_abund figure.r")
TotalMedianNatSpawners <- rbind(TotalMedianNatSpawners,MedianNatSpawners)
#5e
SAR.list <- seq(0.1,0.4,0.01)  #CHANGED for this scenario
plotname <- "scenario 5e.png"
source("C:\\Users\\kendanwk\\OneDrive - Washington State Executive Branch Agencies\\WDFW\\Cedar River sockeye\\Life-cycle model\\Cedar River sockeye LCM_model.r")
#source("C:\\Users\\kendanwk\\OneDrive - Washington State Executive Branch Agencies\\WDFW\\Cedar River sockeye\\Life-cycle model\\Cedar River sockeye LCM_abund figure.r")
TotalMedianNatSpawners <- rbind(TotalMedianNatSpawners,MedianNatSpawners)
#5f
SAR.list <- seq(0.2,0.4,0.01)  #CHANGED for this scenario
plotname <- "scenario 5f.png"
source("C:\\Users\\kendanwk\\OneDrive - Washington State Executive Branch Agencies\\WDFW\\Cedar River sockeye\\Life-cycle model\\Cedar River sockeye LCM_model.r")
#source("C:\\Users\\kendanwk\\OneDrive - Washington State Executive Branch Agencies\\WDFW\\Cedar River sockeye\\Life-cycle model\\Cedar River sockeye LCM_abund figure.r")
TotalMedianNatSpawners <- rbind(TotalMedianNatSpawners,MedianNatSpawners)
#5g
SAR.list <- seq(0.2,0.45,0.01)  #CHANGED for this scenario
plotname <- "scenario 5g.png"
source("C:\\Users\\kendanwk\\OneDrive - Washington State Executive Branch Agencies\\WDFW\\Cedar River sockeye\\Life-cycle model\\Cedar River sockeye LCM_model.r")
#source("C:\\Users\\kendanwk\\OneDrive - Washington State Executive Branch Agencies\\WDFW\\Cedar River sockeye\\Life-cycle model\\Cedar River sockeye LCM_abund figure.r")
TotalMedianNatSpawners <- rbind(TotalMedianNatSpawners,MedianNatSpawners)

plotname <- "scenario 2.png"
source("C:\\Users\\kendanwk\\OneDrive - Washington State Executive Branch Agencies\\WDFW\\Cedar River sockeye\\Life-cycle model\\Cedar River sockeye LCM_abund figure_mult.r")


########################################################################
##    scenario 3: increase adult freshwater survival                  ## 
########################################################################
#a
EnRouteSurvLake.list <- seq(0.29,0.56,0.01)  #CHANGED
PrespawnSurvRiver.nat.list <- seq(0.76,0.94,0.01)  #CHANGED
plotname <- "scenario 2a.png"
source("C:\\Users\\kendanwk\\OneDrive - Washington State Executive Branch Agencies\\WDFW\\Cedar River sockeye\\Life-cycle model\\Cedar River sockeye LCM_model.r")
#source("C:\\Users\\kendanwk\\OneDrive - Washington State Executive Branch Agencies\\WDFW\\Cedar River sockeye\\Life-cycle model\\Cedar River sockeye LCM_abund figure.r")
TotalMedianNatSpawners <- MedianNatSpawners
#b
EnRouteSurvLake.list <- seq(0.34,0.65,0.01)  #CHANGED
PrespawnSurvRiverFem.hatch.list <- 0.85  #CHANGED
PrespawnSurvRiverMale.hatch.list <- 0.85  #CHANGED
PrespawnSurvRiver.nat.list <- seq(0.76,0.94,0.01)  #CHANGED
plotname <- "scenario 2b.png"
source("C:\\Users\\kendanwk\\OneDrive - Washington State Executive Branch Agencies\\WDFW\\Cedar River sockeye\\Life-cycle model\\Cedar River sockeye LCM_model.r")
#source("C:\\Users\\kendanwk\\OneDrive - Washington State Executive Branch Agencies\\WDFW\\Cedar River sockeye\\Life-cycle model\\Cedar River sockeye LCM_abund figure.r")
TotalMedianNatSpawners <- rbind(TotalMedianNatSpawners,MedianNatSpawners)
#c
EnRouteSurvLake.list <- seq(0.39,0.75,0.01)  #CHANGED
PrespawnSurvRiverFem.hatch.list <- c(0.586,0.694,0.681,0.654,0.672,0.862)  #from M. Sedgwick hatchery data, 2014-2018 only
PrespawnSurvRiverMale.hatch.list <- c(0.431,0.569,0.606,0.711,0.540,0.855)   #from M. Sedgwick hatchery data, 2014-2018 only
PrespawnSurvRiver.nat.list <- seq(0.92,0.99,0.005)  #CHANGED
plotname <- "scenario 2c.png"
source("C:\\Users\\kendanwk\\OneDrive - Washington State Executive Branch Agencies\\WDFW\\Cedar River sockeye\\Life-cycle model\\Cedar River sockeye LCM_model.r")
#source("C:\\Users\\kendanwk\\OneDrive - Washington State Executive Branch Agencies\\WDFW\\Cedar River sockeye\\Life-cycle model\\Cedar River sockeye LCM_abund figure.r")
TotalMedianNatSpawners <- rbind(TotalMedianNatSpawners,MedianNatSpawners)
#d
EnRouteSurvLake.list <- seq(0.44,0.84,0.01)  #CHANGED
PrespawnSurvRiverFem.hatch.list <- 0.85  #CHANGED
PrespawnSurvRiverMale.hatch.list <- 0.85  #CHANGED
PrespawnSurvRiver.nat.list <- seq(0.92,0.99,0.005)  #CHANGED
plotname <- "scenario 2d.png"
source("C:\\Users\\kendanwk\\OneDrive - Washington State Executive Branch Agencies\\WDFW\\Cedar River sockeye\\Life-cycle model\\Cedar River sockeye LCM_model.r")
#source("C:\\Users\\kendanwk\\OneDrive - Washington State Executive Branch Agencies\\WDFW\\Cedar River sockeye\\Life-cycle model\\Cedar River sockeye LCM_abund figure.r")
TotalMedianNatSpawners <- rbind(TotalMedianNatSpawners,MedianNatSpawners)
#e
EnRouteSurvLake.list <- 0.85  #CHANGED
PrespawnSurvRiverFem.hatch.list <- seq(0.49,0.93,0.01)  #CHANGED
PrespawnSurvRiverMale.hatch.list <- seq(0.54,0.89,0.01)  #CHANGED
PrespawnSurvRiver.nat.list <- seq(0.92,0.99,0.005)  #CHANGED
plotname <- "scenario 2e.png"
source("C:\\Users\\kendanwk\\OneDrive - Washington State Executive Branch Agencies\\WDFW\\Cedar River sockeye\\Life-cycle model\\Cedar River sockeye LCM_model.r")
#source("C:\\Users\\kendanwk\\OneDrive - Washington State Executive Branch Agencies\\WDFW\\Cedar River sockeye\\Life-cycle model\\Cedar River sockeye LCM_abund figure.r")
TotalMedianNatSpawners <- rbind(TotalMedianNatSpawners,MedianNatSpawners)
#f
EnRouteSurvLake.list <- 0.8  #CHANGED
PrespawnSurvRiverFem.hatch.list <- 0.9  #CHANGED
PrespawnSurvRiverMale.hatch.list <- 0.9  #CHANGED
PrespawnSurvRiver.nat.list <- seq(0.92,0.99,0.005)  #CHANGED
plotname <- "scenario 2f.png"
source("C:\\Users\\kendanwk\\OneDrive - Washington State Executive Branch Agencies\\WDFW\\Cedar River sockeye\\Life-cycle model\\Cedar River sockeye LCM_model.r")
#source("C:\\Users\\kendanwk\\OneDrive - Washington State Executive Branch Agencies\\WDFW\\Cedar River sockeye\\Life-cycle model\\Cedar River sockeye LCM_abund figure.r")
TotalMedianNatSpawners <- rbind(TotalMedianNatSpawners,MedianNatSpawners)

plotname <- "scenario 3.png"
source("C:\\Users\\kendanwk\\OneDrive - Washington State Executive Branch Agencies\\WDFW\\Cedar River sockeye\\Life-cycle model\\Cedar River sockeye LCM_abund figure_mult.r")


########################################################################
##   scenario 4: change proportion of adults taken to the hatchery    ## 
########################################################################
     #paste these in to Scenario 3.r, but paste baseline conditions first before starting these to re-calibrate about Scenario 2. Then just run below ##**
#3a
          PropToHatchery[i] <- 0.1
          if ((N.new[9]+N.new[10])<5000) {
                PropToHatchery[i] <- 0.6*stoch
                } else if ((N.new[9]+N.new[10])<15000) {
                PropToHatchery[i] <- 0.5*stoch
                } else if ((N.new[9]+N.new[10])<25000) {
                PropToHatchery[i] <- 0.4*stoch
                } else if ((N.new[9]+N.new[10])<40000) {
                PropToHatchery[i] <- 0.3*stoch
                } else if ((N.new[9]+N.new[10])<50000) {
                PropToHatchery[i] <- 0.2*stoch
                } else  
                PropToHatchery[i] <- 0.1*stoch
##**
plotname <- "scenario 3a.png"
source("C:\\Users\\kendanwk\\OneDrive - Washington State Executive Branch Agencies\\WDFW\\Cedar River sockeye\\Life-cycle model\\Cedar River sockeye LCM_model_hatchery.r")
#source("C:\\Users\\kendanwk\\OneDrive - Washington State Executive Branch Agencies\\WDFW\\Cedar River sockeye\\Life-cycle model\\Cedar River sockeye LCM_abund figure.r")
TotalMedianNatSpawners <- MedianNatSpawners
#3b
          PropToHatchery[i] <- 0.2
          if ((N.new[9]+N.new[10])<5000) {
                PropToHatchery[i] <- 0.7*stoch
                } else if ((N.new[9]+N.new[10])<15000) {
                PropToHatchery[i] <- 0.6*stoch
                } else if ((N.new[9]+N.new[10])<25000) {
                PropToHatchery[i] <- 0.5*stoch
                } else if ((N.new[9]+N.new[10])<40000) {
                PropToHatchery[i] <- 0.4*stoch
                } else if ((N.new[9]+N.new[10])<50000) {
                PropToHatchery[i] <- 0.3*stoch
                } else  
                PropToHatchery[i] <- 0.2*stoch
##**
plotname <- "scenario 3b.png"
source("C:\\Users\\kendanwk\\OneDrive - Washington State Executive Branch Agencies\\WDFW\\Cedar River sockeye\\Life-cycle model\\Cedar River sockeye LCM_model_hatchery.r")
#source("C:\\Users\\kendanwk\\OneDrive - Washington State Executive Branch Agencies\\WDFW\\Cedar River sockeye\\Life-cycle model\\Cedar River sockeye LCM_abund figure.r")
TotalMedianNatSpawners <- rbind(TotalMedianNatSpawners,MedianNatSpawners)
#3c
          PropToHatchery[i] <- 0.3
          if ((N.new[9]+N.new[10])<5000) {
                PropToHatchery[i] <- 0.8*stoch
                } else if ((N.new[9]+N.new[10])<15000) {
                PropToHatchery[i] <- 0.7*stoch
                } else if ((N.new[9]+N.new[10])<25000) {
                PropToHatchery[i] <- 0.6*stoch
                } else if ((N.new[9]+N.new[10])<40000) {
                PropToHatchery[i] <- 0.5*stoch
                } else if ((N.new[9]+N.new[10])<50000) {
                PropToHatchery[i] <- 0.4*stoch
                } else  
                PropToHatchery[i] <- 0.3*stoch
##**
plotname <- "scenario 3c.png"
source("C:\\Users\\kendanwk\\OneDrive - Washington State Executive Branch Agencies\\WDFW\\Cedar River sockeye\\Life-cycle model\\Cedar River sockeye LCM_model_hatchery.r")
#source("C:\\Users\\kendanwk\\OneDrive - Washington State Executive Branch Agencies\\WDFW\\Cedar River sockeye\\Life-cycle model\\Cedar River sockeye LCM_abund figure.r")
TotalMedianNatSpawners <- rbind(TotalMedianNatSpawners,MedianNatSpawners)
#3d
          PropToHatchery[i] <- 0.4
          if ((N.new[9]+N.new[10])<5000) {
                PropToHatchery[i] <- 0.9*stoch
                } else if ((N.new[9]+N.new[10])<15000) {
                PropToHatchery[i] <- 0.8*stoch
                } else if ((N.new[9]+N.new[10])<25000) {
                PropToHatchery[i] <- 0.7*stoch
                } else if ((N.new[9]+N.new[10])<40000) {
                PropToHatchery[i] <- 0.6*stoch
                } else if ((N.new[9]+N.new[10])<50000) {
                PropToHatchery[i] <- 0.5*stoch
                } else  
                PropToHatchery[i] <- 0.4*stoch
##**
plotname <- "scenario 3d.png"
source("C:\\Users\\kendanwk\\OneDrive - Washington State Executive Branch Agencies\\WDFW\\Cedar River sockeye\\Life-cycle model\\Cedar River sockeye LCM_model_hatchery.r")
#source("C:\\Users\\kendanwk\\OneDrive - Washington State Executive Branch Agencies\\WDFW\\Cedar River sockeye\\Life-cycle model\\Cedar River sockeye LCM_abund figure.r")
TotalMedianNatSpawners <- rbind(TotalMedianNatSpawners,MedianNatSpawners)
#3e
          PropToHatchery[i] <- 0.5
          if ((N.new[9]+N.new[10])<5000) {
                PropToHatchery[i] <- 1.0
                } else if ((N.new[9]+N.new[10])<15000) {
                PropToHatchery[i] <- 0.9*stoch
                } else if ((N.new[9]+N.new[10])<25000) {
                PropToHatchery[i] <- 0.8*stoch
                } else if ((N.new[9]+N.new[10])<40000) {
                PropToHatchery[i] <- 0.7*stoch
                } else if ((N.new[9]+N.new[10])<50000) {
                PropToHatchery[i] <- 0.6*stoch
                } else  
                PropToHatchery[i] <- 0.5*stoch
##**
plotname <- "scenario 3e.png"
source("C:\\Users\\kendanwk\\OneDrive - Washington State Executive Branch Agencies\\WDFW\\Cedar River sockeye\\Life-cycle model\\Cedar River sockeye LCM_model_hatchery.r")
#source("C:\\Users\\kendanwk\\OneDrive - Washington State Executive Branch Agencies\\WDFW\\Cedar River sockeye\\Life-cycle model\\Cedar River sockeye LCM_abund figure.r")
TotalMedianNatSpawners <- rbind(TotalMedianNatSpawners,MedianNatSpawners)
#3f
          PropToHatchery[i] <- 0.6
          if ((N.new[9]+N.new[10])<5000) {
                PropToHatchery[i] <- 1.0
                } else if ((N.new[9]+N.new[10])<15000) {
                PropToHatchery[i] <- 1.0
                } else if ((N.new[9]+N.new[10])<25000) {
                PropToHatchery[i] <- 0.9*stoch
                } else if ((N.new[9]+N.new[10])<40000) {
                PropToHatchery[i] <- 0.8*stoch
                } else if ((N.new[9]+N.new[10])<50000) {
                PropToHatchery[i] <- 0.7*stoch
                } else  
                PropToHatchery[i] <- 0.6*stoch
##**
plotname <- "scenario 3f.png"
source("C:\\Users\\kendanwk\\OneDrive - Washington State Executive Branch Agencies\\WDFW\\Cedar River sockeye\\Life-cycle model\\Cedar River sockeye LCM_model_hatchery.r")
#source("C:\\Users\\kendanwk\\OneDrive - Washington State Executive Branch Agencies\\WDFW\\Cedar River sockeye\\Life-cycle model\\Cedar River sockeye LCM_abund figure.r")
TotalMedianNatSpawners <- rbind(TotalMedianNatSpawners,MedianNatSpawners)

plotname <- "scenario 4.png"
source("C:\\Users\\kendanwk\\OneDrive - Washington State Executive Branch Agencies\\WDFW\\Cedar River sockeye\\Life-cycle model\\Cedar River sockeye LCM_abund figure_mult.r")


########################################################################
##    scenario 5: combo of all above                                  ##
########################################################################
#paste these in to Scenario 4.r.  Then just run below ##**
#4a
          PropToHatchery[i] <- 0.1
          if ((N.new[9]+N.new[10])<5000) {
                PropToHatchery[i] <- 0.6*stoch
                } else if ((N.new[9]+N.new[10])<15000) {
                PropToHatchery[i] <- 0.5*stoch
                } else if ((N.new[9]+N.new[10])<25000) {
                PropToHatchery[i] <- 0.4*stoch
                } else if ((N.new[9]+N.new[10])<40000) {
                PropToHatchery[i] <- 0.3*stoch
                } else if ((N.new[9]+N.new[10])<50000) {
                PropToHatchery[i] <- 0.2*stoch
                } else  
                PropToHatchery[i] <- 0.1*stoch
##**
FryToPresmoltSurv.list <- seq(0.03,0.05,0.001)  #CHANGED for this scenario
EnRouteSurvLake.list <- seq(0.29,0.56,0.01)  #CHANGED
PrespawnSurvRiver.nat.list <- seq(0.76,0.94,0.01)  #CHANGED
plotname <- "scenario 4a.png"
source("C:\\Users\\kendanwk\\OneDrive - Washington State Executive Branch Agencies\\WDFW\\Cedar River sockeye\\Life-cycle model\\Cedar River sockeye LCM_model_hatcheryplus.r")
#source("C:\\Users\\kendanwk\\OneDrive - Washington State Executive Branch Agencies\\WDFW\\Cedar River sockeye\\Life-cycle model\\Cedar River sockeye LCM_abund figure.r")
TotalMedianNatSpawners <- MedianNatSpawners

#4b
FryToPresmoltSurv.list <- seq(0.03,0.06,0.001)  #CHANGED for this scenario
EnRouteSurvLake.list <- seq(0.29,0.56,0.01)  #CHANGED
PrespawnSurvRiverFem.hatch.list <- 0.85  #CHANGED
PrespawnSurvRiverMale.hatch.list <- 0.85  #CHANGED
PrespawnSurvRiver.nat.list <- seq(0.76,0.94,0.01)  #CHANGED
plotname <- "scenario 4b.png"
source("C:\\Users\\kendanwk\\OneDrive - Washington State Executive Branch Agencies\\WDFW\\Cedar River sockeye\\Life-cycle model\\Cedar River sockeye LCM_model_hatcheryplus.r")
#source("C:\\Users\\kendanwk\\OneDrive - Washington State Executive Branch Agencies\\WDFW\\Cedar River sockeye\\Life-cycle model\\Cedar River sockeye LCM_abund figure.r")
TotalMedianNatSpawners <- rbind(TotalMedianNatSpawners,MedianNatSpawners)

#4c
FryToPresmoltSurv.list <- seq(0.03,0.07,0.001)  #CHANGED for this scenario
EnRouteSurvLake.list <- seq(0.34,0.65,0.01)  #CHANGED
PrespawnSurvRiverFem.hatch.list <- 0.85  #CHANGED
PrespawnSurvRiverMale.hatch.list <- 0.85  #CHANGED
PrespawnSurvRiver.nat.list <- seq(0.76,0.94,0.01)  #CHANGED
plotname <- "scenario 4c.png"
source("C:\\Users\\kendanwk\\OneDrive - Washington State Executive Branch Agencies\\WDFW\\Cedar River sockeye\\Life-cycle model\\Cedar River sockeye LCM_model_hatcheryplus.r")
#source("C:\\Users\\kendanwk\\OneDrive - Washington State Executive Branch Agencies\\WDFW\\Cedar River sockeye\\Life-cycle model\\Cedar River sockeye LCM_abund figure.r")
TotalMedianNatSpawners <- rbind(TotalMedianNatSpawners,MedianNatSpawners)

#4d
          PropToHatchery[i] <- 0.2
          if ((N.new[9]+N.new[10])<5000) {
                PropToHatchery[i] <- 0.7*stoch
                } else if ((N.new[9]+N.new[10])<15000) {
                PropToHatchery[i] <- 0.6*stoch
                } else if ((N.new[9]+N.new[10])<25000) {
                PropToHatchery[i] <- 0.5*stoch
                } else if ((N.new[9]+N.new[10])<40000) {
                PropToHatchery[i] <- 0.4*stoch
                } else if ((N.new[9]+N.new[10])<50000) {
                PropToHatchery[i] <- 0.3*stoch
                } else  
                PropToHatchery[i] <- 0.2*stoch
##**
FryToPresmoltSurv.list <- seq(0.03,0.07,0.001)  #CHANGED for this scenario
EnRouteSurvLake.list <- seq(0.39,0.75,0.01)  #CHANGED
PrespawnSurvRiverFem.hatch.list <- 0.85  #CHANGED
PrespawnSurvRiverMale.hatch.list <- 0.85  #CHANGED
PrespawnSurvRiver.nat.list <- seq(0.76,0.94,0.01)  #CHANGED
plotname <- "scenario 4d.png"
source("C:\\Users\\kendanwk\\OneDrive - Washington State Executive Branch Agencies\\WDFW\\Cedar River sockeye\\Life-cycle model\\Cedar River sockeye LCM_model_hatcheryplus.r")
#source("C:\\Users\\kendanwk\\OneDrive - Washington State Executive Branch Agencies\\WDFW\\Cedar River sockeye\\Life-cycle model\\Cedar River sockeye LCM_abund figure.r")
TotalMedianNatSpawners <- rbind(TotalMedianNatSpawners,MedianNatSpawners)

plotname <- "scenario 5.png"
source("C:\\Users\\kendanwk\\OneDrive - Washington State Executive Branch Agencies\\WDFW\\Cedar River sockeye\\Life-cycle model\\Cedar River sockeye LCM_abund figure_mult.r")


########################################################################
##  scenario 6: increase HATCHERY fry to pre-smolt/smolt survival     ##
########################################################################

#make sure scenario 6 is read into Cedar River sockeye LCM_model_hatchfrytosmolt.r

Nat.FryToPresmoltSurv.list <- c(0.0363,0.0661,0.0218,0.0451,0.0229,0.0089,0.0385,0.0384,0.0145,0.0135)  #Fry-PreSmolt Survival, minus low outlier
#6a
Hatch.FryToPresmoltSurv.list <- seq(0.05,0.2,0.01)  #CHANGED for this scenario
plotname <- "scenario 6aa.png"
source("C:\\Users\\kendanwk\\OneDrive - Washington State Executive Branch Agencies\\WDFW\\Cedar River sockeye\\Life-cycle model\\Cedar River sockeye LCM_model_hatchfrytosmolt.r")
#source("C:\\Users\\kendanwk\\OneDrive - Washington State Executive Branch Agencies\\WDFW\\Cedar River sockeye\\Life-cycle model\\Cedar River sockeye LCM_abund figure.r")
TotalMedianNatSpawners <- MedianNatSpawners
#6b
Hatch.FryToPresmoltSurv.list <- seq(0.1,0.3,0.01)  #CHANGED for this scenario
plotname <- "scenario 6bb.png"
source("C:\\Users\\kendanwk\\OneDrive - Washington State Executive Branch Agencies\\WDFW\\Cedar River sockeye\\Life-cycle model\\Cedar River sockeye LCM_model_hatchfrytosmolt.r")
#source("C:\\Users\\kendanwk\\OneDrive - Washington State Executive Branch Agencies\\WDFW\\Cedar River sockeye\\Life-cycle model\\Cedar River sockeye LCM_abund figure.r")
TotalMedianNatSpawners <- rbind(TotalMedianNatSpawners,MedianNatSpawners)
#6c 
Hatch.FryToPresmoltSurv.list <- seq(0.2,0.5,0.01)  #CHANGED for this scenario
plotname <- "scenario 6cc.png"
source("C:\\Users\\kendanwk\\OneDrive - Washington State Executive Branch Agencies\\WDFW\\Cedar River sockeye\\Life-cycle model\\Cedar River sockeye LCM_model_hatchfrytosmolt.r")
#source("C:\\Users\\kendanwk\\OneDrive - Washington State Executive Branch Agencies\\WDFW\\Cedar River sockeye\\Life-cycle model\\Cedar River sockeye LCM_abund figure.r")
TotalMedianNatSpawners <- rbind(TotalMedianNatSpawners,MedianNatSpawners)
#6d
Hatch.FryToPresmoltSurv.list <- seq(0.3,0.6,0.01)  #CHANGED for this scenario
plotname <- "scenario 6dd.png"
source("C:\\Users\\kendanwk\\OneDrive - Washington State Executive Branch Agencies\\WDFW\\Cedar River sockeye\\Life-cycle model\\Cedar River sockeye LCM_model_hatchfrytosmolt.r")
#source("C:\\Users\\kendanwk\\OneDrive - Washington State Executive Branch Agencies\\WDFW\\Cedar River sockeye\\Life-cycle model\\Cedar River sockeye LCM_abund figure.r")
TotalMedianNatSpawners <- rbind(TotalMedianNatSpawners,MedianNatSpawners)
#6e
Hatch.FryToPresmoltSurv.list <- seq(0.4,0.7,0.01)  #CHANGED for this scenario
plotname <- "scenario 6ee.png"
source("C:\\Users\\kendanwk\\OneDrive - Washington State Executive Branch Agencies\\WDFW\\Cedar River sockeye\\Life-cycle model\\Cedar River sockeye LCM_model_hatchfrytosmolt.r")
#source("C:\\Users\\kendanwk\\OneDrive - Washington State Executive Branch Agencies\\WDFW\\Cedar River sockeye\\Life-cycle model\\Cedar River sockeye LCM_figures.r")    
TotalMedianNatSpawners <- rbind(TotalMedianNatSpawners,MedianNatSpawners)
#6f
Hatch.FryToPresmoltSurv.list <- seq(0.5,0.8,0.01)  #CHANGED for this scenario
plotname <- "scenario 6ff.png"
source("C:\\Users\\kendanwk\\OneDrive - Washington State Executive Branch Agencies\\WDFW\\Cedar River sockeye\\Life-cycle model\\Cedar River sockeye LCM_model_hatchfrytosmolt.r")
#source("C:\\Users\\kendanwk\\OneDrive - Washington State Executive Branch Agencies\\WDFW\\Cedar River sockeye\\Life-cycle model\\Cedar River sockeye LCM_figures.r")    
TotalMedianNatSpawners <- rbind(TotalMedianNatSpawners,MedianNatSpawners)

plotname <- "scenario 6.png"
source("C:\\Users\\kendanwk\\OneDrive - Washington State Executive Branch Agencies\\WDFW\\Cedar River sockeye\\Life-cycle model\\Cedar River sockeye LCM_abund figure_mult.r")


#################################################################################################################################
##  scenario 7: increase HATCHERY fry to pre-smolt/smolt survival and increased proportion of adults taken to the hatchery     ##
#################################################################################################################################

#make sure scenario 7 is read into Cedar River sockeye LCM_model_hatchfrytosmolt.r

Nat.FryToPresmoltSurv.list <- c(0.0363,0.0661,0.0218,0.0451,0.0229,0.0089,0.0385,0.0384,0.0145,0.0135)  #Fry-PreSmolt Survival, minus low outlier
#7a
Hatch.FryToPresmoltSurv.list <- seq(0.05,0.2,0.01)  #CHANGED for this scenario
plotname <- "scenario 7a.png"
source("C:\\Users\\kendanwk\\OneDrive - Washington State Executive Branch Agencies\\WDFW\\Cedar River sockeye\\Life-cycle model\\Cedar River sockeye LCM_model_hatchfrytosmolt.r")
#source("C:\\Users\\kendanwk\\OneDrive - Washington State Executive Branch Agencies\\WDFW\\Cedar River sockeye\\Life-cycle model\\Cedar River sockeye LCM_abund figure.r")
TotalMedianNatSpawners <- MedianNatSpawners
#7b
Hatch.FryToPresmoltSurv.list <- seq(0.1,0.3,0.01)  #CHANGED for this scenario
plotname <- "scenario 7b.png"
source("C:\\Users\\kendanwk\\OneDrive - Washington State Executive Branch Agencies\\WDFW\\Cedar River sockeye\\Life-cycle model\\Cedar River sockeye LCM_model_hatchfrytosmolt.r")
#source("C:\\Users\\kendanwk\\OneDrive - Washington State Executive Branch Agencies\\WDFW\\Cedar River sockeye\\Life-cycle model\\Cedar River sockeye LCM_abund figure.r")
TotalMedianNatSpawners <- rbind(TotalMedianNatSpawners,MedianNatSpawners)
#7c 
Hatch.FryToPresmoltSurv.list <- seq(0.2,0.5,0.01)  #CHANGED for this scenario
plotname <- "scenario 7c.png"
source("C:\\Users\\kendanwk\\OneDrive - Washington State Executive Branch Agencies\\WDFW\\Cedar River sockeye\\Life-cycle model\\Cedar River sockeye LCM_model_hatchfrytosmolt.r")
#source("C:\\Users\\kendanwk\\OneDrive - Washington State Executive Branch Agencies\\WDFW\\Cedar River sockeye\\Life-cycle model\\Cedar River sockeye LCM_abund figure.r")
TotalMedianNatSpawners <- rbind(TotalMedianNatSpawners,MedianNatSpawners)
#7d
Hatch.FryToPresmoltSurv.list <- seq(0.3,0.6,0.01)  #CHANGED for this scenario
plotname <- "scenario 7d.png"
source("C:\\Users\\kendanwk\\OneDrive - Washington State Executive Branch Agencies\\WDFW\\Cedar River sockeye\\Life-cycle model\\Cedar River sockeye LCM_model_hatchfrytosmolt.r")
#source("C:\\Users\\kendanwk\\OneDrive - Washington State Executive Branch Agencies\\WDFW\\Cedar River sockeye\\Life-cycle model\\Cedar River sockeye LCM_abund figure.r")
TotalMedianNatSpawners <- rbind(TotalMedianNatSpawners,MedianNatSpawners)

plotname <- "scenario 7.png"
source("C:\\Users\\kendanwk\\OneDrive - Washington State Executive Branch Agencies\\WDFW\\Cedar River sockeye\\Life-cycle model\\Cedar River sockeye LCM_abund figure_mult.r")

