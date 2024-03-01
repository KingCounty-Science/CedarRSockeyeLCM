########################################################################
##    RUN MODEL HERE                                                  ## 
########################################################################

#get the inputs
N.init = c(1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 7028, 5010, 2066, 1794)  #only need the 11th and 13th values here
      #initial numbers by stages: natural-origin eggs, hatchery-origin eggs,  
      #natural-origin fry, hatchery-origin fry, natural-origin pre-smolts/smolts, hatchery-origin pre-smolts/smolts,  
      #Ballard locks natural-origin adults, Ballard locks hatchery-origin adults, natural-origin adults returning to spawn, 
      #hatchery-origin adults returning to spawn, natural female spawners, natural male spawners, 
      #hatchery female spawners, hatchery male spawners 
N.new = N = N.init
runs = 1000
years = 60  #100

ext.thresh = 150
ext = array(0,c(years,runs)) #extinction array
Spawners = Recruits = array(NA,c(years,runs))
mean.pHOS = array(NA,runs)
mean.spawn = geomean.spawn = median.spawn = mean.RS = array(NA,runs)
quantile5perc <- quantile50perc <- quantile95perc <- array(NA,runs)
NatOrigEggs.raw <- array(NA,c(years,runs))  #N[1], natural-origin eggs
HatchOrigEggs.raw <- array(NA,c(years,runs))  #N[2], hatchery-origin eggs
NatOrigFry.raw <- array(NA,c(years,runs))  #N[3], natural-origin fry
HatchOrigFry.raw <- array(NA,c(years,runs))  #N[4], hatchery-origin fry
NatOrigPreSmolts.raw <- array(NA,c(years,runs))  #N[5], natural-origin pre-smolts/smolts
HatchOrigPreSmolts.raw <- array(NA,c(years,runs))  #N[6], hatchery-origin pre-smolts/smolts
NatOrigAdults.raw <- array(NA,c(years,runs))  #N[7], natural-origin adults to Ballard Locks
HatchOrigAdults.raw <- array(NA,c(years,runs))  #N[8], hatchery-origin adults to Ballard Locks
NatOrigReturnAdults.raw <- array(NA,c(years,runs))  #N[9], natural-origin returning to spawn adults
HatchOrigReturnAdults.raw <- array(NA,c(years,runs))  #N[10], hatchery-origin returning to spawn adults
NatOrigSpawnAdultsFem.raw <- array(NA,c(years,runs))  #N[11], natural-spawning female adults
NatOrigSpawnAdultsMale.raw <- array(NA,c(years,runs))  #N[12], natural-spawning male adults
HatchOrigSpawnAdultsFem.raw <- array(NA,c(years,runs))  #N[13], hatchery-spawning female adults
HatchOrigSpawnAdultsMale.raw <- array(NA,c(years,runs))  #N[14], hatchery-spawning male adults
spawners.raw <- array(NA,c(years,runs))  #total number of spawners
nat.spawners.raw <- array(NA,c(years,runs))  #total number of natural spawners before PSM
pHOS.raw <- array(NA,c(years,runs))  #proportion of hatchery-origin fry
N.Adult.num <- array(NA,c(years+5,3))
H.Adult.num <- array(NA,c(years+5,3))
Num.nat.spawners <- array(NA,years)
Num.hatch.spawners <- array(NA,years)

#Results to output
RunsOut <- c()
YearsOut <- c()
GeomeanOut <- c()
GeomeanSDOut <- c()
MedianOut <- c()
MedianSDOut <- c()
Quantile5Out <- c()
Quantile50Out <- c()
Quantile95Out <- c()
Geomean5Quantile <- c()
Geomean50Quantile <- c()
Geomean95Quantile <- c()
ExtinctionOut <- c()
pHOSOut <- c()


#############################
##  the life-cycle model  ##
############################

