library(qqplotr)
library(ggplot2)

#Number of match categories
categories <- as.factor(atp_matches_2019$tourney_level)
str(categories)
count_categorie <-summary(categories)
count_categorie

#Visualization with pie chart 
dataframe1 <- data_frame(categories=c("A","D","F","G","M"),counts = count_categorie)
ggplot(dataframe1,aes(x="",y=count_categorie,fill=categories)) + geom_bar(width=1,stat="identity") + coord_polar("y",start=0) +scale_fill_brewer(palette="Blues") + theme_minimal()

#Number of tournaments
tournaments <- as.factor(atp_matches_2019$tourney_name)
count_tournaments <- summary(tournaments)
count_tournaments

#Number of players
players <- c(atp_matches_2019$winner_name,atp_matches_2019$loser_name)
players <- as.factor(players)
str(players)
#Number of players = 264

#Vectors with all the winners
players_winner <- atp_matches_2019$winner_name
newplayers <- unique(players[1:2781])
newplayers
#Number of different winners = 364

#Number of height which are different
height <- atp_matches_2019$winner_ht
newheight <- unique(height[1:2781])
newheight

#Vector of height for the winner without the NA values and without the replication of the height of the same winner
index <- duplicated(players_winner)
for (k in 1:2781) {
  if ( index[k] == "TRUE")  {
    height[k]<- 0
    }
}
y <- height[height != 0]
y <- na.omit(y)

#QQ-plots and boxplot for the height for the winners
par(pty="s",cex = 0.3)
ggplot(mapping = aes(sample= y)) + stat_qq_band() + stat_qq_line() + stat_qq_point() + labs(x="Theoretical Quantities", y = "Sample Quantiles")+theme_classic() + theme(aspect.ratio = 1)
dat1 <- data.frame(1:154,y)
ggplot(dat1,aes(x=dat1$X1.241,y=y)) + geom_boxplot()

##Vector of age for the winner without the NA values and without the replication of the age of the same winner
age <- atp_matches_2019$winner_age
for (k in 1:2781) {
  if ( index[k] == "TRUE")  {
    age[k]<- 0
  }
}
finage <- age[ age!= 0]
finage <- na.omit(finage)

#QQ-plot for the age (for winner)
par(pty="s",cex = 0.3)
ggplot(mapping = aes(sample= finage)) + stat_qq_band() + stat_qq_line() + stat_qq_point() + labs(x="Theoretical Quantities", y = "Sample Quantiles")+theme_classic() + theme(aspect.ratio = 1)
dat2 <- data.frame(1:241,finage)
ggplot(dat2,aes(x=dat2$X1.241,y=dat2$finage)) + geom_boxplot()

#Number of 3 sets and 5 sets
set <- as.factor(atp_matches_2019$best_of)
set <- set[!is.na(set)]
str(set)
count_set <- summary(set)
count_set
# There are 2273 matches in 3 sets and 508 matches in 5 sets

# Mean duration for matches in 3 sets
mean1 = 0
dist <- rep(0,2675)
min_match <- atp_matches_2019$minutes[-which(is.na(atp_matches_2019$minutes))]
for (k in 1:2675) {
  if (set[k] == 3) {
    mean1 = mean1 + min_match[k]
    dist[k] = min_match[k]
  }
}
mean1 <- mean1/2273
mean1

#Box plot for the duration for matches in 3 sets
distfin <- dist[dist != 0]
dat4 <- data.frame(1:2167,distfin)
ggplot(dat4,aes(x=dat4$X1.2167,y= dat4$distfin)) + geom_boxplot()

#Mean duration for matches in 5 sets
mean2 = 0
dist2 = rep(0,2675)
for (k in 1:2675) {
  if (set[k] == 5) {
    mean2 = mean2 + min_match[k] 
    dist2[k] = min_match[k]
    }
}
mean2 <- mean2/508
mean2

#Box plot for the duration for matches in 5 sets
dist2fin <- dist2[dist2 != 0]
dat5 <- data.frame(1:508,dist2fin)
ggplot(dat5,aes(x=dat5$X1.508,y= dat5$dist2fin)) + geom_boxplot()

#Best players depending on rank ATP 
library(dplyr,warn.conflicts = FALSE)
dat6 <- data.frame(atp_matches_2019$winner_name,atp_matches_2019$tourney_name,atp_matches_2019$winner_rank,atp_matches_2019$winner_ht)
new <- dat6 %>% filter(dat6$atp_matches_2019.winner_rank < 10) 
str(as.factor(new$atp_matches_2019.winner_name))
summary(as.factor(new$atp_matches_2019.winner_name))

