# READING DATA FROM BOTH FILES
NEIdata <- readRDS("summarySCC_PM25.rds")
SCCdata <- readRDS("Source_Classification_Code.rds")

# subsetting baltimore city and vehicle emissions

subNEI <- NEIdata[NEIdata$fips=="24510" & NEIdata$type=="ON-ROAD",  ]

aggregateYear <- aggregate(Emissions ~ year, subNEI, sum)

#plotting
png("plot5.png",width=840, height=480)
g <- ggplot(aggregateYear, aes(factor(year), Emissions))
g <- g + geom_bar(stat="identity") +xlab("year") +
  ylab("Total PM'[2.5]*' Emissions") +
  ggtitle("Total Emissions from motor vehicle in Baltimore City, Maryland from 1999 to 2008")
print(g)
dev.off()