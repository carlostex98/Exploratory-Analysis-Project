NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")



##building plot
year <- c(1999, 2002, 2005, 2008)
total_pollution <- c(sum(NEI[NEI$year=="1999" & NEI$fips==24510,6]), 
                     sum(NEI[NEI$year=="2002" & NEI$fips==24510,6]), 
                     sum(NEI[NEI$year=="2005" & NEI$fips==24510,6]), 
                     sum(NEI[NEI$year=="2008" & NEI$fips==24510,6]))

total_pollution2 <- c(sum(NEI[NEI$year=="1999" & NEI$fips==06037,6]), 
                     sum(NEI[NEI$year=="2002" & NEI$fips==06037,6]), 
                     sum(NEI[NEI$year=="2005" & NEI$fips==06037,6]), 
                     sum(NEI[NEI$year=="2008" & NEI$fips==06037,6]))

plot(year, total_pollution, type = "l", xlab = "year", ylab = "total pollution")
plot(year, total_pollution2, type = "l", xlab = "year", ylab = "total pollution")