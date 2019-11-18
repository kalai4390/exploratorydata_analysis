# READING DATA FROM BOTH FILES
NEIdata <- readRDS("summarySCC_PM25.rds")
SCCdata <- readRDS("Source_Classification_Code.rds")

# subsetting the dataset with baltimore and LA on road PM data

subNEIdata <- NEIdata[(NEIdata$fips=="24510"|NEIdata$fips=="06037") & NEIdata$type=="ON-ROAD",  ]

aggregated <- aggregate(Emissions ~ year + fips, subNEIdata, sum)
aggregated$fips[aggregated$fips=="24510"] <- "Baltimore, MD"
aggregated$fips[aggregated$fips=="06037"] <- "Los Angeles, CA"

#plotting

png("plot6.png", width=1040, height=480)
g <- ggplot(aggregated, aes(factor(year), Emissions))
g <- g + facet_grid(. ~ fips)
g <- g + geom_bar(stat="identity")  +
  xlab("year") +ylab("Total PM'[2.5]*' Emissions") +
  ggtitle("Total Emissions from motor vehicle in Baltimore City vs Los Angeles for 1999-2008")
print(g)
dev.off()