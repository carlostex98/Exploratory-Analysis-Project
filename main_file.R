NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI[,6] <- as.numeric(NEI[,6])
NEI[,4] <- as.numeric(NEI[,4])



##building plot
year <- c(1999, 2002, 2005, 2008)
total_pollution <- c(sum(NEI[NEI$year==1999,6]), 
                     sum(NEI[NEI$year==2002,6]), 
                     sum(NEI[NEI$year==2005,6]), 
                     sum(NEI[NEI$year==2008,6]))

plot(year, total_pollution, type = "l", xlab = "year", ylab = "total pollution")

dev.copy(png, file = "plot1.png")
dev.off()




