library(dplyr)

atp_matches_2019 <- read_csv("~/Downloads/tennis_atp-master/atp_matches_2019.csv")

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
left_winners <- list_winners[which(list_winners$atp_matches_2019.winner_hand == "L"),]
right_winners <- list_winners[which(list_winners$atp_matches_2019.winner_hand == "R"),]
left_losers <- list_losers[which(list_losers$atp_matches_2019.loser_hand == "L"),]
right_losers <- list_losers[which(list_losers$atp_matches_2019.loser_hand == "R"),]

#Left Hander 
ordered <- sort(right_winners$atp_matches_2019.winner_name)
ordered2 <- sort(right_losers$atp_matches_2019.loser_name)
x1 <- summary(as.factor(left_winners$atp_matches_2019.winner_name))
x2 <-summary(as.factor(left_losers$atp_matches_2019.loser_name))
x2 <- x2[-c(5,6,7,14,20,22,23,25,28,31)]
x1 <- x1[-22]
performancel <- x1 / (x1 + x2)

#Right Hander 
y1 <- summary(as.factor(right_winners$atp_matches_2019.winner_name))
y2 <- summary(as.factor(right_losers$atp_matches_2019.loser_name))
performancer <- c(58/79,54/79,58/69,49/67,42/67,40/66,42/67,41/65,42/65,37/64,35/64,53/64,33/52,33/53,30/52,27/50,11/18,9/21,28/55,20/47,29/43,13/22,13/31,17/39)

#Box plot
list_performance <- c(performancel,performancer)
playerhander = rep(c("Left-hander","Right-Hander"),c(24,24))
dat2 <- data.frame(playerhander,list_performance)
ggplot(dat2,aes(x=playerhander,y=list_performance,fill=playerhander)) + geom_boxplot() + scale_fill_brewer(palette='YlOrRd') + labs(x="Players-Hander",y="Performance")

ggplot(dat2,aes(x=list_performance,color=playerhander)) + geom_histogram(fill="white") + scale_color_brewer(palette = 'YlOrRd') + labs(x="Performance",y="Counts")







