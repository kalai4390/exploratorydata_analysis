# READING DATA FROM BOTH FILES
NEIdata <- readRDS("summarySCC_PM25.rds")
SCCdata <- readRDS("Source_Classification_Code.rds")

# subsetting batlimore data

baltimore <- NEIdata[NEIdata$fips=="24510", ]
#aggregation 

baltem <- aggregate(Emissions ~ year+ type, baltimore, sum)
#plotting
png("plot3.png")
plot <- ggplot(baltem, aes(year, Emissions, color = type))
plot <- plot + geom_line() +xlab("year") +ylab("Total Emissions") +
  ggtitle('Total Baltimore Emissions by type from 1999 to 2008')
print(plot)
dev.off()