tennis2021 <- read.csv("C:/Users/ilanp/Documents/EPFL/Mathématiques/MA master sem 3 automne 2021/Statistical Computation and Visualization/atp_matches_2021.csv")
tennis2019 <- read.csv("C:/Users/ilanp/Documents/EPFL/Mathématiques/MA master sem 3 automne 2021/Statistical Computation and Visualization/tennis_atp-master/atp_matches_2019.csv")

winnerFacedBreakPoint <- tennis2019$w_bpFaced
winnerSavedBreakPoint <- tennis2019$w_bpSaved
winnerRatioSavedBreakPoint <- winnerSavedBreakPoint / winnerFacedBreakPoint
