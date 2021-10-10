library(dplyr)

atp_matches_2019 <- read_csv("~/Downloads/tennis_atp-master/atp_matches_2019.csv")

for (i in 1:2782) {
  if (atp_matches_2019$winner_hand[i] == "L") atp_matches_2019$winner_hand[i] = 1
  else atp_matches_2019$winner_hand[i] = 0
}
atp_matches_2019$winner_hand <- as.numeric(atp_matches_2019$winner_hand)  

for (j in 1:2782) {
  if (atp_matches_2019$loser_hand[j] == "L") atp_matches_2019$loser_hand[j] = 1
  else atp_matches_2019$loser_hand[j] = 0
}
atp_matches_2019$loser_hand <- as.numeric(atp_matches_2019$loser_hand) 

#Probability of left hander in the all the winners
p1 <- sum(atp_matches_2019$winner_hand)/(2781 - sum(is.na(atp_matches_2019$winner_hand)))

#Pie chart for winner
fram <- data.frame(Hander=c("Left-hander","Right-hander"), value= c(p1, 1-p1))
bp1 <- ggplot(fram,aes(x="",y=value,fill=Hander,col=NULL)) + geom_bar(width=1,stat="identity")
bp1 

pie1 <- bp1 + coord_polar("y",start = 0)
pie1 + scale_fill_grey() + theme_minimal()

#Probability of left hander in all the losers
p2 <- sum(atp_matches_2019$loser_hand,na.rm=TRUE)/(2781 - sum(is.na(atp_matches_2019$loser_hand)))

#Pie chart for loser
gram <- data.frame(Hander=c("Left-hander","Right-hander"), value= c(p2, 1-p2))
bp2 <- ggplot(gram,aes(x="",y=value,fill=Hander)) + geom_bar(width=1,stat="identity")
bp2 

pie2 <- bp2 + coord_polar("y",start = 0)
pie2 + scale_fill_grey() + theme_minimal()

#Empirical average of height for winner
atp_matches_2019$winner_ht <- as.numeric(atp_matches_2019$winner_ht) 
sum(atp_matches_2019$winner_ht, na.rm = TRUE)/(2781-sum(is.na(atp_matches_2019$winner_ht)))

#Histogram of hight for winner
qplot(atp_matches_2019$winner_ht,geom="histogram",binwidth=2,main="Histogram for Height",xlab="Height of the winners",col=I("grey"))

#Empirical average of height for loser
atp_matches_2019$loser_ht <- as.numeric(atp_matches_2019$loser_ht) 
sum(atp_matches_2019$loser_ht,na.rm=TRUE)/(2781 - sum(is.na(atp_matches_2019$loser_ht)))
qplot(atp_matches_2019$loser_ht,geom="histogram",binwidth=2,main="Histogram for Height",xlab="Height of the losers",col=I("grey"))

#Nationality: 
winnat<- as.factor(atp_matches_2019$winner_ioc)
losnat <- as.factor(atp_matches_2019$loser_ioc)


natiowinner <- ggplot(data.frame(winnat), aes(x=winnat))+geom_bar() + theme(axis.text.x = element_text(face="plain",size=8,angle=90)) + ggtitle("Histogram of nationaliies for winner")+ xlab("Nationality") + ylab("number of individuals")
natiowinner

natioloser <- ggplot(data.frame(losnat), aes(x=losnat))+geom_bar() + theme(axis.text.x = element_text(face="plain",size=8,angle=90)) + ggtitle("Histogram of nationalities for losers")+ xlab("Nationality") + ylab("number of individuals") 
natioloser

#Mean of rank points for winners and losers
sum(atp_matches_2019$loser_rank_points,na.rm=TRUE)/(2781 - sum(is.na(atp_matches_2019$loser_rank_points)))
sum(atp_matches_2019$winner_rank_points,na.rm=TRUE)/(2781 - sum(is.na(atp_matches_2019$winner_rank_points)))

#Plot rank against rank points for losers
rkvspl <- data.frame(atp_matches_2019$loser_rank_points,atp_matches_2019$loser_rank)
ggplot(data=rkvspl) + geom_point(data=rkvspl,aes(atp_matches_2019.loser_rank_points,atp_matches_2019.loser_rank),size=0.1)

#Plot rank against rank points for winners
rkvspw <- data.frame(atp_matches_2019$winner_rank_points,atp_matches_2019$winner_rank)
ggplot(data=rkvspw) + geom_point(data=rkvspw,aes(atp_matches_2019.winner_rank_points,atp_matches_2019.winner_rank),size=0.1,col="red")

