global_data <- read.csv(file = "D:\\Documents\\données\\tennis.csv", sep=",")

library(stringr)
library(ggplot2)
library(RColorBrewer)

#color settings
color <- brewer.pal(5,'YlOrRd')
display.brewer.pal(5, 'YlOrRd')
color[1] <- '#f2f0f0'


data_3 <- subset(global_data, best_of == 3)

#number of winner who has won the first set
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

#number of winner who has won the second set
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

c(sum_1, sum_2)

#pie chart:

survey <- c(set_1=sum_1, set_2=sum_2)
pct <- round(survey/sum(survey)*100)		# calculate percentages
lbls <- paste(names(survey), pct, "%")	# add percents to labels
pie(survey,
    col=c(color[2], color[3]),
    labels=lbls)
pie

df <- data.frame(
  group = c("Set 1", "Set 2"),
  value = c(sum_1, sum_2)
)
head(df)

bp<- ggplot(df, aes(x="", y=value, fill=group))+
  geom_bar(width = 1, stat = "identity")

pie <- bp + coord_polar("y", start=0)
pie + scale_fill_manual(values=c(color[2], color[3]))
pie

#computing the histograms and the sum

hist1 <- c(sum(list_1==1),sum(list_1==2), sum(list_1==3),sum(list_1==4),sum(list_1==5), sum(list_1==6) )
hist2 <- c(sum(list_2==1),sum(list_2==2), sum(list_2==3),sum(list_2==4),sum(list_2==5), sum(list_2==6) )

hist1
hist2

ecart <- c(1,2,3,4,5,6)
n = length(data_3$score)
moy1 <- (hist1%*%ecart)/sum_1
moy2 <- (hist2%*%ecart)/sum_2

somme = c((hist1%*%ecart), hist2%*%ecart)

moyennes = c(moy1,moy2)
moyennes

moy1 = c(moy1, moy1, moy1, moy1, moy1, moy1)
moy2 = c(moy2, moy2, moy2, moy2, moy2, moy2)
s1 = (hist1%*%(ecart-moy1)**2)/(sum_1-1)
s2 = (hist2%*%(ecart-moy2)**2)/(sum_2-2)


# computation of the confidence interval
int.ech = function(s, n ,proba=5) {
  ddl = n - 1
  proba = (100-proba/2)/100
  t_student = qt(proba, ddl)
  intervalle = t_student * sqrt(s/n)
  return(intervalle)
}

int.ech(s1, sum_1, 5)
int.ech(s2, sum_2, 5)

int = c(int.ech(s1, sum_1, 5), int.ech(s2, sum_2, 5))


bp = barplot(moyennes,  beside=T,
             col=c(color[2], color[3]), ylim=c(0,2.8))
box()

# Adding the confidence interval
arrows(bp,moyennes-int,bp, moyennes+int, lwd=1.5, angle=90,length=0.8,code=3, col = "red")

bp

# gap of games in set 1 or 2

list_1 <- unlist(list_1, use.names = FALSE)
list_1 <- as.data.frame(list_1)


ggplot(data=list_1, aes(list_1)) + 
  geom_histogram(breaks=seq(0, 6, by=0.5), fill=color[2]) +
  labs(y="Count")

list_2 <- unlist(list_2, use.names = FALSE)
list_2 <- as.data.frame(list_2)

ggplot(data=list_2, aes(list_2)) + 
  geom_histogram(breaks=seq(0, 6, by=0.5), fill=color[3]) +
  labs(y="Count")

# Pie chart



