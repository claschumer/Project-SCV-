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
Week 4 october: Create report, introduction + context + formulate the problematic. Then I start to study the link between height and performance : creation of an indicator of performance for the players in 2019 and study of the correlation between height and performance. Also start to study the link between age and performance. NEXT STEP: since no correlation apparently between age and height and performance try to be more precise. Focus on the link betweeen height and the performance in a particular aspect of the game (the serve) + try to study the matthew effect (more birth in the beggining of the year) for the age.
Week 11 october: Rewrite indicator of performance (because prblm with R) and pursur the study of the importance of the heigh to have a serve performante. I define different characteristics to evaluate the performance of the serve (perc of aces, double faut, winning points after 1st and 2nd serve etc). Then I study the correlation of these characteristics with the height and the indicator of performance. Mke histogram and boxplot to visualize the data-landscape around the notion of serve. NEXT STEP: analysis and write properly in the report.
	-Ilan Perez
	-Paul Bagourd
	-Clarisse Schumer
			
