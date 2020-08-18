NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
library(ggplot2)

tmp <- c(sum(NEI[NEI$type=="POINT" & NEI$year==1999 & NEI$fips==24510,4]),
         sum(NEI[NEI$type=="POINT" & NEI$year==2002& NEI$fips==24510,4]),
         sum(NEI[NEI$type=="POINT" & NEI$year==2005 & NEI$fips==24510,4]),
         sum(NEI[NEI$type=="POINT" & NEI$year==2008 & NEI$fips==24510,4]),
         sum(NEI[NEI$type=="NONPOINT" & NEI$year==1999 & NEI$fips==24510,4]),
         sum(NEI[NEI$type=="NONPOINT" & NEI$year==2002 & NEI$fips==24510,4]),
         sum(NEI[NEI$type=="NONPOINT" & NEI$year==2005 & NEI$fips==24510,4]),
         sum(NEI[NEI$type=="NONPOINT" & NEI$year==2008 & NEI$fips==24510,4]),
         sum(NEI[NEI$type=="ON-ROAD" & NEI$year==1999 & NEI$fips==24510,4]),
         sum(NEI[NEI$type=="ON-ROAD" & NEI$year==2002& NEI$fips==24510,4]),
         sum(NEI[NEI$type=="ON-ROAD" & NEI$year==2005 & NEI$fips==24510,4]),
         sum(NEI[NEI$type=="ON-ROAD" & NEI$year==2008& NEI$fips==24510,4]),
         sum(NEI[NEI$type=="NON-ROAD" & NEI$year==1999& NEI$fips==24510,4]),
         sum(NEI[NEI$type=="NON-ROAD" & NEI$year==2002& NEI$fips==24510,4]),
         sum(NEI[NEI$type=="NON-ROAD" & NEI$year==2005& NEI$fips==24510,4]),
         sum(NEI[NEI$type=="NON-ROAD" & NEI$year==2008& NEI$fips==24510,4]))

v <- data.frame("type"=rep(c("POINT", "NONPOINT", "ON-ROAD", "NON-ROAD"), each=4),
                "year"=rep(c("1999", "2002", "2005", "2008"),times=4),
                "pollution"=tmp)


p<-ggplot(v, aes(x=year, y=pollution, group=type)) + geom_line(aes(color=type))+geom_point(aes(color=type))
p
             
             