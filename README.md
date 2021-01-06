# ExData_Project_2

Question 1: 
Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 

Answer:
The barplot seems to indicate a decrease of PM2.5 emitted each year.
However, this does not match what is reported on the official NEI site (https://gispub.epa.gov/neireport/2014/) where an increase is reported for 2008 vs. 2005.


Question 2:
Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? 

Answer:
The barplot indicates an overall decrease between 1999 and 2008. There is no clear trend and chances are the overall downward trend is not real.


Question 3:
Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City? Which have seen increases in emissions from 1999-2008? 

Answer:
Decreasing emissions of PM2.5 were recorded for "NON-ROAD", "NONPOINT", and "ON-ROAD" source types. Source type "POINT" saw an increase from 1999 to 2002 and from 2002 to 2005 while the emission level in 2008 fell to an amount only slightly larger than in 1999. 

Question 4:
Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008?

Answer:
While there were only small changes between 1999 and 2005, the 2008 records show a significant drop in PM2.5 emitted by coal combustion.


Question 5:
How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?

Answer:
A choice was made to limit the analysis to road-bound vehicles as they might constitute the most relevant emission source in a city.
There was a big drop in PM2.5 emitted by these road-bound motor vehicles in Baltimore from 1999 to 2002. 
Almost no decrease was measured in 2005 with some more decrease in 2008.


Question 6:
Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (fips == "06037"). Which city has seen greater changes over time in motor vehicle emissions?

Answer:
Baltimore has seen a steady decline in PM2.5 emission over the years. In relative terms changes were greater than in LA. Los Angeles has seen more volatile emissions in absolute terms, less so in relative terms. 