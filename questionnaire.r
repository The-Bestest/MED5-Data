library(ggplot2)
library(tidyverse)

questionnaire <- as_tibble(read.csv(file.path("./","questionnaire.csv")))

lvl1 <- questionnaire %>% filter(Level == "lvl1")
lvl2 <- questionnaire %>% filter(Level == "lvl2")

quick_stats <- function(level1, level2) {
    lvl1q <- quantile(level1)
    lvl2q <- quantile(level2)

    t <- matrix(
        c(mean(level1), median(level1), sd(level1), paste(lvl1q[1], lvl1q[2], lvl1q[3], lvl1q[4], sep=";"),
        mean(level2), median(level2), sd(level2), paste(lvl2q[1], lvl2q[2], lvl2q[3], lvl2q[4], sep=";")
    ),ncol=4,byrow=TRUE)
    
    colnames(t) <- c("Mean","Median","SD", "Quantiles")
    rownames(t) <- c("Body","Blocks")

    as.table(t)
}

soa <- quick_stats(lvl1$SoA, lvl2$SoA)
soo <- quick_stats(lvl1$SoO, lvl2$SoO)
proprioception <- quick_stats(lvl1$Proprioception, lvl2$Proprioception)
frustration <- quick_stats(lvl1$Frustration, lvl2$Frustration)

message("SoA")
soa
cat("\n")

message("SoO")
soo
cat("\n")

message("Proprioception")
proprioception
cat("\n")

message("Frustration")
frustration
cat("\n")