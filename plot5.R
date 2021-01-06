library(tidyverse)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


# "motor vehicle sources" is interpreted as vehicles driving on roads
# excludes ships, aircraft, rail-bound vehicles, as well as any vehicles
# driving off road
mobile <- str_which(SCC$EI.Sector, "Mobile - On-Road") # 1138 obs

x <- SCC[mobile,1]


motor_vehicles <- NEI %>%
        filter(SCC %in% x) %>%
        filter(fips == "24510") %>%
        group_by(year) %>%
        summarise(total = sum(Emissions))

png(filename = "plot5.png", width = 720)

barplot(motor_vehicles$total, 
        names.arg = c("1999", "2002", "2005", "2008"),
        ylab = "tons PM2.5",
        main = "Total amount of PM2.5 emitted from motor vehicles in Baltimore per year",
        sub = "Source: Environmental Protection Agency")

dev.off()