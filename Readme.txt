The question we ask ourselves is :
Considering tennis games, is there a caracteristic shared by the winning players ? In other words, can one find patterns in the players and game informations ? For example, is the winner significantly taller than the loser ? Or is the number of breking point saved an important feature to win the game ? Or is there a corellation between the height of a player and the number of aces he perfomed ? 

To study that question, we will use a data set containg caracteristics of more than 2000 tennis games played in 2019 in master level tournaments. The datas can be found in our github project.

The team members are :
Member 1: Raphaël Mirallié (miralllius)
Member 2: Marie Abadie ()
Member 3: Ilan Perez (Saxofriend)
Member 4: Paul Bagourd (Paulbagourd)
Member 5: Clarisse Schumer (clashumer)

=========================================================

This repository has the following structure:
.
├── atp_matches_2019.csv 					
├── Breakpoint.R         					#Ilan Perez
├── Heigt_Age_and_Performance					#Marie Abadie
├── Maps      							#Raphaël Mirallié
|    ├──list_country.csv
|    ├──list_tourney.csv
|    ├── maps_RM.R 
|    └── pictures
|    	    └── …
├── Name of the members.txt
├── Overleaf Report.txt
├── Physical characteristics and ATP score.R			#Clarisse Schumer
└── Statistiques entre le sets					#Paul Bagourd
	├── Best of 3 - statistics of the first two sets.R
	├── Best of 5.R
	└── Statistiques entre les sets.R

=========================================================

Update on the tasks:

	-Raphaël Mirallié
Work can be found in the folder ‘Maps’. The goal here is to produce a map of the world with both the number of tennis players per country and the number of tourney per country.
First we had to extract the wanted number from the raw data and write in down in the files ‘list_country.csv’ and ‘list_tourney.csv’. Then, after discovering the package tmap, the desired numbers were added to the ‘World’ sf data frame. A first plot was produced, but work still need to be done to get better visual result.
	-Marie Abadie
	-Ilan Perez
	-Paul Bagourd
	-Clarisse Schumer
			