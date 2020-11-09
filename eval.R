
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
  QQ1 <- ggplot(implicit_agency, aes(sample = implicit_agency$IA1)) +
    stat_qq() +
    stat_qq_line()
  
  QQ2 <- ggplot(implicit_agency, aes(sample = implicit_agency$IA2)) +
    stat_qq() +
    stat_qq_line()
}
#new function for boxplots


#Perform a wilcox rank-sum test on all SoO questions at both levels.
wilcox_SoO_Q1res <- wilcox.test(SoO_lvl1$Q1, SoO_lvl2$Q1, paired = TRUE)
wilcox_SoO_Q2res <- wilcox.test(SoO_lvl1$Q2, SoO_lvl2$Q2, paired = TRUE)
wilcox_SoO_Q3res <- wilcox.test(SoO_lvl1$Q3, SoO_lvl2$Q3, paired = TRUE)

#Calculate mean SoO in Q1 for both levels.
SoOQ1_lvl1_mean <- mean(SoO_lvl1$Q1)
SoOQ1_lvl2_mean <- mean(SoO_lvl2$Q1)

#Calculate SD of SoO in Q1 for both levels.
SoOQ1_lvl1_SD <- sd(SoO_lvl1$Q1)
SoOQ1_lvl2_SD <- sd(SoO_lvl2$Q1)

#Calculate median SoO in Q1 for both levels.
SoOQ1_lvl1_median <- median(SoO_lvl1$Q1)
SoOQ1_lvl2_median <- median(SoO_lvl2$Q1)

#Calculate mean SoO in Q2 for both levels.
SoOQ2_lvl1_mean <- mean(SoO_lvl1$Q2)
SoOQ2_lvl2_mean <- mean(SoO_lvl2$Q2)

#Calculate SD of SoO in Q2 for both levels.
SoOQ2_lvl1_SD <- sd(SoO_lvl1$Q2)
SoOQ2_lvl2_SD <- sd(SoO_lvl2$Q2)

#Calculate median SoO in Q2 for both levels.
SoOQ2_lvl1_median <- median(SoO_lvl1$Q2)
SoOQ2_lvl2_median <- median(SoO_lvl2$Q2)

#Calculate mean SoO in Q3 for both levels.
SoOQ3_lvl1_mean <- mean(SoO_lvl1$Q3)
SoOQ3_lvl2_mean <- mean(SoO_lvl2$Q3)

#Calculate SD of SoO in Q3  for both levels.
SoOQ3_lvl1_SD <- sd(SoO_lvl1$Q3)
SoOQ3_lvl2_SD <- sd(SoO_lvl2$Q3)

#Calculate median SoO in Q3  for both levels.
SoOQ3_lvl1_median <- median(SoO_lvl1$Q3)
SoOQ3_lvl2_median <- median(SoO_lvl2$Q3)




#perform a t-test to compare the implicit agency between both levels.
t_result <- t.test(implicit_agency_lvl1$imp_soa, implicit_agency_lvl2$imp_soa, paired = TRUE, conf.level=0.95)

#Calculate mean implicit agency for both levels.
IA_lvl1_mean <- mean(implicit_agency_lvl1$imp_soa)
IA_lvl2_mean <- mean(implicit_agency_lvl2$imp_soa)

#Calculate SD of implicit agency for both levels.
IA_lvl1_SD <- sd(implicit_agency_lvl1$imp_soa)
IA_lvl2_SD <- sd(implicit_agency_lvl2$imp_soa)

#Calculate median implicit agency for both levels.
IA_lvl1_median <- median(implicit_agency_lvl1$imp_soa)
IA_lvl2_median <- median(implicit_agency_lvl2$imp_soa)

#Find Pearson's r for implicit agency and SoO in lvl1
cor_IA_lvl1_Q1 <- cor.test(implicit_agency_lvl1$imp_soa, SoO_lvl1$Q1, method = "pearson")
cor_IA_lvl1_Q2 <- cor.test(implicit_agency_lvl1$imp_soa, SoO_lvl1$Q2, method = "pearson")
cor_IA_lvl1_Q3 <- cor.test(implicit_agency_lvl1$imp_soa, SoO_lvl1$Q3, method = "pearson")

