library(dplyr)
library(qqplotr)
library(ggplot2)
library(RColorBrewer)

atp_matches_2019 <- read.csv("/Users/schumerclarisse/Desktop/Statistical Computation and Visualisation /tennis_atp-master/atp_matches_2019.csv")

#Vectors with all the players
winner <- atp_matches_2019[,c('winner_name','winner_hand','winner_rank')]
loser <- atp_matches_2019[,c('loser_name','loser_hand','loser_rank')]
colnames(loser) <- c('winner_name','winner_hand','winner_rank')
list_all_players <- rbind(winner,loser)

list_players <- list_all_players[match(unique(list_all_players$winner_name),list_all_players$winner_name),]
list_hand <- list_players$winner_hand
list_rank <- list_players$winner_rank

summary(as.factor(list_hand))

list_rank_right <- list_rank[which(list_hand %in% "R")]
list_rank_left <- list_rank[which(list_hand %in% "L")]

#Boxplot
playerhander = rep(c("Left-hander","Right-Hander"),c(35,303))
rank = c(list_rank_left,list_rank_right)
dat1 <- data.frame(playerhander,rank)
ggplot(dat1,aes(x=playerhander,y=rank,fill=playerhander)) + geom_boxplot() + scale_fill_brewer(palette='YlOrRd') + labs(x="Players Hander",y="ATP rank")

#Left_hand against Left_hand
hand <- data.frame(winner$winner_hand,loser$winner_hand)
same_hand <- hand[hand$winner.winner_hand == hand$loser.winner_hand,]
str(which(same_hand$winner.winner_hand == "R"))
different_hand <-hand[hand$winner.winner_hand != hand$loser.winner_hand,]

#Matches won by a right hander 
str(which(different_hand$winner.winner_hand == "R"))

#Matches won by a left hander 
str(which(different_hand$winner.winner_hand == "L"))

#Computation of performance 
left_winners <- winner[which(winner$winner_hand == "L"),]
right_winners <- winner[which(winner$winner_hand == "R"),]
left_losers <- loser[which(loser$winner_hand == "L"),]
right_losers <- loser[which(loser$winner_hand == "R"),]

#Left Hander 
ordered <- sort(right_winners$winner_name)
ordered2 <- sort(right_losers$loser_name)
summary_left_winner <- summary(as.factor(left_winners$winner_name))
summary_left_loser <-summary(as.factor(left_losers$winner_name))
summary_left_loser <- summary_left_loser[-c(5,6,7,14,20,22,23,25,28,31)]
summary_left_winner <- summary_left_winner[-22]
performancel <- summary_left_winner / (summary_left_winner + summary_left_loser)

#Right Hander 
summary_right_winner <- summary(as.factor(right_winners$.winner_name))
summary_right_loser <- summary(as.factor(right_losers$winner_name))
performancer <- c(58/79,54/79,58/69,49/67,42/67,40/66,42/67,41/65,42/65,37/64,35/64,53/64,33/52,33/53,30/52,27/50,11/18,9/21,28/55,20/47,29/43,13/22,13/31,17/39)

#Box plot for the performance of left- and right-handed
list_performance <- c(performancel,performancer)
playerhander2 = rep(c("Left-hander","Right-Hander"),c(24,24))
dat2 <- data.frame(playerhander2,list_performance)
ggplot(dat2,aes(x=playerhander2,y=list_performance,fill=playerhander2)) + geom_boxplot() + scale_fill_brewer(palette='YlOrRd') + labs(x="Players-Hander",y="Performance")

#Histogram for the performance of left- and right-handed
ggplot(dat2,aes(x=list_performance,color=playerhander2,fill=playerhander2)) + geom_histogram(col="#e9ecef",alpha=0.5,position = 'identity') +  scale_fill_manual(values=c("#FECC5C", "#FD8D3C"))+labs(x="Performance",y="Counts") + theme_ipsum() 







