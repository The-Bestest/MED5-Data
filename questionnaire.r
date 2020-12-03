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

full_stats <- function(name, level1, level2) {
    rho <- cor.test(level1, level2, method = "spearman", exact = FALSE)
    w <- wilcox.test(level1, level2, paired = TRUE, exact = FALSE)

    message(name)
    print(quick_stats(level1, level2))
    cat(sprintf("Spearman's rho: %.1f (p=%.5f)\n", rho$statistic, rho$p.value))
    cat(sprintf("Wilcoxon: %.1f (p=%.5f)\n", w$statistic, w$p.value))
    cat("\n")
}

full_stats("SoA", lvl1$SoA, lvl2$SoA)
full_stats("SoO", lvl1$SoO, lvl2$SoO)
full_stats("Proprioception", lvl1$Proprioception, lvl2$Proprioception)
full_stats("Frustration", lvl1$Frustration, lvl2$Frustration)