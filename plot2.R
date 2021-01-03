library(tidyverse)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

balt <- NEI %>%
        filter(fips == "24510") %>%
        group_by(year) %>%
        summarise(total = sum(Emissions))

png(filename = "plot2.png")

barplot(balt$total, 
        names.arg = c("1999", "2002", "2005", "2008"),
        ylab = "tons PM2.5",
        main = "Baltimore City: Total amount of PM2.5 emitted per year",
        sub = "Source: Environmental Protection Agency")

dev.off()