#Find Pearson's r for implicit agency and SoO in lvl2
cor_IA_lvl2_Q1 <- cor.test(implicit_agency_lvl2$imp_soa, SoO_lvl2$Q1, method = "pearson")
cor_IA_lvl2_Q2 <- cor.test(implicit_agency_lvl2$imp_soa, SoO_lvl2$Q2, method = "pearson")
cor_IA_lvl2_Q3 <- cor.test(implicit_agency_lvl2$imp_soa, SoO_lvl2$Q3, method = "pearson")




#Perform a wilcox rank-sum test on all explicit agency questions at both levels.
wilcox_XA_Q1res <- wilcox.test(explicit_agency_lvl1$Q1, explicit_agency_lvl2$Q1, paired = TRUE)
wilcox_XA_Q2res <- wilcox.test(explicit_agency_lvl1$Q2, explicit_agency_lvl2$Q2, paired = TRUE)
wilcox_XA_Q3res <- wilcox.test(explicit_agency_lvl1$Q3, explicit_agency_lvl2$Q3, paired = TRUE)

#Calculate mean SoO in Q1 for both levels.
XAQ1_lvl1_mean <- mean(explicit_agency_lvl1$Q1)
XAQ1_lvl2_mean <- mean(explicit_agency_lvl2$Q1)

#Calculate SD of SoO in Q1 for both levels.
XAQ1_lvl1_SD <- sd(explicit_agency_lvl1$Q1)
XAQ1_lvl2_SD <- sd(explicit_agency_lvl2$Q1)

#Calculate median SoO in Q1 for both levels.
XAQ1_lvl1_median <- median(explicit_agency_lvl1$Q1)
XAQ1_lvl2_median <- median(explicit_agency_lvl2$Q1)

#Calculate mean SoO in Q2 for both levels.
XAQ2_lvl1_mean <- mean(explicit_agency_lvl1$Q2)
XAQ2_lvl2_mean <- mean(explicit_agency_lvl2$Q2)

#Calculate SD of SoO in Q2 for both levels.
XAQ2_lvl1_SD <- sd(explicit_agency_lvl1$Q2)
XAQ2_lvl2_SD <- sd(explicit_agency_lvl2$Q2)

#Calculate median SoO in Q2 for both levels.
XAQ2_lvl1_median <- median(explicit_agency_lvl1$Q2)
XAQ2_lvl2_median <- median(explicit_agency_lvl2$Q2)

#Calculate mean SoO in Q3 for both levels.
XAQ3_lvl1_mean <- mean(explicit_agency_lvl1$Q3)
XAQ3_lvl2_mean <- mean(explicit_agency_lvl2$Q3)

#Calculate SD of SoO in Q3  for both levels.
XAQ3_lvl1_SD <- sd(explicit_agency_lvl1$Q3)
XAQ3_lvl2_SD <- sd(explicit_agency_lvl2$Q3)

#Calculate median SoO in Q3  for both levels.
XAQ3_lvl1_median <- median(explicit_agency_lvl1$Q3)
XAQ3_lvl2_median <- median(explicit_agency_lvl2$Q3)

