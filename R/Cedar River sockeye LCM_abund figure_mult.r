#################
##   FIGURES   ##
#################
#plot the number of natural spawners over time in each run and the average across all runs over time
#plot pHOS over time in each run and the average across all runs over time

wholeplotname <- paste("C:\\Users\\kendanwk\\OneDrive - Washington State Executive Branch Agencies\\WDFW\\Cedar River sockeye\\Life-cycle model\\Output\\Abundance figure mult vers_",plotname)

#for number of versions within a scenario
nversions <- 6

png(filename = wholeplotname, width = 500, height = 300)

par(mfrow = c(1,1), mar = c(2.1,2.1,0.5,0.1), omi = c(0.5,0.5,0.3,0.2), cex.axis = 1.3)  #c(bottom, left, top, right)

g.ramp <- gray.colors(nversions) #gray.colors(n, start = 0.3, end = 0.9, gamma = 2.2, alpha, rev = FALSE) 

#plot(NA, NA, xlim = c(5,years), ylim = c(0,120000), xaxs="i", yaxs="i", ann=FALSE)            #with axes
plot(NA, NA, xlim = c(5,years), ylim = c(0,120000), xaxs="i", yaxs="i", xaxt='n', ann=FALSE)   #without axes
#axis(side=2, labels = label_comma())
#abline(h = 150, col = "red", lwd = 0.1, lty = 2)
for(i in 1:nversions)
  {
  lines(5:years,TotalMedianNatSpawners[i,5:years], lty = 1, lwd = 4, col = g.ramp[i])
  }
#mtext("Number of natural spawners", side = 2, line = 3, cex=1.2)
#mtext("Year", side = 1, line = 3, cex=1.2)

dev.off()


#Jim Scott asked for figures starting at year 1, so here is the code to do that:

#plot(NA, NA, xlim = c(1,years), ylim = c(0,25000), xaxs="i", yaxs="i")
#abline(h = 150, col = "red", lwd = 0.1, lty = 2)
#for(i in 1:nversions)
#  {
#  lines(1:years,TotalMedianNatSpawners[i,1:years], lty = 1, lwd = 4, col = g.ramp[i])
#  }
#mtext("Number of natural spawners", side = 2, line = 3, cex=1.2)
#mtext("Year", side = 1, line = 3, cex=1.2)
#
#dev.off()
