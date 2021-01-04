library(tidyverse)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

coal1 <- str_which(SCC$EI.Sector, "Coal|coal") # 99 obs
coal2 <- str_which(SCC$Short.Name, "Coal|coal") # 239 obs

coal <- union(coal1, coal2) #251 obs

x <- SCC[coal,1]

coal_combustion <- NEI %>%
        filter(SCC %in% x) %>%
        group_by(year) %>%
        summarise(total = sum(Emissions) / 1000)

png(filename = "plot4.png", width = 720)

barplot(coal_combustion$total, 
        names.arg = c("1999", "2002", "2005", "2008"),
        ylab = "1000 tons PM2.5",
        main = "Total amount of PM2.5 emitted from coal combustion-related sources per year",
        sub = "Source: Environmental Protection Agency")

dev.off()