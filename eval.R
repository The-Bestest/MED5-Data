implicit_agency <- read.csv(file.path(,), stringsAsFactors=FALSE)
mood <- read.csv(file.path(,), stringsAsFactors=FALSE)
Questionnaire_lvl1 <- read.csv(file.path(,), stringsAsFactors=FALSE)
Questionnaire_lvl2 <- read.csv(file.path(,), stringsAsFactors=FALSE)


#Function to test for normality using shapiro.test and transform the data.
normality_test <- function(IA1, IA2)
{
  #Test for normality and transform the data if needed.
  shapiro_result <- shapiro.test(IA1)
  if (shapiro_result$p.value < 0.05)
  {
    implicit_agency$IA1 <- znorm(IA1)
  }
  
  #Test second level for normality and transform the data if needed.
  shapiro_result_lvl2 <- shapiro.test(IA2)
  if (shapiro_result_lvl2$p.value < 0.05)
  {
    implicit_agency$IA2 <- znorm(IA2)
  }
  #QQ plots for IA1 and IA2
  QQ1 <- ggplot(implicit_agency, aes(sample = IA1)) +
    stat_qq() +
    stat_qq_line()
  
  QQ2 <- ggplot(implicit_agency, aes(sample = IA2)) +
    stat_qq() +
    stat_qq_line()
}
#function for boxplot containing SoO, XA, Frustration, Proprioception
boxplot <- function(SoO, XA, Frustration, Proprioception, Level)
  {
  plot_SoO <- ggplot(subset(Questionnaire, !is.na(SoO)),aes(x = SoO, y = Level, colour = "#E69F00"))
  + geom_boxplot()
  plot_XA <- ggplot(subset(Questionnaire, !is.na(XA)),aes(x = XA, y = Level, colour = "#56B4E9"))
  + geom_boxplot()
  plot_Frustration <- ggplot(subset(Questionnaire, !is.na(Frustration)),aes(x = Frustration, y = Level, colour = "#009E73"))
  + geom_boxplot()
  plot_Proprioception <- ggplot(subset(Questionnaire, !is.na(Proprioception)),aes(x = Proprioception, y = Level, colour = "#F0E442"))
  + geom_boxplot()
  }

Process_IA <- function()
{
  IA_means <- vector("double", ncol(implicit_agency), nrow(2))
  for (i in seq_along(implicit_agency))
  {
    IA_means[[i]] <- mean(implicit_agency[[i]])
  }
  
  IA_SD <- vector("double", ncol(implicit_agency), nrow(2))
  for (i in seq_along(implicit_agency))
  {
    IA_SD[[i]] <- sd(implicit_agency[[i]])
  }
  
  IA_medians <- vector("double", ncol(implicit_agency), nrow(2))
  for (i in seq_along(implicit_agency))
  {
    IA_medians[[i]] <- median(implicit_agency[[i]])
  }
  
  #perform a t-test to compare the implicit agency between both levels.
  implicit_agency$t_result <- t.test(implicit_agency$IA1, implicit_agency$IA2, paired = TRUE, conf.level=0.95)
}



Process_questionnaire <- function()
{
  lvl1_Q_means <- vector("double", ncol(Questionnaire_lvl1), nrow(2))
  lvl1_Q_SD <- vector("double", ncol(Questionnaire_lvl1), nrow(2))
  lvl1_Q_medians <- vector("double", ncol(Questionnaire_lvl1), nrow(2))
  for (i in seq_along(Questionnaire_lvl1))
  {
    lvl1_Q_means[[i]] <- mean(Questionnaire_lvl1[[i]])
    lvl1_Q_SD[[i]] <- sd(Questionnaire_lvl1[[i]])
    lvl1_Q_medians[[i]] <- median(Questionnaire_lvl1[[i]])
  }
  
  lvl2_Q_means <- vector("double", ncol(Questionnaire_lvl2), nrow(2))
  lvl2_Q_SD <- vector("double", ncol(Questionnaire_lvl2), nrow(2))
  lvl2_Q_medians <- vector("double", ncol(Questionnaire_lvl2), nrow(2))
  for (i in seq_along(Questionnaire_lvl2))
  {
    lvl2_Q_means[[i]] <- mean(Questionnaire_lvl2[[i]])
    lvl2_Q_SD[[i]] <- sd(Questionnaire_lvl2[[i]])
    lvl2_Q_medians[[i]] <- median(Questionnaire_lvl2[[i]])
  }
  
  wilcox_SoO <- wilcox.test(Questionnaire_lvl1$SoO, Questionnaire_lvl2$SoO, paired = TRUE)
  wilcox_proprioception <- wilcox.test(Questionnaire_lvl1$proprioception, Questionnaire_lvl2$proprioception, paired = TRUE)
  wilcox_frustration <- wilcox.test(Questionnaire_lvl1$frustration, Questionnaire_lvl2$frustration, paired = TRUE)
}



correlation <- function()
{
  cor_lvl1 <- vector("double", ncol(Questionnaire_lvl1)*3)
  c <- 1
  for (i in seq_along(Questionnaire_lvl1))
  {
    for (j in seq_along(Questionnaire_lvl1))
    {
      if (i != j)
      {
        cor_lvl1[[c]] <- cor.test(Questionnaire_lvl1[[i]], Questionnaire_lvl1[[j]], method = "pearson")
        c <- c+1
      }
    }
  }
  
  cor_lvl2 <- vector("double", ncol(Questionnaire_lvl1)*3)
  c <- 1
  for (i in seq_along(Questionnaire_lvl2))
  {
    for (j in seq_along(Questionnaire_lvl2))
    {
      if (i != j)
      {
        cor_lvl2[[c]] <- cor.test(Questionnaire_lvl2[[i]], Questionnaire_lvl2[[j]], method = "pearson")
        c <- c+1
      }
    }
  }
}