#Find Pearson's r for explicit agency and SoO in lvl1
cor_XA_lvl1_Q1.1 <- cor.test(explicit_agency_lvl1$Q1, SoO_lvl1$Q1, method = "pearson")
cor_XA_lvl1_Q2.1 <- cor.test(explicit_agency_lvl1$Q2, SoO_lvl1$Q1, method = "pearson")
cor_XA_lvl1_Q3.1 <- cor.test(explicit_agency_lvl1$Q3, SoO_lvl1$Q1, method = "pearson")
cor_XA_lvl1_Q1.2 <- cor.test(explicit_agency_lvl1$Q1, SoO_lvl1$Q2, method = "pearson")
cor_XA_lvl1_Q2.2 <- cor.test(explicit_agency_lvl1$Q2, SoO_lvl1$Q2, method = "pearson")
cor_XA_lvl1_Q3.2 <- cor.test(explicit_agency_lvl1$Q3, SoO_lvl1$Q2, method = "pearson")
cor_XA_lvl1_Q1.3 <- cor.test(explicit_agency_lvl1$Q1, SoO_lvl1$Q3, method = "pearson")
cor_XA_lvl1_Q2.3 <- cor.test(explicit_agency_lvl1$Q2, SoO_lvl1$Q3, method = "pearson")
cor_XA_lvl1_Q3.3 <- cor.test(explicit_agency_lvl1$Q3, SoO_lvl1$Q3, method = "pearson")

#Find Pearson's r for explicit agency and SoO in lvl2
cor_XA_lvl2_Q1.1 <- cor.test(explicit_agency_lvl2$Q1, SoO_lvl2$Q1, method = "pearson")
cor_XA_lvl2_Q2.1 <- cor.test(explicit_agency_lvl2$Q2, SoO_lvl2$Q1, method = "pearson")
cor_XA_lvl2_Q3.1 <- cor.test(explicit_agency_lvl2$Q3, SoO_lvl2$Q1, method = "pearson")
cor_XA_lvl2_Q1.2 <- cor.test(explicit_agency_lvl2$Q1, SoO_lvl2$Q2, method = "pearson")
cor_XA_lvl2_Q2.2 <- cor.test(explicit_agency_lvl2$Q2, SoO_lvl2$Q2, method = "pearson")
cor_XA_lvl2_Q3.2 <- cor.test(explicit_agency_lvl2$Q3, SoO_lvl2$Q2, method = "pearson")
cor_XA_lvl2_Q1.3 <- cor.test(explicit_agency_lvl2$Q1, SoO_lvl2$Q3, method = "pearson")
cor_XA_lvl2_Q2.3 <- cor.test(explicit_agency_lvl2$Q2, SoO_lvl2$Q3, method = "pearson")
cor_XA_lvl2_Q3.3 <- cor.test(explicit_agency_lvl2$Q3, SoO_lvl2$Q3, method = "pearson")

#Perform a wilcox rank-sum test on all explicit agency questions at both levels.
wilcox_frustration_Q1res <- wilcox.test(frustration_lvl1$Q1, frustration_lvl2$Q1, paired = TRUE)
wilcox_frustration_Q2res <- wilcox.test(frustration_lvl1$Q2, frustration_lvl2$Q2, paired = TRUE)
wilcox_frustration_Q3res <- wilcox.test(frustration_lvl1$Q3, frustration_lvl2$Q3, paired = TRUE)

#Calculate mean SoO in Q1 for both levels.
frustration_Q1_lvl1_mean <- mean(frustration_lvl1$Q1)
frustration_Q1_lvl2_mean <- mean(frustration_lvl2$Q1)

#Calculate SD of SoO in Q1 for both levels.
frustration_Q1_lvl1_SD <- sd(frustration_lvl1$Q1)
frustration_Q1_lvl2_SD <- sd(frustration_lvl2$Q1)

#Calculate median SoO in Q1 for both levels.
frustration_Q1_lvl1_median <- median(frustration_lvl1$Q1)
frustration_Q1_lvl2_median <- median(frustration_lvl2$Q1)

#Calculate mean SoO in Q2 for both levels.
frustration_Q2_lvl1_mean <- mean(frustration_lvl1$Q2)
frustration_Q2_lvl2_mean <- mean(frustration_lvl2$Q2)

#Calculate SD of SoO in Q2 for both levels.
frustration_Q2_lvl1_SD <- sd(frustration_lvl1$Q2)
frustration_Q2_lvl2_SD <- sd(frustration_lvl2$Q2)

