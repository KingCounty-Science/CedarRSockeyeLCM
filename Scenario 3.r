########################################################################
##   scenario 3 (now actually 4): change proportion of adults taken to the hatchery    ## 
########################################################################

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
