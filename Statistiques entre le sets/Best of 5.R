global_data <- read.csv(file = "D:\\Documents\\données\\tennis.csv", sep=",")

library(stringr)
library(ggplot2)

data_5 <- subset(global_data, best_of == 5)

##best of 3

#number of winner who has won the first set
sum_1 <- 0
list_1 <- list()
for (s in data_5$score) {
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
for (s in data_5$score) {
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
    print(s)
    if (char1 != "W" & char8 != "R" & char8 != " " & as.numeric(char8) >= 6  & as.numeric(char10) != 7) {
      sum_2 <-sum_2+1
      list_2 <- c(list_2, as.numeric(char8)-as.numeric(char10))
    }
  }
}
  
print(sum_1)
print(sum_2)
list_1 <- unlist(list_1, use.names = FALSE)
list_2 <- unlist(list_2, use.names = FALSE)
hist(list_1, xlab="écart de jeu quand le gagnant a marqué le 1er set")
hist(list_2, xlab="écart de jeu quand le gagnant a marqué le 2eme set")