#Calculate median SoO in Q2 for both levels.
frustration_Q2_lvl1_median <- median(frustration_lvl1$Q2)
frustration_Q2_lvl2_median <- median(frustration_lvl2$Q2)

#Calculate mean SoO in Q3 for both levels.
frustration_Q3_lvl1_mean <- mean(frustration_lvl1$Q3)
frustration_Q3_lvl2_mean <- mean(frustration_lvl2$Q3)

#Calculate SD of SoO in Q3  for both levels.
frustration_Q3_lvl1_SD <- sd(frustration_lvl1$Q3)
frustration_Q3_lvl2_SD <- sd(frustration_lvl2$Q3)

#Calculate median SoO in Q3  for both levels.
frustration_Q3_lvl1_median <- median(frustration_lvl1$Q3)
frustration_Q3_lvl2_median <- median(frustration_lvl2$Q3)

#Find Pearson's r for frustration and SoO in lvl1
cor_frustration.SoO_lvl1_Q1.1 <- cor.test(frustration_lvl1$Q1, SoO_lvl1$Q1, method = "pearson")
cor_frustration.SoO_lvl1_Q2.1 <- cor.test(frustration_lvl1$Q2, SoO_lvl1$Q1, method = "pearson")
cor_frustration.SoO_lvl1_Q3.1 <- cor.test(frustration_lvl1$Q3, SoO_lvl1$Q1, method = "pearson")
cor_frustration.SoO_lvl1_Q1.2 <- cor.test(frustration_lvl1$Q1, SoO_lvl1$Q2, method = "pearson")
cor_frustration.SoO_lvl1_Q2.2 <- cor.test(frustration_lvl1$Q2, SoO_lvl1$Q2, method = "pearson")
cor_frustration.SoO_lvl1_Q3.2 <- cor.test(frustration_lvl1$Q3, SoO_lvl1$Q2, method = "pearson")
cor_frustration.SoO_lvl1_Q1.3 <- cor.test(frustration_lvl1$Q1, SoO_lvl1$Q3, method = "pearson")
cor_frustration.SoO_lvl1_Q2.3 <- cor.test(frustration_lvl1$Q2, SoO_lvl1$Q3, method = "pearson")
cor_frustration.SoO_lvl1_Q3.3 <- cor.test(frustration_lvl1$Q3, SoO_lvl1$Q3, method = "pearson")

#Find Pearson's r for frustration and SoO in lvl2
cor_frustration.SoO_lvl2_Q1.1 <- cor.test(frustration_lvl2$Q1, SoO_lvl2$Q1, method = "pearson")
cor_frustration.SoO_lvl2_Q2.1 <- cor.test(frustration_lvl2$Q2, SoO_lvl2$Q1, method = "pearson")
cor_frustration.SoO_lvl2_Q3.1 <- cor.test(frustration_lvl2$Q3, SoO_lvl2$Q1, method = "pearson")
cor_frustration.SoO_lvl2_Q1.2 <- cor.test(frustration_lvl2$Q1, SoO_lvl2$Q2, method = "pearson")
cor_frustration.SoO_lvl2_Q2.2 <- cor.test(frustration_lvl2$Q2, SoO_lvl2$Q2, method = "pearson")
cor_frustration.SoO_lvl2_Q3.2 <- cor.test(frustration_lvl2$Q3, SoO_lvl2$Q2, method = "pearson")
cor_frustration.SoO_lvl2_Q1.3 <- cor.test(frustration_lvl2$Q1, SoO_lvl2$Q3, method = "pearson")
cor_frustration.SoO_lvl2_Q2.3 <- cor.test(frustration_lvl2$Q2, SoO_lvl2$Q3, method = "pearson")
cor_frustration.SoO_lvl2_Q3.3 <- cor.test(frustration_lvl2$Q3, SoO_lvl2$Q3, method = "pearson")

