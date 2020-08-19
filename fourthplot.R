NEI_data <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

mrg_data <- merge(NEI_data, SCC, by = "SCC")

library(ggplot2)

coalm <- grepl("coal", mrg_data$EI.Sector, ignore.case=TRUE)
subs <- mrg_data[coalm, ]

totalg<- aggregate(Emissions ~ year, subs, sum)

png("plot4.png", width=740, height=520)
g <- ggplot(totalg, aes(factor(year), Emissions/1000))
g <- g + geom_bar(stat="identity") + xlab("years") + 
  ylab(expression('Total PM2.5 Emissions-kilotons-')) +
  ggtitle(expression('Total PM2.5 Emissions from coal sources from 1999 to 2008 in US'))
print(g)
dev.off()