library(tidyverse)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# coal combustion as fuel
fuel_comb <- str_which(SCC$EI.Sector, "Fuel Comb") # 530 obs
coal_used <- str_which(SCC$EI.Sector, "Coal$") # 99 obs

fuel <- intersect(fuel_comb, coal_used)

# ships - combusting coal to power ships (not included above)
# assuming there are no coal-powered airplanes, locomotives, or road vehicles 
vessels <- str_which(SCC$EI.Sector, "Vessels") # 44 obs
coal_powered <- str_which(SCC$SCC.Level.Three, "Coal") # 172 obs
ships <- intersect(vessels, coal_powered) # 5 obs

coal <- union(fuel, vessels) # 143 obs

x <- SCC[coal,1]

coal_combustion <- NEI %>%
        filter(SCC %in% x) %>%
        group_by(year) %>%
        summarise(total = sum(Emissions) / 1000)

#png(filename = "plot4.png", width = 720)

barplot(coal_combustion$total, 
        names.arg = c("1999", "2002", "2005", "2008"),
        ylab = "1000 tons PM2.5",
        main = "Total amount of PM2.5 emitted from coal combustion-related sources per year",
        sub = "Source: Environmental Protection Agency")

# dev.off()