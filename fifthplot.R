NEI_data <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

mrg_data <- merge(NEI_data, SCC, by = "SCC")

library(ggplot2)

subNEI <- NEI_data[NEI_data$fips=="24510" & NEI_data$type=="ON-ROAD",  ]

totalg <- aggregate(Emissions ~ year, subNEI, sum)

png("plot5.png", width=900, height=500)
g <- ggplot(totalg, aes(factor(year), Emissions/1000))
g <- g + geom_bar(stat = "identity") + xlab("years") +
  ylab(expression('Total PM Emissions-kilotons-')) +
  ggtitle(expression('Total PM Emissions from motor vehicle sources from 1999-2008 in Baltimore City'))
print(g)
dev.off()