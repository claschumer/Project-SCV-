# importing the data from 2019
tennis2019 <- read.csv("C:/Users/ilanp/Documents/EPFL/Mathématiques/MA master sem 3 automne 2021/Statistical Computation and Visualization/tennis_atp-master/atp_matches_2019.csv")

# extracting the data corresponding to the breakpoint faced and saved by the winner/loser
winnerFacedBreakPointRaw <- tennis2019$w_bpFaced
winnerSavedBreakPointRaw <- tennis2019$w_bpSaved
loserFacedBreakPointRaw <- tennis2019$l_bpFaced
loserSavedBreakPointRaw <- tennis2019$l_bpSaved

#Cleaning the data of any "NA" line
winnerFacedBreakPointClean <- na.omit(winnerFacedBreakPointRaw)
winnerSavedBreakPointClean <- na.omit(winnerSavedBreakPointRaw)
loserFacedBreakPointClean <- na.omit(loserFacedBreakPointRaw)
loserSavedBreakPointClean <- na.omit(loserSavedBreakPointRaw)

#removing all matches where no breakpoint where faced by the winner/loser
#obtaining the position of no faced breakpoint
index_winner <- vector()
for (i in 1:length(winnerFacedBreakPointClean)) {
  if (winnerFacedBreakPointClean[i] == 0){
    index_winner <- append(index_winner, 0)
  } else {
    index_winner <- append(index_winner, 1)
  }
}
index_loser <- vector()
for (i in 1:length(loserFacedBreakPointClean)) {
  if (loserFacedBreakPointClean[i] == 0){
    index_loser <- append(index_loser, 0)
  } else {
    index_loser <- append(index_loser, 1)
  }
}
#removing the line in our data
winnerFacedBreakPoint <- vector()
winnerSavedBreakPoint <- vector()
loserFacedBreakPoint <- vector()
loserSavedBreakPoint <- vector()
for (i in 1: length(winnerFacedBreakPointClean)){
  if (index_winner[i] != 0){
    winnerFacedBreakPoint <- append(winnerFacedBreakPoint, winnerFacedBreakPointClean[i])
    winnerSavedBreakPoint <- append(winnerSavedBreakPoint, winnerSavedBreakPointClean[i])
  }
}
for (i in 1: length(loserFacedBreakPointClean)){
  if (index_loser[i] != 0){
    loserFacedBreakPoint <- append(loserFacedBreakPoint, loserFacedBreakPointClean[i])
    loserSavedBreakPoint <- append(loserSavedBreakPoint, loserSavedBreakPointClean[i])
  }
}

# calculation of the ratio of saved break point of the winner/loser for each match.
winnerRatioSavedBreakPoint <- winnerSavedBreakPoint / winnerFacedBreakPoint
loserRatioSavedBreakPoint <- loserSavedBreakPoint / loserFacedBreakPoint

# histogram of the winner ratio 
ggplot(data= as.data.frame(winnerRatioSavedBreakPoint), aes(winnerRatioSavedBreakPoint)) + 
  geom_histogram(breaks=seq(0, 1, by=0.1),
                   col = "red",
                   fill = "green",
                   alpha = 1) +
  labs(title = "Histogram for Breaking Point", 
         x = "Ratio of saved breaking point in one match by the Winner", 
         y = "Count") +
  xlim(c(0,1)) +
  ylim(c(0,600))

# histogram of the breakpoint faced by the winner
ggplot(data = as.data.frame(winnerFacedBreakPoint), aes(winnerFacedBreakPoint)) +
  geom_histogram(breaks = seq(-1,30, by=1),
                 col = "red",
                 fill = "green",
                 alpha = 1)
  labs(title = "Histogram for Faced Breaking Point", 
       x = "Number of faced breaking point in one match by the Winner", 
       y = "Count")
  
# histogram of the breakpoint saved by the winner. 
ggplot(data = as.data.frame(winnerSavedBreakPoint), aes(winnerSavedBreakPoint)) +
  geom_histogram(breaks = seq(-1,30, by=1),
                 col = "red",
                 fill = "green",
                 alpha = 1)
  labs(title = "Histogram for Saced Breaking Point", 
        x = "Number of saced breaking point in one match by the Winner", 
        y = "Count")
  
  # histogram of the loser ratio
  ggplot(data= as.data.frame(loserRatioSavedBreakPoint), aes(loserRatioSavedBreakPoint)) + 
    geom_histogram(breaks=seq(0, 1, by=0.1),
                   col = "red",
                   fill = "green",
                   alpha = 1) +
    labs(title = "Histogram for Breaking Point", 
         x = "Ratio of saved breaking point in one match by the loser", 
         y = "Count") +
    xlim(c(0,1)) +
    ylim(c(0,600))
  
  # histogram of the breakpoint faced by the loser
  ggplot(data = as.data.frame(loserFacedBreakPoint), aes(loserFacedBreakPoint)) +
    geom_histogram(breaks = seq(-1,30, by=1),
                   col = "red",
                   fill = "green",
                   alpha = 1)
    labs(title = "Histogram for Faced Breaking Point", 
       x = "Number of faced breaking point in one match by the loser", 
       y = "Count")
  
  # histogram of the breakpoint saved by the loser 
  ggplot(data = as.data.frame(loserSavedBreakPoint), aes(loserSavedBreakPoint)) +
    geom_histogram(breaks = seq(-1,30, by=1),
                   col = "red",
                   fill = "green",
                   alpha = 1)
    labs(title = "Histogram for Saced Breaking Point", 
       x = "Number of saced breaking point in one match by the loser", 
       y = "Count")