# READING DATA FROM BOTH FILES
NEIdata <- readRDS("summarySCC_PM25.rds")
SCCdata <- readRDS("Source_Classification_Code.rds")
# aggregrating the emissions by year
emmissions_year <- aggregate(Emissions ~ year, NEIdata, sum)

#creating plot

png(filename='plot1.png')
cols <- c("red", "blue", "green", "magenta")
barplot(height= emmissions_year$Emissions/1000, names.arg=emmissions_year$year, xlab="Year", ylab="Aggregated Emission",main=expression('Aggregated PM'[2.5]*' Emmissions by Year'), col = cols)
dev.off()