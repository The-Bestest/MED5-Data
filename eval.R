library(ggplot2)
library(tidyverse)

Questionnaire <- read.csv(file.path(,), stringsAsFactors=FALSE)
Questionnaire_df <- data.frame(SoO = Questionnaire$SoO, SoA = Questionnaire$SoA, Frustration = Questionnaire$Frustration, Proprioception = Questionnaire$Proprioception, Level = Questionnaire$Level)

my_data <- as_tibble(Questionnaire_df)
lvl1 <- my_data %>% filter(Level == "lvl1")
lvl2 <- my_data %>% filter(Level == "lvl2")

# Only returns last mean
mean4all <- function(lvl1, lvl2) 
{
    mean(lvl1$SoO)
    mean(lvl1$SoA)
    mean(lvl1$Proprioception)
    mean(lvl1$Frustration)
  
    mean(lvl2$SoO)
    mean(lvl2$SoA)
    mean(lvl2$Proprioception)
    mean(lvl2$Frustration)
}

##I wouldn't split this (keep all data in df), use the group functions (or group_by functions) for more powerful and less typing 
## e.g. try
##library(skimr)
##library(tidyverse)
##skim(Questionnaire_df)
## or grouped by lvl
##Questionnaire_df %>% group_by(lvl) %>% skim() 

#function for boxplot containing SoO, SoA, Frustration, Proprioception
### This only gives a boxplot for proprioception
boxplot <- function(SoO, SoA, Frustration, Proprioception, Level)
{
  plot_SoO <- ggplot(subset(Questionnaire, !is.na(SoO)),aes(x = SoO, y = Level, colour = "#E69F00"))
  + geom_boxplot()
  plot_XA <- ggplot(subset(Questionnaire, !is.na(SoA)),aes(x = SoA, y = Level, colour = "#56B4E9"))
  + geom_boxplot()
  plot_Frustration <- ggplot(subset(Questionnaire, !is.na(Frustration)),aes(x = Frustration, y = Level, colour = "#009E73"))
  + geom_boxplot()
  plot_Proprioception <- ggplot(subset(Questionnaire, !is.na(Proprioception)),aes(x = Proprioception, y = Level, colour = "#F0E442"))
  + geom_boxplot()
}

### Use this for the boxplot function
ChangeThisName <- boxplot(Questionnaire_df$SoO, Questionnaire_df$SoA, Questionnaire_df$Frustation, Questionnaire_df$Proprioception, Questionnaire_df$Level)
##more efficient to do this with a facet 
##let's assume all data is in df
##df %>% select(SoO, XA, Proprioception, Frustration,Level) %>% pivot_longer() ... need to better understand what you want to do in tems of variable names but see example below
##try this: you can remove each pipe symbol (and what comes after) to see how the data gets transformed through the pipe
##iris %>% select(Sepal.Length, Sepal.Width, Petal.Length, Species) %>% pivot_longer(!Species, values_to="val",names_to="var") %>% ggplot(aes(x = val, y = Species))+geom_boxplot()+facet_wrap(~var)

##check out the skim command in skimr will do much more for you (see above)
### Error in vector("double", ncol(Q_lvl1), nrow(2)) : unused argument (nrow(2))
### Error code giving by R
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
### Not enough finite observation
### Error code giving by R
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
