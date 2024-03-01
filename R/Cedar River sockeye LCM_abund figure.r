#################
##   FIGURES   ##
#################
#plot the number of spawners over time in each run and the average across all runs over time
#plot pHOS over time in each run and the average across all runs over time

wholeplotname <- paste("Output\\Abundance figure_",plotname)

png(filename = wholeplotname, width = 500, height = 300)

par(mfrow = c(1,1), mar = c(2.1,2.1,0.5,0.1), omi = c(0.5,0.5,0.3,0.2), cex.axis = 1.3)  #c(bottom, left, top, right)

plot(NA, NA, xlim = c(5,years), ylim = c(0,100000), xaxs="i", yaxs="i")
#abline(h = 150, col = "red", lwd = 0.1, lty = 2)
for(i in 1:runs)
  {
  lines(5:years,nat.spawners.raw[,i][5:years], lty = 1, col = "gray70")
  }
lines(5:years,MedianNatSpawners[5:years], lwd = 4, lty = 1, col = "black")
mtext("Number of natural spawners", side = 2, line = 3, cex=1.2)
mtext("Year", side = 1, line = 3, cex=1.2)

#make y-axis labels have commas in them
      #in ggplot2 package
#scale_y_continuous(label = comma)
#axis(1,at=seq(10000,50000,by=10000),
#labels=comma(seq(10000,50000,by=10000)))
#format(x, big.mark = ",", scientific = FALSE)     # Apply format function

dev.off()
