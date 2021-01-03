library(tidyverse)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

Annual <- NEI %>%
        group_by(year) %>%
        summarise(total = sum(Emissions) / 1000)

png(filename = "plot1.png")

barplot(Annual$total, 
        names.arg = c("1999", "2002", "2005", "2008"),
        ylab = "1000 tons PM2.5",
        main = "Total amount of PM2.5 emitted per year",
        sub = "Source: Environmental Protection Agency")

dev.off()