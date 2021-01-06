library(tidyverse)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


# "motor vehicle sources" is interpreted as vehicles driving on roads
# excludes ships, aircraft, rail-bound vehicles, as well as any vehicles
# driving off road
mobile <- str_which(SCC$EI.Sector, "Mobile - On-Road") # 1138 obs

x <- SCC[mobile,1]


motor_vehicles_balt <- NEI %>%
        filter(SCC %in% x) %>%
        filter(fips == "24510") %>%
        group_by(year) %>%
        summarise(total = sum(Emissions))

motor_vehicles_la <- NEI %>%
        filter(SCC %in% x) %>%
        filter(fips == "06037") %>%
        group_by(year) %>%
        summarise(total = sum(Emissions))

la_label <- motor_vehicles_la %>%
        summarise(
                year = max(year),
                total = max(total),
                label = "Los Angeles"
        )

balt_label <- motor_vehicles_balt %>%
        summarise(
                year = max(year),
                total = max(total),
                label = "Baltimore"
        )

png(filename = "plot6.png", width = 720)

ggplot() + 
        
        geom_point(data = motor_vehicles_balt, 
                   aes(year, total), 
                   color = "red",
                   size = 3) +
        geom_smooth(data = motor_vehicles_balt, 
                    aes(year, total), 
                    color = "red",
                    method = "lm",
                    se = FALSE) +
        geom_text(data = balt_label, 
                  aes(year, total, label = label),
                  vjust = "top",
                  hjust = "right",
                  color = "red") +
        
        geom_point(data = motor_vehicles_la, 
                   aes(year, total), 
                   color = "blue",
                   size = 3) +
        geom_smooth(data = motor_vehicles_la, 
                    aes(year, total), 
                    color = "blue",
                    method = "lm",
                    se = FALSE) +
        geom_text(data = la_label, 
                  aes(year, total, label = label),
                  vjust = "top",
                  hjust = "right",
                  color = "blue") +
        
        labs(title = "PM2.5 Emissions in Baltimore and Los Angeles - in tons",
             subtitle = "Strong decrease in Baltimore, Increase in Los Angeles",
             caption = "Source: Environmental Protection Agency")

dev.off()