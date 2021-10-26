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
├── Left_RightHanded and performance.R			#Clarisse Schumer
└── Statistiques entre le sets					#Paul Bagourd
	├── Best of 3 - statistics of the first two sets.R
	├── Best of 5.R
	└── Statistiques entre les sets.R
└── Presentation of the data                                     #Clarisse Schumer 


=========================================================

Update on the tasks:

	-Raphaël Mirallié
Work can be found in the folder ‘Maps’. The goal here is to produce a map of the world with both the number of tennis players per country and the number of tourney per country.
First we had to extract the wanted number from the raw data and write in down in the files ‘list_country.csv’ and ‘list_tourney.csv’. 
Then, after discovering the package tmap, the desired numbers were added to the ‘World’ sf data frame. A first plot was produced, but work still need to be done to get better visual result.

	-Marie Abadie 
Week 4 october: Create report, introduction + context + formulate the problematic. 
Then I start to study the link between height and performance : creation of an indicator of performance for the players in 2019 and study of the correlation between height and performance. Also start to study the link between age and performance. 
NEXT STEP: since no correlation apparently between age and height and performance try to be more precise. Focus on the link betweeen height and the performance in a particular aspect of the game (the serve) + try to study the matthew effect (more birth in the beggining of the year) for the age.
Week 11 october: Rewrite indicator of performance (because prblm with R) and pursur the study of the importance of the heigh to have a serve performante. 
I define different characteristics to evaluate the performance of the serve (perc of aces, double faut, winning points after 1st and 2nd serve etc). 
Then I study the correlation of these characteristics with the height and the indicator of performance. 
Mke histogram and boxplot to visualize the data-landscape around the notion of serve. 
NEXT STEP: analysis and write properly in the report.

	-Ilan Perez

	-Paul Bagourd
I am investigating for the way winners behave across the match in terms of their performances at winning sets and games. I first searched for eventual differences between set 1 or 2, for "best of 3" matches. 
I conclude that no set appears more determining than the other in order to win the match, but the way the winner win set 1 or 2 is in some ways quite intriging. For example the score they obtain considering set 1 or 2. 
This could help me to reveal some features of the winners psychology and how they react during the match. 

	-Clarisse Schumer
During week 4, I have worked on the presentation of the data. I asked mysel what where the important information in the variables, and how and how I could present them using plots to introduce our analysis. Indeed, in our data set we have 49 columns representinf different informations. Which one are the most relevant for our problematic ? 
I have chosen to study the number of match in each different categories and to visualize it with a pie chart. For me it was also relevant to find the number of tournaments, the number of players, and to study with QQplot and box plot the distribution of the height and the age of all the winners and the losers to see if we can observe a relevant marker. Finally, the two other important aspect were the duration of the match for a 3-set and a 5-set match. All these points seemed to me important to study in order to present the data. 
To conclude the presentation of the data, I have selected the top ten players in the ATP rank and studied their characteristics. You can find this in the file presentation of data. 
