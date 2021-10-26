global_data <- read.csv(file = "D:\\Documents\\données\\tennis.csv", sep=",")

library(stringr)
library(ggplot2)

color <- brewer.pal(5,'YlOrRd')
color[1] <- '#f2f0f0'

# Restricting to the matches in 3 sets
data_3 <- subset(global_data, best_of == 3 & nchar(score) > 10)

#number of winners who has won the first set
sum_1 <- 0
list_1 <- list()
for (s in data_3$score) {
  char1 <- substr(s,1,1)
  char3 <- substr(s,3,3)
  if (char1 != "W" & as.numeric(char1) >= 6  & as.numeric(char3) != 7) {
    sum_1 <-sum_1+1
    list_1 <- c(list_1, as.numeric(char1)-as.numeric(char3))
  }
}

#number of winners who has won the second set
sum_2 <- 0
list_2 <- list()
for (s in data_3$score) {
  char1 <- substr(s,1,1)
  #case if no tie break
  if (substr(s,4,4) == " ") {
    char5 <- substr(s,5,5)
    char7 <- substr(s,7,7)
    if (char1 != "W" & char5 != "R" & as.numeric(char5) >= 6  & as.numeric(char7) != 7) {
      sum_2 <-sum_2+1
      list_2 <- c(list_2, as.numeric(char5)-as.numeric(char7))
    }
  }
  #case with tie break
  if (substr(s,4,4) == "(") {
    char8 <- substr(s,8,8)
    char10 <- substr(s,10,10)  
    if (char1 != "W" & char8 != "R" & char8 != " " & as.numeric(char8) >= 6  & as.numeric(char10) != 7) {
      sum_2 <-sum_2+1
      list_2 <- c(list_2, as.numeric(char8)-as.numeric(char10))
    }
  }
}

#small correction to omit matches with 2 sets on 2 tie break (lenght(score)>10 then...)

n = length(data_3$score)
tot = sum_1+sum_2
erreur = (tot-1-n)/2

sum_1 = sum_1-erreur
sum_2 = sum_2-erreur

#empirical probability to win set 1 :
prob_emp = sum_1/(sum_1+sum_2)

#pie chart
df <- data.frame(
  group = c("Win set 1", "Win set 2"),
  value = c(sum_1, sum_2)
)
head(df)


bp<- ggplot(df, aes(x="", y=value, fill=group))+
  geom_bar(width = 1, stat = "identity")

pie <- bp + coord_polar("y", start=0)
pie + scale_fill_manual(values=c(color[2], color[3]))
pie

# null hypothesis : X= indicator(winning set 1)=1-indicator(winning set2) follows a bernouilli(1/2) law

proba=5 #seuil de confiance
proba = (100-proba/2)/100
quantile = qnorm(proba)
interv = quantile * sqrt(1/n)/2
interval = c(0.5-interv,0.5+interv)

interval

#prob_emp does not belong to the confidence interval

qnorm(0.975)

