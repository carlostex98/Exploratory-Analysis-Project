NEI_data <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

mrg_data <- merge(NEI_data, SCC, by = "SCC")

library(ggplot2)

subNEI <- NEI_data[(NEI_data$fips=="24510"|NEI_data$fips=="06037") 
                           & NEI_data$type=="ON-ROAD",  ]

totalg <- aggregate(Emissions ~ year + fips, subNEI, sum)
totalg$fips[totalg$fips == "24510"] <- "Baltimore"
totalg$fips[totalg$fips == "06037"] <- "Los Angeles"

png("plot6.png", width=1040, height=480)
g <- ggplot(totalg, aes(factor(year), Emissions/1000))
g <- g + facet_grid(. ~ fips) + geom_bar(stat = "identity") +
  xlab("years") +
  ylab(expression('Total PM2.5 Emissions-kilotons-')) +
  ggtitle(expression('Total PM2.5 Emission motor Baltimore and Los Angeles'))
print(g)
dev.off()