#Find Pearson's r for frustration and explicit agency in lvl1
cor_frustration.XA_lvl1_Q1.1 <- cor.test(frustration_lvl1$Q1, explicit_agency_lvl1$Q1, method = "pearson")
cor_frustration.XA_lvl1_Q2.1 <- cor.test(frustration_lvl1$Q2, explicit_agency_lvl1$Q1, method = "pearson")
cor_frustration.XA_lvl1_Q3.1 <- cor.test(frustration_lvl1$Q3, explicit_agency_lvl1$Q1, method = "pearson")
cor_frustration.XA_lvl1_Q1.2 <- cor.test(frustration_lvl1$Q1, explicit_agency_lvl1$Q2, method = "pearson")
cor_frustration.XA_lvl1_Q2.2 <- cor.test(frustration_lvl1$Q2, explicit_agency_lvl1$Q2, method = "pearson")
cor_frustration.XA_lvl1_Q3.2 <- cor.test(frustration_lvl1$Q3, explicit_agency_lvl1$Q2, method = "pearson")
cor_frustration.XA_lvl1_Q1.3 <- cor.test(frustration_lvl1$Q1, explicit_agency_lvl1$Q3, method = "pearson")
cor_frustration.XA_lvl1_Q2.3 <- cor.test(frustration_lvl1$Q2, explicit_agency_lvl1$Q3, method = "pearson")
cor_frustration.XA_lvl1_Q3.3 <- cor.test(frustration_lvl1$Q3, explicit_agency_lvl1$Q3, method = "pearson")

#Find Pearson's r for frustration and explicit agency in lvl2
cor_frustration.XA_lvl2_Q1.1 <- cor.test(frustration_lvl2$Q1, explicit_agency_lvl2$Q1, method = "pearson")
cor_frustration.XA_lvl2_Q2.1 <- cor.test(frustration_lvl2$Q2, explicit_agency_lvl2$Q1, method = "pearson")
cor_frustration.XA_lvl2_Q3.1 <- cor.test(frustration_lvl2$Q3, explicit_agency_lvl2$Q1, method = "pearson")
cor_frustration.XA_lvl2_Q1.2 <- cor.test(frustration_lvl2$Q1, explicit_agency_lvl2$Q2, method = "pearson")
cor_frustration.XA_lvl2_Q2.2 <- cor.test(frustration_lvl2$Q2, explicit_agency_lvl2$Q2, method = "pearson")
cor_frustration.XA_lvl2_Q3.2 <- cor.test(frustration_lvl2$Q3, explicit_agency_lvl2$Q2, method = "pearson")
cor_frustration.XA_lvl2_Q1.3 <- cor.test(frustration_lvl2$Q1, explicit_agency_lvl2$Q3, method = "pearson")
cor_frustration.XA_lvl2_Q2.3 <- cor.test(frustration_lvl2$Q2, explicit_agency_lvl2$Q3, method = "pearson")
cor_frustration.XA_lvl2_Q3.3 <- cor.test(frustration_lvl2$Q3, explicit_agency_lvl2$Q3, method = "pearson")

#Find Pearson's r for frustration and implicit agency in lvl1
cor_frustration.IA_lvl1_Q1 <- cor.test(frustration_lvl1$Q1, implicit_agency_lvl1$imp_soa, method = "pearson")
cor_frustration.IA_lvl1_Q2 <- cor.test(frustration_lvl1$Q2, implicit_agency_lvl1$imp_soa, method = "pearson")
cor_frustration.IA_lvl1_Q3 <- cor.test(frustration_lvl1$Q3, implicit_agency_lvl1$imp_soa, method = "pearson")

#Find Pearson's r for frustration and implicit agency in lvl1
cor_frustration.IA_lvl2_Q1 <- cor.test(frustration_lvl2$Q1, implicit_agency_lvl2$imp_soa, method = "pearson")
cor_frustration.IA_lvl2_Q2 <- cor.test(frustration_lvl2$Q2, implicit_agency_lvl2$imp_soa, method = "pearson")
cor_frustration.IA_lvl2_Q3 <- cor.test(frustration_lvl2$Q3, implicit_agency_lvl2$imp_soa, method = "pearson")