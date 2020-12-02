implicit_agency <- read.csv(file.path(,), stringsAsFactors=FALSE)
mood <- read.csv(file.path(,), stringsAsFactors=FALSE)
Questionnaire <- read.csv(file.path(,), stringsAsFactors=FALSE)

IA_df <- data.frame(TI = implicit_agency$temporal_interval, prcvd = implicit_agency$prcvd_interval, IA1 = implicit_agency$IA1, IA2 = implicit_agency$IA2)
Questionnaire_df <- data.frame(SoO = Questionnaire$SoO, XA = Questionnaire$XA, frustration = Questionnaire$frustration, Proprioception = Questionnaire$proprioception, lvl = Questionnaire$level)
##i would recommend merging IA and Questionnaire based on ParticipantID
##assuming both IA_df and Questionnaire_df have that shared identifier (participantID or PID)
##df <- merge(IA_df,Questionnaire_df)


Q_lvl1 <- filter(Questionnaire_df, lvl == 1)
Q_lvl2 <- filter(Questionnaire_df, lvl == 2)

##I wouldn't split this (keep all data in df), use the group functions (or group_by functions) for more powerful and less typing 
## e.g. try
##library(skimr)
##library(tidyverse)
##skim(Questionnaire_df)
## or grouped by lvl
##Questionnaire_df %>% group_by(lvl) %>% skim() 


#Function to test for normality using shapiro.test and transform the data.
normality_test <- function(IA1, IA2)
{
  #Test for normality and transform the data if needed.
  shapiro_result <- shapiro.test(IA1)
  
  #Test second level for normality and transform the data if needed.
  shapiro_result_lvl2 <- shapiro.test(IA2)

  #QQ plots for IA1 and IA2
  QQ1 <- ggplot(implicit_agency, aes(sample = IA1)) +
    stat_qq() +
    stat_qq_line()
  
  QQ2 <- ggplot(implicit_agency, aes(sample = IA2)) +
    stat_qq() +
    stat_qq_line()
}

##more efficient to do this with a facet 
##let's assume all data is in df
##df %>% select(SoO, XA, Proprioception, Frustration,Level) %>% pivot_longer() ... need to better understand what you want to do in tems of variable names but see example below
##try this: you can remove each pipe symbol (and what comes after) to see how the data gets transformed through the pipe
##iris %>% select(Sepal.Length, Sepal.Width, Petal.Length, Species) %>% pivot_longer(!Species, values_to="val",names_to="var") %>% ggplot(aes(x = val, y = Species))+geom_boxplot()+facet_wrap(~var)


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
##more efficient to do this with a facet 
##let's assume all data is in df
##df %>% select(SoO, XA, Proprioception, Frustration,Level) %>% pivot_longer() ... need to better understand what you want to do in tems of variable names but see example below
##try this: you can remove each pipe symbol (and what comes after) to see how the data gets transformed through the pipe
##iris %>% select(Sepal.Length, Sepal.Width, Petal.Length, Species) %>% pivot_longer(!Species, values_to="val",names_to="var") %>% ggplot(aes(x = val, y = Species))+geom_boxplot()+facet_wrap(~var)


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

##check out the skim command in skimr will do much more for you (see above)
Process_questionnaire <- function()
{
  lvl1_Q_means <- vector("double", ncol(Q_lvl1), nrow(2))
  lvl1_Q_SD <- vector("double", ncol(Q_lvl1), nrow(2))
  lvl1_Q_medians <- vector("double", ncol(Q_lvl1), nrow(2))
  for (i in seq_along(Q_lvl1))
  {
    lvl1_Q_means[[i]] <- mean(Q_lvl1[[i]])
    lvl1_Q_SD[[i]] <- sd(Q_lvl1[[i]])
    lvl1_Q_medians[[i]] <- median(Q_lvl1[[i]])
  }
  
  lvl2_Q_means <- vector("double", ncol(Q_lvl2), nrow(2))
  lvl2_Q_SD <- vector("double", ncol(Q_lvl2), nrow(2))
  lvl2_Q_medians <- vector("double", ncol(Q_lvl2), nrow(2))
  for (i in seq_along(Q_lvl2))
  {
    lvl2_Q_means[[i]] <- mean(Q_lvl2[[i]])
    lvl2_Q_SD[[i]] <- sd(Q_lvl2[[i]])
    lvl2_Q_medians[[i]] <- median(Q_lvl2[[i]])
  }
  
  wilcox_SoO <- wilcox.test(Q_lvl1$SoO, Q_lvl2$SoO, paired = TRUE)
  wilcox_proprioception <- wilcox.test(Q_lvl1$proprioception, Q_lvl2$proprioception, paired = TRUE)
  wilcox_frustration <- wilcox.test(Q_lvl1$frustration, Q_lvl2$frustration, paired = TRUE)
}

##have a look at something like this
##http://www.sthda.com/english/wiki/correlation-matrix-a-quick-start-guide-to-analyze-format-and-visualize-a-correlation-matrix-using-r-software
correlation <- function()
{
  cor_lvl1 <- vector("double", ncol(Q_lvl1)*3)
  c <- 1
  ##c is a special function in R you don't want to overwrite
  for (i in seq_along(Q_lvl1))
  {
    for (j in seq_along(Q_lvl1))
    {
      if (i != j)
      {
        cor_lvl1[[c]] <- cor.test(Q_lvl1[[i]], Q_lvl1[[j]], method = "pearson")
        c <- c+1
      }
    }
  }
  
  cor_lvl2 <- vector("double", ncol(Q_lvl2)*3)
  c <- 1
  for (i in seq_along(Q_lvl2))
  {
    for (j in seq_along(Q_lvl2))
    {
      if (i != j)
      {
        cor_lvl2[[c]] <- cor.test(Q_lvl2[[i]], Q_lvl2[[j]], method = "pearson")
        c <- c+1
      }
    }
  }
}



scatterPlot_XA_SoO <- function(XA, Frustration, lvl)
{
  scatter_XA_SoO <- ggplot(aes(x = XA, y = Frustration, colour = lvl)) +
    geom_point(alpha = 0.4,  position = position_jitter()) + stat_smooth(method = "lm")
}
