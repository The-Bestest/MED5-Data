implicit_agency <- read.csv(file.path(,), stringsAsFactors=FALSE)
mood <- read.csv(file.path(,), stringsAsFactors=FALSE)
Questionnaire_lvl1 <- read.csv(file.path(,), stringsAsFactors=FALSE)
Questionnaire_lvl2 <- read.csv(file.path(,), stringsAsFactors=FALSE)



#Function to test for normality using shapiro.test and transform the data.
normality_test <- function(IA1, IA2)
{
  #Test for noramlity and transform the data if needed.
  shapiro_result <- shapiro.test(IA1)
  
  #Test second level for normality and transform the data if needed.
  shapiro_result_lvl2 <- shapiro.test(IA2)
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