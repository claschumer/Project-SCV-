#To be able to run this file, you only need to change the value of path in the 
#section 'Load the data' to the path to the git on your computer

library(data.table)
library(tmaptools)
library(sf)
library(raster)
library(dplyr)
library(spData)
#library(spDataLarge) not available for R version 3.6.3
library(Rcpp)
library(tmap)    # for static and interactive maps
library(leaflet) # for interactive maps
library(ggplot2) # tidyverse data visualization package
library(RColorBrewer)

#Delete existing environment
rm(list = ls())

# Load the data ==================================================
path <- '~/Documents/GitHub/Project-SCV-'
data_path <- paste(path,'/atp_matches_2019.csv',sep='')
data <- read.csv(data_path)
atp_matches_2019 <- as.data.table(data)

# Get an idea of the data set
head(atp_matches_2019)

# Nationality map ==================================================
    
    # List countries ------------------------------------------------
    
        #First we add all of the winners and the losers (with their country) 
        #in a data frame 'list_players' for every single match
winner <- atp_matches_2019[,c('winner_name','winner_ioc')]
loser <- atp_matches_2019[,c('loser_name','loser_ioc')]
colnames(loser) <- c('winner_name','winner_ioc')
list_all_matches <- rbind(winner,loser)
        
        #Now we keep only the first occurrence of each player
list_players <- list_all_matches[match(unique(winner_name),winner_name),]

        #We sum up (for each country) where each player come from
list_country <- list_players[, table(winner_ioc)]

        #To be able to use the tmp package and the data 'World', we need to 
        #convert list_country (who is using the CIO country code) into usable 
        #data. This was done manually since the list of country in the data 
        #'World' does not correspond to anything useful found on the web (at 
        #least in a reasonable amount of time)
        #The following code was used to help:
        #country <- World[,c('iso_a3','name')]
        #country <- st_drop_geometry(country)
        #write.csv(country,'~/Desktop/country', row.names = FALSE)

data_path_country <- paste(path,'/Maps/list_pays.csv',sep='')
data_country <- read.csv(data_path_country,header=FALSE)
number_country <- as.data.frame(data_country)
colnames(number_country) <- c('tennis_player')

        #Adding the number of tennis player per country to the data 'World'
data(World)
tennis_world <- cbind(World,number_country$tennis_player)
tennis_world <- tennis_world[-c(7,8),] #Remove Antarctica from the map

    # Plot ------------------------------------------------
        
        #Plot of the map, two different options, bubbles or colors

            #Bubbles

map <- (tm_shape(tennis_world) + tm_polygons() 
            + tm_bubbles(size = "number_country.tennis_player", col = "red"))
        
            #Colors

                #Choice of palette, force 0 to be white to contrast
color <- brewer.pal(5,'YlOrRd')
color[1] <- '#f2f0f0'

                #Create the map, the default sequence for the legend is actually 
                #a good representation of the number of players from different 
                #countries
map <- tm_shape(tennis_world) + tm_polygons('number_country.tennis_player',
                                            title = 'Number of tennis player',
                                            legend.reverse=TRUE,
                                            palette = color) 

map

# Next step ==================================================