for (j in 1:runs)
  {
      #sample from variables to get inputs for each run
      
      #all these from Input.data file
      Index.num <- sample(Input.data$Index, years, replace = TRUE, prob = NULL)
      PercentFem <- vector(length=years)
      Fecundity <- vector(length=years)
      Nat.EggToFrySurv <- vector(length=years)
      Hatch.EggToFrySurv <- vector(length=years)
          for(m in 1:years)
          {
          PercentFem[m] <- Input.data$Percent.Fem[Index.num[m]]
          Fecundity[m] <- Input.data$Fecundity[Index.num[m]]
          Nat.EggToFrySurv[m] <- Input.data$Nat.EggToFrySurv[Index.num[m]]
          Hatch.EggToFrySurv[m] <- Input.data$Hatch.EggToFrySurv[Index.num[m]]
          }
      # end
      SAR <- vector(length=years)
        for(m in 1:years)
          {
          SAR[m] <- sample(SAR.list, 1, replace = TRUE, prob = NULL)
          }
      FryToPresmoltSurv <- vector(length=years)
        for(m in 1:years)
          {
          FryToPresmoltSurv[m] <- sample(FryToPresmoltSurv.list, 1, replace = TRUE, prob = NULL)
          }
      PropByAge <- array(NA,c(years,3))
        for(m in 1:years)
          {
          aa <- sample(seq(1,length(PropByAge.array),1), 1, replace = TRUE, prob = NULL)
          PropByAge[m,1] <- PropByAge.array[aa,1]
          PropByAge[m,2] <- PropByAge.array[aa,2]
          PropByAge[m,3] <- PropByAge.array[aa,3]
          }
      EnRouteSurvLake <- vector(length=years)
        for(m in 1:years)
          {
          EnRouteSurvLake[m] <- sample(EnRouteSurvLake.list, 1, replace = TRUE, prob = NULL)
          }
      PropToHatchery <- vector(length=years)
#        for(m in 1:years)
#          {
#          PropToHatchery[m] <- sample(PropToHatchery.list, 1, replace = TRUE, prob = NULL)
#          }
#####     
      PrespawnSurvRiverFem.hatch <- vector(length=years)
        for(m in 1:years)
          {
          PrespawnSurvRiverFem.hatch[m] <- sample(PrespawnSurvRiverFem.hatch.list, 1, replace = TRUE, prob = NULL)
          }
      PrespawnSurvRiverMale.hatch <- vector(length=years)
        for(m in 1:years)
          {
          PrespawnSurvRiverMale.hatch[m] <- sample(PrespawnSurvRiverMale.hatch.list, 1, replace = TRUE, prob = NULL)
          }
      PrespawnSurvRiver.nat <- vector(length=years)
        for(m in 1:years)
          {
          PrespawnSurvRiver.nat[m] <- sample(PrespawnSurvRiver.nat.list, 1, replace = TRUE, prob = NULL)
          }
 

      #get the inputs
      N = N.init  
      
      #go through the life cycle
      for (i in 1:5)   #seeding the adults for years 1-5
      {
        N = N.init #need to restart every time until fully seeded
        stoch <- rnorm(1,1,0.02) #stochastic fudge factor to apply to the various inputs
        # Calculate effective spawners
        nat.spawners.fem = N[11]
        hatch.spawners.fem = N[13]
        # Freshwater life stages
        N.new[1] = nat.spawners.fem*(Fecundity[i]*stoch)       #natural-origin eggs
          NatOrigEggs.raw[i,j] <- N.new[1]
        N.new[2] = hatch.spawners.fem*(Fecundity[i]*stoch)   #hatchery-origin eggs
          HatchOrigEggs.raw[i,j] <- N.new[2]
        N.new[3] = N.new[1]*(Nat.EggToFrySurv[i]*stoch)     #natural-origin fry 
          NatOrigFry.raw[i,j] <- N.new[3]
        N.new[4] = N.new[2]*(Hatch.EggToFrySurv[i]*stoch)   #hatchery-origin fry
          HatchOrigFry.raw[i,j] <- N.new[4]
          pHOS.raw[i,j] <- N.new[4]/(N.new[3]+N.new[4])            #proportion of fry that are hatchery-origin
        N.new[5] = N.new[3]*(FryToPresmoltSurv[i]*stoch)     #natural-origin pre-smolt/smolts
          NatOrigPreSmolts.raw[i,j] <- N.new[5]
        N.new[6] = N.new[4]*(FryToPresmoltSurv[i]*stoch)     #hatchery-origin pre-smolt/smolts
          HatchOrigPreSmolts.raw[i,j] <- N.new[6]
            
        #ocean survival to Ballard locks for all fish for that spawning brood year
        Nat.tot.adults <- N.new[5]*(SAR[i]*stoch)  #natural-origin adults returning to Ballard Locks from that ocean entry year
        N.Adult.num[3+i,1] <- Nat.tot.adults*PropByAge[i,1]  #age 3
        N.Adult.num[4+i,2] <- Nat.tot.adults*PropByAge[i,2]  #age 4 
        N.Adult.num[5+i,3] <- Nat.tot.adults*PropByAge[i,3]  #age 5  
        
        Hatch.tot.adults <- N.new[6]*(SAR[i]*stoch)  #hatchery-origin adults returning to Ballard Locks from that ocean entry year
        H.Adult.num[3+i,1] <- Hatch.tot.adults*PropByAge[i,1]  #age 3
        H.Adult.num[4+i,2] <- Hatch.tot.adults*PropByAge[i,2]  #age 4 
        H.Adult.num[5+i,3] <- Hatch.tot.adults*PropByAge[i,3]  #age 5
        
        Num.nat.spawners[i] = N[11]+N[12]       #spawners by spawn year
        Num.hatch.spawners[i] = N[13]+N[14]
        spawners.raw[i,j] <- N[11]+N[12]+N[13]+N[14]
        nat.spawners.raw[i,j] <- N[11]+N[12]
          
      }

    for (i in 6)   #now can add up ocean age 1-3 adults to get adult back by their spawning year
      {
        N = N.init
        stoch <- rnorm(1,1,0.02) #stochastic fudge factor to apply to the various inputs
        # Calculate effective spawners
        nat.spawners.fem = N[11]
        hatch.spawners.fem = N[13]
        # Freshwater life stages
        N.new[1] = nat.spawners.fem*(Fecundity[i]*stoch)       #natural-origin eggs
          NatOrigEggs.raw[i,j] <- N.new[1]
        N.new[2] = hatch.spawners.fem*(Fecundity[i]*stoch)   #hatchery-origin eggs
          HatchOrigEggs.raw[i,j] <- N.new[2]
        N.new[3] = N.new[1]*(Nat.EggToFrySurv[i]*stoch)     #natural-origin fry 
          NatOrigFry.raw[i,j] <- N.new[3]
        N.new[4] = N.new[2]*(Hatch.EggToFrySurv[i]*stoch)   #hatchery-origin fry
          HatchOrigFry.raw[i,j] <- N.new[4]
          pHOS.raw[i,j] <- N.new[4]/(N.new[3]+N.new[4])            #proportion of fry that are hatchery-origin
        N.new[5] = N.new[3]*(FryToPresmoltSurv[i]*stoch)     #natural-origin pre-smolt/smolts
          NatOrigPreSmolts.raw[i,j] <- N.new[5]
        N.new[6] = N.new[4]*(FryToPresmoltSurv[i]*stoch)     #hatchery-origin pre-smolt/smolts
          HatchOrigPreSmolts.raw[i,j] <- N.new[6]
            
        #ocean survival to Ballard locks for all fish for that spawning brood year
        Nat.tot.adults <- N.new[5]*(SAR[i]*stoch)  #natural-origin adults returning to Ballard Locks from that ocean entry year
        N.Adult.num[3+i,1] <- Nat.tot.adults*PropByAge[i,1]  #age 3
        N.Adult.num[4+i,2] <- Nat.tot.adults*PropByAge[i,2]  #age 4 
        N.Adult.num[5+i,3] <- Nat.tot.adults*PropByAge[i,3]  #age 5  
                         
        Hatch.tot.adults <- N.new[6]*(SAR[i]*stoch)  #hatchery-origin adults returning to Ballard Locks from that ocean entry year
        H.Adult.num[3+i,1] <- Hatch.tot.adults*PropByAge[i,1]  #age 3
        H.Adult.num[4+i,2] <- Hatch.tot.adults*PropByAge[i,2]  #age 4 
        H.Adult.num[5+i,3] <- Hatch.tot.adults*PropByAge[i,3]  #age 5  
        
        N.new[7] <- N.Adult.num[i,1] + N.Adult.num[i,2] + N.Adult.num[i,3]    #natural-origin adults at Ballard Locks by spawn year
          NatOrigAdults.raw[i,j] <- N.new[7]
        N.new[8] <- H.Adult.num[i,1] + H.Adult.num[i,2] + H.Adult.num[i,3]    #hatchery-origin adults at Ballard Locks by spawn year
          HatchOrigAdults.raw[i,j] <- N.new[8] 

        # survival to return to Cedar River
        N.new[9] = N.new[7]*(EnRouteSurvLake[i]*stoch)    #natural-origin adults by spawn year to the river
          NatOrigReturnAdults.raw[i,j] <- N.new[9]
        N.new[10] = N.new[8]*(EnRouteSurvLake[i]*stoch)   #hatchery-origin adults by spawn year to the river
          HatchOrigReturnAdults.raw[i,j] <- N.new[10] 

        # calculate spawners in hatchery vs. in river
            
          #first estimate PropToHatchery based on number of adults to the river
          #######################################################################    
          source("R\\Scenario 3.r")
          #######################################################################
        #print(PropToHatchery[i])
        
        N.new[11] = (N.new[9]+N.new[10])*(1-(PropToHatchery[i]*stoch))*(PercentFem[i]*stoch)*(PrespawnSurvRiver.nat[i]*stoch)  #natural female spawners by spawn year
          NatOrigSpawnAdultsFem.raw[i,j] <- N.new[11]  
        N.new[12] = (N.new[9]+N.new[10])*(1-(PropToHatchery[i]*stoch))*(1-PercentFem[i]*stoch)*(PrespawnSurvRiver.nat[i]*stoch)  #natural male spawners by spawn year
          NatOrigSpawnAdultsMale.raw[i,j] <- N.new[12]                                                    
        N.new[13] = (N.new[9]+N.new[10])*(PropToHatchery[i]*stoch)*(PercentFem[i]*stoch)*(PrespawnSurvRiverFem.hatch[i]*stoch)    #hatchery female spawners by spawn year
          HatchOrigSpawnAdultsFem.raw[i,j] <- N.new[13]
        N.new[14] = (N.new[9]+N.new[10])*(PropToHatchery[i]*stoch)*(1-PercentFem[i]*stoch)*(PrespawnSurvRiverMale.hatch[i]*stoch)    #hatchery male spawners by spawn year
          HatchOrigSpawnAdultsMale.raw[i,j] <- N.new[14] 
        
        Num.nat.spawners[i] = N.new[11]+N.new[12]       #spawners by spawn year
        Num.hatch.spawners[i] = N.new[13]+N.new[14]
          spawners.raw[i,j] <- N.new[11]+N.new[12]+N.new[13]+N.new[14]
          nat.spawners.raw[i,j] <- ((N.new[9]+N.new[10])*(1-(PropToHatchery[i]*stoch))*(PercentFem[i]*stoch))+((N.new[9]+N.new[10])*(1-(PropToHatchery[i]*stoch))*(1-PercentFem[i]*stoch))
        
        N = N.new
      }

    for (i in 7:years)   #use the prior year's total number of adults going forward
      {
        stoch <- rnorm(1,1,0.02) #stochastic fudge factor to apply to the various inputs
        # Freshwater life stages
        N.new[1] = N[11]*(Fecundity[i]*stoch)       #natural-origin eggs
          NatOrigEggs.raw[i,j] <- N.new[1]
        N.new[2] = N[13]*(Fecundity[i]*stoch)   #hatchery-origin eggs
          HatchOrigEggs.raw[i,j] <- N.new[2]
        N.new[3] = N.new[1]*(Nat.EggToFrySurv[i]*stoch)     #natural-origin fry
          NatOrigFry.raw[i,j] <- N.new[3]
        N.new[4] = N.new[2]*(Hatch.EggToFrySurv[i]*stoch)   #hatchery-origin fry
          HatchOrigFry.raw[i,j] <- N.new[4]
          pHOS.raw[i,j] <- N.new[4]/(N.new[3]+N.new[4])            #proportion of fry that are hatchery-origin
        N.new[5] = N.new[3]*(FryToPresmoltSurv[i]*stoch)     #natural-origin pre-smolt/smolts
          NatOrigPreSmolts.raw[i,j] <- N.new[5]
        N.new[6] = N.new[4]*(FryToPresmoltSurv[i]*stoch)     #hatchery-origin pre-smolt/smolts
          HatchOrigPreSmolts.raw[i,j] <- N.new[6]

        #ocean survival to Ballard locks for all fish for that spawning brood year
        Nat.tot.adults <- N.new[5]*(SAR[i]*stoch)  #natural-origin adults returning to Ballard Locks from that ocean entry year
        N.Adult.num[3+i,1] <- Nat.tot.adults*PropByAge[i,1]  #age 3
        N.Adult.num[4+i,2] <- Nat.tot.adults*PropByAge[i,2]  #age 4 
        N.Adult.num[5+i,3] <- Nat.tot.adults*PropByAge[i,3]  #age 5  
                         
        Hatch.tot.adults <- N.new[6]*(SAR[i]*stoch)  #hatchery-origin adults returning to Ballard Locks from that ocean entry year
        H.Adult.num[3+i,1] <- Hatch.tot.adults*PropByAge[i,1]  #age 3
        H.Adult.num[4+i,2] <- Hatch.tot.adults*PropByAge[i,2]  #age 4 
        H.Adult.num[5+i,3] <- Hatch.tot.adults*PropByAge[i,3]  #age 5  
        
        N.new[7] <- N.Adult.num[i,1] + N.Adult.num[i,2] + N.Adult.num[i,3]    #natural-origin adults at Ballard Locks by spawn year
          NatOrigAdults.raw[i,j] <- N.new[7]
        N.new[8] <- H.Adult.num[i,1] + H.Adult.num[i,2] + H.Adult.num[i,3]    #hatchery-origin adults at Ballard Locks by spawn year
          HatchOrigAdults.raw[i,j] <- N.new[8] 

        NumAtLocks <- N.new[7]+N.new[8]
        #add in Lake WA fishing here if number of fish at the Ballard Locks meets a certain value
        if  (NumAtLocks >= 200000 & NumAtLocks < 300000) {
            N.new[7] <- N.new[7]*0.85        #harvest rate = 0.15
            N.new[8] <- N.new[8]*0.85
           }
        if  (NumAtLocks >= 300000 & NumAtLocks < 400000) {
            N.new[7] <- N.new[7]*0.75        #harvest rate = 0.25
            N.new[8] <- N.new[8]*0.75
           }
        if  (NumAtLocks >= 400000 & NumAtLocks < 500000) {
            N.new[7] <- N.new[7]*0.65        #harvest rate = 0.35
            N.new[8] <- N.new[8]*0.65
           }
        if  (NumAtLocks >= 500000 & NumAtLocks < 600000) {
            N.new[7] <- N.new[7]*0.6        #harvest rate = 0.4
            N.new[8] <- N.new[8]*0.6
           }
        if  (NumAtLocks >= 600000) {
            N.new[7] <- N.new[7]*0.55        #harvest rate = 0.45
            N.new[8] <- N.new[8]*0.55
           }

        # survival to return to Cedar River
        N.new[9] = N.new[7]*(EnRouteSurvLake[i]*stoch)    #natural-origin adults by spawn year to the river
          NatOrigReturnAdults.raw[i,j] <- N.new[9]
        N.new[10] = N.new[8]*(EnRouteSurvLake[i]*stoch)    #hatchery-origin adults by spawn year to the river
          HatchOrigReturnAdults.raw[i,j] <- N.new[10] 

        # calculate spawners in hatchery vs. in river
        
          #######################################################################      
          #first estimate PropToHatchery based on number of adults to the river
          source("R\\Scenario 3.r")
          #######################################################################
        #print(PropToHatchery[i])
          
        N.new[11] = (N.new[9]+N.new[10])*(1-(PropToHatchery[i]*stoch))*(PercentFem[i]*stoch)*(PrespawnSurvRiver.nat[i]*stoch)  #natural female spawners by spawn year
          NatOrigSpawnAdultsFem.raw[i,j] <- N.new[11]  
        N.new[12] = (N.new[9]+N.new[10])*(1-(PropToHatchery[i]*stoch))*(1-PercentFem[i]*stoch)*(PrespawnSurvRiver.nat[i]*stoch)  #natural male spawners by spawn year
          NatOrigSpawnAdultsMale.raw[i,j] <- N.new[12]  
        N.new[13] = (N.new[9]+N.new[10])*(PropToHatchery[i]*stoch)*(PercentFem[i]*stoch)*(PrespawnSurvRiverFem.hatch[i]*stoch)    #hatchery female spawners by spawn year
          HatchOrigSpawnAdultsFem.raw[i,j] <- N.new[13]
        N.new[14] = (N.new[9]+N.new[10])*(PropToHatchery[i]*stoch)*(1-PercentFem[i]*stoch)*(PrespawnSurvRiverMale.hatch[i]*stoch)    #hatchery male spawners by spawn year
          HatchOrigSpawnAdultsMale.raw[i,j] <- N.new[14] 
        
        Num.nat.spawners[i] = N.new[11]+N.new[12]       #spawners by spawn year
        Num.hatch.spawners[i] = N.new[13]+N.new[14]
          spawners.raw[i,j] <- N.new[11]+N.new[12]+N.new[13]+N.new[14]
          nat.spawners.raw[i,j] <- ((N.new[9]+N.new[10])*(1-(PropToHatchery[i]*stoch))*(PercentFem[i]*stoch))+((N.new[9]+N.new[10])*(1-(PropToHatchery[i]*stoch))*(1-PercentFem[i]*stoch))
        #print(N.new[])
        
        #extinction probability
        if (sum(Num.nat.spawners[(i-3):i])+sum(Num.hatch.spawners[(i-3):i]) < 4*ext.thresh) { 
          ext[i,j] = 1
        }
                     
        N = N.new
      }

    mean.spawn[j] = mean(Num.nat.spawners[7:years]+Num.hatch.spawners[7:years])
    geomean.spawn[j] = exp(mean(log(Num.nat.spawners[7:years]+Num.hatch.spawners[7:years])))
    median.spawn[j] = median(Num.nat.spawners[7:years]+Num.hatch.spawners[7:years])
    quantile5perc[j] <- quantile(Num.nat.spawners[7:years]+Num.hatch.spawners[7:years],probs=c(0.05))
    quantile50perc[j] <- quantile(Num.nat.spawners[7:years]+Num.hatch.spawners[7:years],prob=c(0.50))
    quantile95perc[j] <- quantile(Num.nat.spawners[7:years]+Num.hatch.spawners[7:years],prob=c(0.95))
    mean.pHOS[j] <- mean(pHOS.raw[7:years,j])
  }

  RunsOut <- c(RunsOut,runs)
  YearsOut <- c(YearsOut,years)
  GeomeanOut <- c(GeomeanOut,round(mean(geomean.spawn),1))
  GeomeanSDOut <- c(GeomeanSDOut,round(sqrt(var(geomean.spawn)),1))
  MedianOut <- c(MedianOut,round(mean(median.spawn),1))
  MedianSDOut <- c(MedianSDOut,round(sqrt(var(median.spawn)),1))
  Quantile5Out <- c(Quantile5Out,round(mean(quantile5perc),1))
  Quantile50Out <- c(Quantile50Out,round(mean(quantile50perc),1))
  Quantile95Out <- c(Quantile95Out,round(mean(quantile95perc),1))
  Geomean5Quantile <- c(Geomean5Quantile,round(exp(mean(log(quantile5perc))),1))
  Geomean50Quantile <- c(Geomean50Quantile,round(exp(mean(log(quantile50perc))),1))
  Geomean95Quantile <- c(Geomean95Quantile,round(exp(mean(log(quantile95perc))),1))
  ExtinctionOut <- c(ExtinctionOut,round(mean(ext[,]),3))
  pHOSOut <- c(pHOSOut,mean(pHOS.raw[,]))

MedianSpawners <- apply(spawners.raw, 1, median)
MedianNatSpawners <- apply(nat.spawners.raw, 1, median)
MedianpHOS <- apply(pHOS.raw, 1, median)

#write.csv(MedianSpawners,"Output\\MedianSpawners.csv")
#write.csv(MedianpHOS,"Output\\MedianpHOS.csv")

#outdat <- data.frame(RunsOut,YearsOut,GeomeanOut,GeomeanSDOut,MedianOut,MedianSDOut,Quantile5Out,Quantile50Out,
#                     Quantile95Out,Geomean5Quantile,Geomean50Quantile,Geomean95Quantile,ExtinctionOut,pHOSOut)
#outdat

#write.csv(outdat,"\\Output\\OutputResults.csv")
