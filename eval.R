
implicit_agency <- read.csv(file.path(,), stringsAsFactors=FALSE)
mood <- read.csv(file.path(,), stringsAsFactors=FALSE)
Questionnaire_lvl1 <- read.csv(file.path(,), stringsAsFactors=FALSE)
Questionnaire_lvl2 <- read.csv(file.path(,), stringsAsFactors=FALSE)


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
