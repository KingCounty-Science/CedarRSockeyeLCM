########################################################################
##   scenario 4: change proportion of adults taken to the hatchery    ## 
########################################################################

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
