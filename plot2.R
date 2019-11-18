# READING DATA FROM BOTH FILES
NEIdata <- readRDS("summarySCC_PM25.rds")
SCCdata <- readRDS("Source_Classification_Code.rds")

# subsetting batlimore data

baltimore <- NEIdata[NEIdata$fips=="24510", ]

#aggregating emissions of baltimore
baltemissions <- aggregate(Emissions ~ year, baltimore, sum)

#plotting the emissions of baltimore

png(filename='plot2.png')
cols <- c("red", "blue", "green", "magenta")
barplot(height=baltemissions$Emissions/1000, names.arg=baltemissions$year, xlab="Year", ylab="Aggregated Emission",main=expression('Baltimore Aggregated PM'[2.5]*' Emmissions by Year'), col = cols)
dev.off()