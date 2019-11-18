# READING DATA FROM BOTH FILES
NEIdata <- readRDS("summarySCC_PM25.rds")
SCCdata <- readRDS("Source_Classification_Code.rds")


#merging two datasets
NEISCC <- merge(NEIdata, SCCdata, by="SCC")

#fetch records from NEI and SCC with short.name coal
coalMatch  <- grepl("coal", NEISCC$Short.Name, ignore.case=TRUE)
subNEISCC <- NEISCC[coalMatch, ]

aggregateYear <- aggregate(Emissions ~ year, subNEISCC, sum)

# plotting
png("plot4.png")
g <- ggplot(aggregateYear, aes(factor(year), Emissions))
g <- g + geom_bar(stat="identity") +
  xlab("year") +
  ylab("Total PM'[2.5]*' Emissions") +
  ggtitle("Total Emissions from coal sources from 1999 to 2008")
print(g)
dev.off()