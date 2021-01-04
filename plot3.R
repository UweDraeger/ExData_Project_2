library(tidyverse)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

balt2 <- NEI %>% 
        filter(fips == "24510") %>%
        group_by(year, type) %>% 
        summarise(total = sum(Emissions))

png(filename = "plot3.png")

ggplot(balt2, aes(year, total)) +
        geom_point() +
        facet_grid(rows = vars(type)) + 

dev.off()