global_data <- read.csv(file = "D:\\Documents\\données\\tennis.csv", sep=",")

library(stringr)
library(ggplot2)

data_3 <- subset(global_data, best_of == 3)

##best of 3

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

#Box plots basiques
p <- ggplot(ToothGrowth, aes(x=dose, y=len)) + 
  geom_boxplot()
p

hist1 <- c(sum(list_1==1),sum(list_1==2), sum(list_1==3),sum(list_1==4),sum(list_1==5), sum(list_1==6) )
hist2 <- c(sum(list_2==1),sum(list_2==2), sum(list_2==3),sum(list_2==4),sum(list_2==5), sum(list_2==6) )

hist1
hist2

ecart <- c(1,2,3,4,5,6)
n = length(data_3$score)
moy1 <- (hist1%*%ecart)/n
moy2 <- (hist2%*%ecart)/n

moyennes = c(moy1,moy2)
moyennes

moy1 = c(moy1, moy1, moy1, moy1, moy1, moy1)
moy2 = c(moy2, moy2, moy2, moy2, moy2, moy2)
s1 = (hist1%*%(ecart-moy1)**2)/(n-1)
s2 = (hist2%*%(ecart-moy2)**2)/(n-1)


int.ech = function(s, n ,proba=5) {
  ddl = n - 1
  proba = (100-proba/2)/100
  t_student = qt(proba, ddl)
  intervalle = t_student * sqrt(s/n)
  return(intervalle)
}

int.ech(s1, n, 5)
int.ech(s2, n, 5)

int = c(int.ech(s1, n, 5), int.ech(s1, n, 5))


bp = barplot(moyennes, xlab="1er et 2eme set",  beside=T,
             col=c("#FFFFAA","#AAFFAA"), ylim=c(0,2.5), main= "écart de jeux entre les sets")
# Encadrer le diagramme

box()

# Ajouter les barres d'erreur
arrows(bp,moyennes-int,bp, moyennes+int, lwd=1.5, angle=90,length=0.8,code=3, col = "red")

bp

#visualisation des écarts de jeu, pour affiner la recherche par la suite...

list_1 <- unlist(list_1, use.names = FALSE)
list_2 <- unlist(list_2, use.names = FALSE)
#hist(list_1, xlab="écart de jeu quand le gagnant a marqué le 1er set")
#hist(list_2, xlab="écart de jeu quand le gagnant a marqué le 2eme set")




