---
title: "AnalysisExample_HK"
output:
  html_document: default
  pdf_document: default
editor_options:
  chunk_output_type: inline
---



## BCI - SoA and SoO project analysis
First we need to import all data so we can connect(merge) it


 

OK next data (code is identical apart from the file name patter)

Sample  data next (code is identical apart from the file name patter)


## Initial analysis

```r
dfSummary <-dfSummary %>% merge(questionnaire) %>% merge(mood) 
dfSummary <-merge(dfSummary,questionnaire)

dfSummary %>%
  select(-Participant) %>%
  group_by(Level) %>%
  skim()
```


Table: Data summary

|                         |           |
|:------------------------|:----------|
|Name                     |Piped data |
|Number of rows           |36         |
|Number of columns        |21         |
|_______________________  |           |
|Column type frequency:   |           |
|numeric                  |20         |
|________________________ |           |
|Group variables          |Level      |


**Variable type: numeric**

|skim_variable  |Level  | n_missing| complete_rate|  mean|   sd|    p0|   p25|   p50|   p75|  p100|hist  |
|:--------------|:------|---------:|-------------:|-----:|----:|-----:|-----:|-----:|-----:|-----:|:-----|
|SoA            |Blocks |         0|             1|  5.56| 0.86|  4.00|  5.00|  6.00|  6.00|  7.00|▂▆▁▇▂ |
|SoA            |Body   |         0|             1|  5.61| 1.04|  4.00|  5.00|  6.00|  6.00|  7.00|▃▇▁▇▅ |
|SoO            |Blocks |         0|             1|  2.50| 1.29|  1.00|  1.25|  2.50|  3.00|  5.00|▇▅▇▁▂ |
|SoO            |Body   |         0|             1|  4.61| 1.50|  2.00|  4.00|  5.00|  5.75|  7.00|▆▆▇▅▃ |
|Proprioception |Blocks |         0|             1|  1.89| 1.23|  1.00|  1.00|  1.00|  2.75|  5.00|▇▂▂▁▁ |
|Proprioception |Body   |         0|             1|  3.28| 1.99|  1.00|  2.00|  3.00|  3.75|  7.00|▇▇▁▁▃ |
|Frustration    |Blocks |         0|             1|  3.83| 1.04|  2.00|  3.00|  4.00|  4.75|  6.00|▁▇▆▅▁ |
|Frustration    |Body   |         0|             1|  3.67| 1.41|  1.00|  3.00|  4.00|  4.75|  6.00|▆▆▇▅▃ |
|orderNumber    |Blocks |         0|             1|  1.50| 0.51|  1.00|  1.00|  1.50|  2.00|  2.00|▇▁▁▁▇ |
|orderNumber    |Body   |         0|             1|  1.50| 0.51|  1.00|  1.00|  1.50|  2.00|  2.00|▇▁▁▁▇ |
|accPerc        |Blocks |         0|             1|  0.79| 0.15|  0.53|  0.67|  0.80|  0.94|  1.00|▃▆▆▅▇ |
|accPerc        |Body   |         0|             1|  0.81| 0.14|  0.57|  0.67|  0.82|  0.93|  0.97|▃▃▃▃▇ |
|activateDelay  |Blocks |         0|             1| 16.11| 2.20| 11.86| 14.48| 16.81| 17.77| 19.31|▃▃▂▇▅ |
|activateDelay  |Body   |         0|             1| 16.47| 1.45| 13.03| 15.84| 16.60| 17.61| 18.48|▁▃▃▇▇ |
|Q1             |Blocks |         0|             1|  5.67| 1.33|  3.00|  5.00|  6.00|  7.00|  7.00|▁▃▅▃▇ |
|Q1             |Body   |         0|             1|  5.67| 1.33|  3.00|  5.00|  6.00|  7.00|  7.00|▁▃▅▃▇ |
|Q2             |Blocks |         0|             1|  5.11| 0.83|  4.00|  4.25|  5.00|  6.00|  6.00|▆▁▇▁▇ |
|Q2             |Body   |         0|             1|  5.11| 0.83|  4.00|  4.25|  5.00|  6.00|  6.00|▆▁▇▁▇ |
|Q3             |Blocks |         0|             1|  3.28| 1.53|  1.00|  2.00|  3.00|  4.00|  7.00|▇▇▃▁▂ |
|Q3             |Body   |         0|             1|  3.28| 1.53|  1.00|  2.00|  3.00|  4.00|  7.00|▇▇▃▁▂ |
|Q4             |Blocks |         0|             1|  2.39| 1.65|  1.00|  1.25|  2.00|  2.00|  7.00|▇▁▁▁▁ |
|Q4             |Body   |         0|             1|  2.39| 1.65|  1.00|  1.25|  2.00|  2.00|  7.00|▇▁▁▁▁ |
|Q5             |Blocks |         0|             1|  3.28| 1.41|  1.00|  3.00|  3.00|  4.00|  7.00|▅▇▆▁▁ |
|Q5             |Body   |         0|             1|  3.28| 1.41|  1.00|  3.00|  3.00|  4.00|  7.00|▅▇▆▁▁ |
|Q6             |Blocks |         0|             1|  6.50| 0.86|  4.00|  6.00|  7.00|  7.00|  7.00|▁▁▁▂▇ |
|Q6             |Body   |         0|             1|  6.50| 0.86|  4.00|  6.00|  7.00|  7.00|  7.00|▁▁▁▂▇ |
|Q7             |Blocks |         0|             1|  2.22| 1.66|  1.00|  1.00|  2.00|  2.75|  7.00|▇▁▁▁▁ |
|Q7             |Body   |         0|             1|  2.22| 1.66|  1.00|  1.00|  2.00|  2.75|  7.00|▇▁▁▁▁ |
|Q8             |Blocks |         0|             1|  6.22| 1.06|  3.00|  6.00|  6.50|  7.00|  7.00|▁▁▂▅▇ |
|Q8             |Body   |         0|             1|  6.22| 1.06|  3.00|  6.00|  6.50|  7.00|  7.00|▁▁▂▅▇ |
|Q9             |Blocks |         0|             1|  6.17| 1.20|  4.00|  5.25|  7.00|  7.00|  7.00|▂▂▁▂▇ |
|Q9             |Body   |         0|             1|  6.17| 1.20|  4.00|  5.25|  7.00|  7.00|  7.00|▂▂▁▂▇ |
|Q10            |Blocks |         0|             1|  2.44| 1.65|  1.00|  1.00|  2.00|  3.00|  7.00|▇▁▁▁▁ |
|Q10            |Body   |         0|             1|  2.44| 1.65|  1.00|  1.00|  2.00|  3.00|  7.00|▇▁▁▁▁ |
|Q11            |Blocks |         0|             1|  3.89| 1.23|  2.00|  3.00|  4.00|  5.00|  6.00|▃▅▅▇▁ |
|Q11            |Body   |         0|             1|  3.89| 1.23|  2.00|  3.00|  4.00|  5.00|  6.00|▃▅▅▇▁ |
|Q12            |Blocks |         0|             1|  2.61| 1.09|  1.00|  2.00|  3.00|  3.00|  5.00|▃▆▇▂▁ |
|Q12            |Body   |         0|             1|  2.61| 1.09|  1.00|  2.00|  3.00|  3.00|  5.00|▃▆▇▂▁ |
|Q13            |Blocks |         0|             1|  5.61| 1.46|  2.00|  5.00|  6.00|  7.00|  7.00|▁▃▅▃▇ |
|Q13            |Body   |         0|             1|  5.61| 1.46|  2.00|  5.00|  6.00|  7.00|  7.00|▁▃▅▃▇ |

Overview

```r
questionnaire %>%
  select(-Participant) %>%
  group_by(Level) %>%
  skim()
```


Table: Data summary

|                         |           |
|:------------------------|:----------|
|Name                     |Piped data |
|Number of rows           |40         |
|Number of columns        |6          |
|_______________________  |           |
|Column type frequency:   |           |
|numeric                  |5          |
|________________________ |           |
|Group variables          |Level      |


**Variable type: numeric**

|skim_variable  |Level  | n_missing| complete_rate| mean|   sd| p0|  p25| p50|  p75| p100|hist  |
|:--------------|:------|---------:|-------------:|----:|----:|--:|----:|---:|----:|----:|:-----|
|SoA            |Blocks |         0|             1| 5.65| 0.88|  4| 5.00| 6.0| 6.00|    7|▂▅▁▇▂ |
|SoA            |Body   |         0|             1| 5.40| 1.43|  1| 5.00| 6.0| 6.00|    7|▁▁▂▃▇ |
|SoO            |Blocks |         0|             1| 2.60| 1.27|  1| 1.75| 3.0| 3.00|    5|▆▅▇▂▂ |
|SoO            |Body   |         0|             1| 4.70| 1.45|  2| 4.00| 5.0| 6.00|    7|▅▅▇▅▂ |
|Proprioception |Blocks |         0|             1| 1.95| 1.19|  1| 1.00| 1.5| 3.00|    5|▇▃▃▁▁ |
|Proprioception |Body   |         0|             1| 3.30| 2.05|  1| 2.00| 3.0| 4.25|    7|▇▆▁▁▃ |
|Frustration    |Blocks |         0|             1| 3.65| 1.14|  2| 3.00| 3.5| 4.25|    6|▃▇▆▅▁ |
|Frustration    |Body   |         0|             1| 3.85| 1.53|  1| 3.00| 4.0| 5.00|    7|▅▅▇▃▃ |
|orderNumber    |Blocks |         0|             1| 1.50| 0.51|  1| 1.00| 1.5| 2.00|    2|▇▁▁▁▇ |
|orderNumber    |Body   |         0|             1| 1.50| 0.51|  1| 1.00| 1.5| 2.00|    2|▇▁▁▁▇ |

Correlation overview (you really need to reduce/collapse your Mood questionnaire )


```r
# check out this web page on easy summaries for correlations:
#http://www.sthda.com/english/wiki/correlation-matrix-a-quick-start-guide-to-analyze-format-and-visualize-a-correlation-matrix-using-r-software

chart.Correlation(dfSummary[,-c(1,2,9:21)], histogram=TRUE, pch=19)
```

<img src="AnalysisReport_files/figure-html/correlationStuff-1.png" width="672" />

```r
res2 <- Hmisc::rcorr(as.matrix(dfSummary[,-c(1,2,9:21)]))
flattenCorrMatrix(res2$r, res2$P)
```

```
##               row         column     cor        p
## 1             SoA            SoO  0.0581 7.36e-01
## 2             SoA Proprioception  0.1157 5.02e-01
## 3             SoO Proprioception  0.7108 1.19e-06
## 4             SoA    Frustration -0.3911 1.84e-02
## 5             SoO    Frustration -0.1731 3.13e-01
## 6  Proprioception    Frustration -0.1406 4.13e-01
## 7             SoA    orderNumber -0.0301 8.62e-01
## 8             SoO    orderNumber -0.0322 8.52e-01
## 9  Proprioception    orderNumber -0.0158 9.27e-01
## 10    Frustration    orderNumber  0.0229 8.94e-01
## 11            SoA        accPerc  0.1523 3.75e-01
## 12            SoO        accPerc -0.0498 7.73e-01
## 13 Proprioception        accPerc  0.0689 6.90e-01
## 14    Frustration        accPerc -0.4149 1.19e-02
## 15    orderNumber        accPerc  0.0931 5.89e-01
## 16            SoA            Q13  0.3211 5.62e-02
## 17            SoO            Q13  0.1905 2.66e-01
## 18 Proprioception            Q13  0.1357 4.30e-01
## 19    Frustration            Q13  0.0242 8.88e-01
## 20    orderNumber            Q13  0.0000 1.00e+00
## 21        accPerc            Q13  0.1322 4.42e-01
```

```r
corrplot(cor(dfSummary[dfSummary$Level=="Body",-c(1,2,9:21)]), type="upper",col=brewer.pal(n=8, name="RdYlBu"))
```

<img src="AnalysisReport_files/figure-html/correlationStuff-2.png" width="672" />

```r
corrplot(cor(dfSummary[dfSummary$Level=="Blocks",-c(1,2,9:21)]), type="upper",col=brewer.pal(n=8, name="RdYlBu"))
```

<img src="AnalysisReport_files/figure-html/correlationStuff-3.png" width="672" />

```r
dfSummary %>%
  filter(SoA > 2) %>%
  ggplot(aes(x = SoA, y = SoO, colour = Level)) +
  geom_jitter() +
  geom_smooth(method = "lm", fill = NA)
```

```
## `geom_smooth()` using formula 'y ~ x'
```

<img src="AnalysisReport_files/figure-html/correlationStuff-4.png" width="672" />

```r
options(pillar.sigfig = 5)
broom::tidy(lm(Frustration~Level*(SoA+SoO+accPerc+activateDelay),data=dfSummary))
```

```
## # A tibble: 10 x 5
##    term                     estimate std.error statistic  p.value
##    <chr>                       <dbl>     <dbl>     <dbl>    <dbl>
##  1 (Intercept)              6.7336     2.5693   2.6208   0.014459
##  2 LevelBody                0.63336    4.4382   0.14271  0.88762 
##  3 SoA                     -0.42015    0.33337 -1.2603   0.21875 
##  4 SoO                     -0.36617    0.22198 -1.6496   0.11106 
##  5 accPerc                 -5.8596     3.5454  -1.6527   0.11042 
##  6 activateDelay            0.30933    0.24532  1.2609   0.21854 
##  7 LevelBody:SoA           -0.090713   0.44533 -0.20370  0.84018 
##  8 LevelBody:SoO            0.30449    0.30233  1.0072   0.32314 
##  9 LevelBody:accPerc       -0.44265    4.6953  -0.094275 0.92561 
## 10 LevelBody:activateDelay -0.034362   0.36224 -0.094858 0.92515
```

```r
broom::tidy(lm(Frustration~SoA+SoO+accPerc+activateDelay,data=dfSummary))
```

```
## # A tibble: 5 x 5
##   term          estimate std.error statistic   p.value
##   <chr>            <dbl>     <dbl>     <dbl>     <dbl>
## 1 (Intercept)    6.7300    1.8579     3.6224 0.0010303
## 2 SoA           -0.40173   0.18727   -2.1452 0.039881 
## 3 SoO           -0.15140   0.10040   -1.5080 0.14168  
## 4 accPerc       -6.4975    2.0845    -3.1171 0.0039219
## 5 activateDelay  0.30621   0.15811    1.9366 0.061950
```

```r
broom::tidy(lm(Frustration~Level,data=dfSummary)) %>%mutate_if(is.numeric, round, 5)
```

```
## # A tibble: 2 x 5
##   term        estimate std.error statistic p.value
##   <chr>          <dbl>     <dbl>     <dbl>   <dbl>
## 1 (Intercept)  3.8333    0.29289  13.088   0      
## 2 LevelBody   -0.16667   0.41421  -0.40237 0.68993
```

```r
broom::tidy(lm(Frustration~Level*orderNumber,data=dfSummary))
```

```
## # A tibble: 4 x 5
##   term                  estimate std.error statistic     p.value
##   <chr>                    <dbl>     <dbl>     <dbl>       <dbl>
## 1 (Intercept)            4.3333    0.94199   4.6002  0.000063269
## 2 LevelBody             -1.3333    1.3322   -1.0009  0.32440    
## 3 orderNumber           -0.33333   0.59577  -0.55950 0.57971    
## 4 LevelBody:orderNumber  0.77778   0.84254   0.92313 0.36285
```

```r
broom::tidy(lm(SoO~Level*orderNumber,data=dfSummary))
```

```
## # A tibble: 4 x 5
##   term                  estimate std.error statistic   p.value
##   <chr>                    <dbl>     <dbl>     <dbl>     <dbl>
## 1 (Intercept)            3.3333    1.0614    3.1405  0.0036163
## 2 LevelBody              0.77778   1.5010    0.51816 0.60791  
## 3 orderNumber           -0.55556   0.67128  -0.82761 0.41402  
## 4 LevelBody:orderNumber  0.88889   0.94933   0.93633 0.35612
```

```r
broom::tidy(lm(SoA~Level*orderNumber,data=dfSummary))
```

```
## # A tibble: 4 x 5
##   term                  estimate std.error statistic   p.value
##   <chr>                    <dbl>     <dbl>     <dbl>     <dbl>
## 1 (Intercept)            4.8889    0.70273    6.9570 7.0209e-8
## 2 LevelBody              1.5556    0.99381    1.5652 1.2736e-1
## 3 orderNumber            0.44444   0.44444    1.     3.2481e-1
## 4 LevelBody:orderNumber -1.        0.62854   -1.5910 1.2144e-1
```

```r
broom::tidy(lm(Proprioception~orderNumber,data=dfSummary))
```

```
## # A tibble: 2 x 5
##   term         estimate std.error statistic   p.value
##   <chr>           <dbl>     <dbl>     <dbl>     <dbl>
## 1 (Intercept)  2.6667     0.95110  2.8038   0.0082866
## 2 orderNumber -0.055556   0.60153 -0.092357 0.92696
```

```r
broom::tidy(lm(SoO~Level,data=dfSummary))
```

```
## # A tibble: 2 x 5
##   term        estimate std.error statistic   p.value
##   <chr>          <dbl>     <dbl>     <dbl>     <dbl>
## 1 (Intercept)   2.5      0.33032    7.5683 8.6315e-9
## 2 LevelBody     2.1111   0.46715    4.5191 7.1528e-5
```

```r
broom::tidy(lm(SoO~SoA*Level,data=dfSummary)) %>% mutate_if(is.numeric, round, 5)
```

```
## # A tibble: 4 x 5
##   term          estimate std.error statistic p.value
##   <chr>            <dbl>     <dbl>     <dbl>   <dbl>
## 1 (Intercept)    5.1786    2.1829     2.3723 0.02386
## 2 SoA           -0.48214   0.3886    -1.2407 0.22373
## 3 LevelBody     -3.1087    2.8472    -1.0918 0.28307
## 4 SoA:LevelBody  0.93503   0.50381    1.8559 0.0727
```

```r
options(scipen = 999)
broom::tidy(lm(SoA~accPerc*Level*orderNumber,data=dfSummary)) %>% mutate_if(is.numeric, round, 5)
```

```
## # A tibble: 8 x 5
##   term                          estimate std.error statistic p.value
##   <chr>                            <dbl>     <dbl>     <dbl>   <dbl>
## 1 (Intercept)                    4.2059     4.1993   1.0016  0.32513
## 2 accPerc                        0.72419    5.3509   0.13534 0.89331
## 3 LevelBody                     -0.78224    6.4779  -0.12076 0.90475
## 4 orderNumber                    1.3248     3.1133   0.42552 0.67371
## 5 accPerc:LevelBody              2.7880     7.9534   0.35054 0.72856
## 6 accPerc:orderNumber           -0.99463    3.7852  -0.26277 0.79465
## 7 LevelBody:orderNumber         -0.74211    4.3087  -0.17224 0.86449
## 8 accPerc:LevelBody:orderNumber -0.27832    5.2485  -0.05303 0.95809
```

```r
options(digits = 3, scipen = -2)
```


```r
# There seems to be a small effect(-0.3724182)(S = 10664, p-value = 0.0253) on frustration using Spearsman Rho 
cor.test(dfSummary$accPerc, dfSummary$SoA, method="spearman")
```

```
## Warning in cor.test.default(dfSummary$accPerc, dfSummary$SoA, method = "spearman"): Cannot
## compute exact p-value with ties
```

```
## 
## 	Spearman's rank correlation rho
## 
## data:  dfSummary$accPerc and dfSummary$SoA
## S = 7e+03, p-value = 0.4
## alternative hypothesis: true rho is not equal to 0
## sample estimates:
##   rho 
## 0.148
```

```r
cor.test(dfSummary$accPerc, dfSummary$SoO, method="spearman")
```

```
## Warning in cor.test.default(dfSummary$accPerc, dfSummary$SoO, method = "spearman"): Cannot
## compute exact p-value with ties
```

```
## 
## 	Spearman's rank correlation rho
## 
## data:  dfSummary$accPerc and dfSummary$SoO
## S = 8e+03, p-value = 0.7
## alternative hypothesis: true rho is not equal to 0
## sample estimates:
##    rho 
## -0.077
```

```r
cor.test(dfSummary$accPerc, dfSummary$Frustration, method="spearman")
```

```
## Warning in cor.test.default(dfSummary$accPerc, dfSummary$Frustration, method = "spearman"):
## Cannot compute exact p-value with ties
```

```
## 
## 	Spearman's rank correlation rho
## 
## data:  dfSummary$accPerc and dfSummary$Frustration
## S = 1e+04, p-value = 3e-02
## alternative hypothesis: true rho is not equal to 0
## sample estimates:
##    rho 
## -0.372
```

```r
ggplot(dfSummary, aes(x=accPerc,y=Frustration, colour=Level)) + geom_point() + geom_smooth(method = "lm", fill = NA)
```

```
## `geom_smooth()` using formula 'y ~ x'
```

<img src="AnalysisReport_files/figure-html/Checking the effect of performance on SoA, SoO, Frustration and Proprioception-1.png" width="672" />

```r
cor.test(dfSummary$accPerc, dfSummary$Proprioception, method="spearman")
```

```
## Warning in cor.test.default(dfSummary$accPerc, dfSummary$Proprioception, : Cannot compute exact
## p-value with ties
```

```
## 
## 	Spearman's rank correlation rho
## 
## data:  dfSummary$accPerc and dfSummary$Proprioception
## S = 7e+03, p-value = 0.5
## alternative hypothesis: true rho is not equal to 0
## sample estimates:
##   rho 
## 0.129
```

```r
class(dfSummary$Level)
```

```
## [1] "factor"
```

```r
dfDataTep <- dfSummary%>%mutate(Level=recode(Level, Body="Avatar"))
dfData <- with(dfDataTep, dfDataTep[order(Level,decreasing = TRUE),])
```


```r
#non-parametric data


 dfData %>%
  select(Participant, orderNumber,Level, Q1:Q13) %>%
  pivot_longer(cols = -c(Level, Participant,orderNumber)) %>%
  filter(orderNumber==1) %>% 
  group_by(name) %>% 
  summarise(p=wilcox.test(value~Level,paired=FALSE,exact=FALSE)$p.value) %>%View()
```


```r
#parametric data
 ParticipantOrder1 <- dfData %>% filter(orderNumber == 1)
 Avatar1 <- ParticipantOrder1 %>% filter(Level=="Avatar")
 Blocks1 <- ParticipantOrder1 %>% filter(Level=="Blocks")
 ParticipantOrder2 <- dfData %>% filter(orderNumber == 2)
Avatar2 <- ParticipantOrder2 %>% filter(Level=="Avatar")
Blocks2 <- ParticipantOrder2 %>% filter(Level=="Blocks")
#Histograms 
# qplot(Avatar1$accPerc,
#       geom="histogram",
#       bins = 50, 
#       main = "Performance as Percentages in Avatar 1",
#       xlim = c(0, 1),
#       ylim = c(0, 3),
#       xlab = "Avatar performance")
# 
# 
# qplot(Blocks1$accPerc,
#       geom="histogram",
#       bins = 50,
#       xlim = c(0, 1),
#       ylim = c(0, 3),
#       main = "Performance as Percentages in Blocks 1", 
#       xlab = "Blocks performance")

#ordernumber 1
#Use ParticipantOrder1 and Body,Blocks1
#Check for normality(Shapiro Wilks Test)
#The data is normal if the p-value is above 0.05.
SWTestAvatar1 <- shapiro.test(Avatar1$accPerc)
SWTestBlocks1 <- shapiro.test(Blocks1$accPerc)
#homogeneity of variance
#leveneTestorder1 <- leveneTest(ParticipantOrder1$accPerc,group = ParticipantOrder1$Level, center = "median", data = ParticipantOrder1)
#T test Welch's t-test (Does not require variance check)
t.test(Avatar1$accPerc, Blocks1$accPerc)
```

```
## 
## 	Welch Two Sample t-test
## 
## data:  Avatar1$accPerc and Blocks1$accPerc
## t = 2, df = 15, p-value = 0.1
## alternative hypothesis: true difference in means is not equal to 0
## 95 percent confidence interval:
##  -0.0356  0.2578
## sample estimates:
## mean of x mean of y 
##     0.841     0.730
```

```r
#ordernumber 2

#parametric data
#Histograms
# qplot(Avatar2$accPerc,
#       geom="histogram",
#       bins = 50,
#       xlim = c(0, 1),
#       ylim = c(0, 3),
#       main = "Performance as Percentages in Avatar 2", 
#       xlab = "Avatar performance")
# 
# qplot(Blocks2$accPerc,
#       geom="histogram",
#       bins = 50,
#       xlim = c(0, 1),
#       ylim = c(0, 3),
#       main = "Performance as Percentages in Blocks 2", 
#       xlab = "Blocks performance")

#Check for normality(Shapiro Wilks Test)
SWTestAvatar2 <- shapiro.test(Avatar2$accPerc)
SWTestBlocks2 <- shapiro.test(Blocks2$accPerc)
#homogeneity of variance
#leveneTestorder2 <- leveneTest(ParticipantOrder2$accPerc,group = ParticipantOrder2$Level, center = "median", data = ParticipantOrder2)
#T test Welch's t-test (Does not require variance check)
t.test(Avatar2$accPerc, Blocks2$accPerc)
```

```
## 
## 	Welch Two Sample t-test
## 
## data:  Avatar2$accPerc and Blocks2$accPerc
## t = -1, df = 15, p-value = 0.2
## alternative hypothesis: true difference in means is not equal to 0
## 95 percent confidence interval:
##  -0.2102  0.0473
## sample estimates:
## mean of x mean of y 
##     0.770     0.852
```

```r
#Check for normality(Shapiro Wilks Test)
shapiro.test(ParticipantOrder1$accPerc)
```

```
## 
## 	Shapiro-Wilk normality test
## 
## data:  ParticipantOrder1$accPerc
## W = 0.9, p-value = 4e-02
```

```r
shapiro.test(ParticipantOrder2$accPerc)
```

```
## 
## 	Shapiro-Wilk normality test
## 
## data:  ParticipantOrder2$accPerc
## W = 0.9, p-value = 0.3
```

```r
#T test Welch's t-test (Does not require variance check)
t.test(ParticipantOrder1$accPerc, ParticipantOrder2$accPerc)
```

```
## 
## 	Welch Two Sample t-test
## 
## data:  ParticipantOrder1$accPerc and ParticipantOrder2$accPerc
## t = -0.5, df = 33, p-value = 0.6
## alternative hypothesis: true difference in means is not equal to 0
## 95 percent confidence interval:
##  -0.1226  0.0708
## sample estimates:
## mean of x mean of y 
##     0.785     0.811
```

```r
#Check for normality(Shapiro Wilks Test)
shapiro.test(ParticipantOrder1$accPerc)
```

```
## 
## 	Shapiro-Wilk normality test
## 
## data:  ParticipantOrder1$accPerc
## W = 0.9, p-value = 4e-02
```

```r
shapiro.test(ParticipantOrder2$accPerc)
```

```
## 
## 	Shapiro-Wilk normality test
## 
## data:  ParticipantOrder2$accPerc
## W = 0.9, p-value = 0.3
```

```r
#T test Welch's t-test (Does not require variance check)
t.test(ParticipantOrder1$accPerc, ParticipantOrder2$accPerc)
```

```
## 
## 	Welch Two Sample t-test
## 
## data:  ParticipantOrder1$accPerc and ParticipantOrder2$accPerc
## t = -0.5, df = 33, p-value = 0.6
## alternative hypothesis: true difference in means is not equal to 0
## 95 percent confidence interval:
##  -0.1226  0.0708
## sample estimates:
## mean of x mean of y 
##     0.785     0.811
```


```r
dfAvatar<- dfData %>% filter(Level == "Avatar")
dfBlocks <- dfData %>% filter(Level == "Blocks")

#Check for normality(Shapiro Wilks Test)
shapiro.test(dfAvatar$accPerc)
```

```
## 
## 	Shapiro-Wilk normality test
## 
## data:  dfAvatar$accPerc
## W = 0.9, p-value = 5e-02
```

```r
shapiro.test(dfBlocks$accPerc)
```

```
## 
## 	Shapiro-Wilk normality test
## 
## data:  dfBlocks$accPerc
## W = 0.9, p-value = 0.2
```

```r
#T test Welch's t-test (Does not require variance check)
t.test(dfAvatar$accPerc, dfBlocks$accPerc)
```

```
## 
## 	Welch Two Sample t-test
## 
## data:  dfAvatar$accPerc and dfBlocks$accPerc
## t = 0.3, df = 34, p-value = 0.8
## alternative hypothesis: true difference in means is not equal to 0
## 95 percent confidence interval:
##  -0.0821  0.1117
## sample estimates:
## mean of x mean of y 
##     0.806     0.791
```


```r
#non-parametric data
#correlation test on measurement within ordernumbers

#Cor.test(lvl1.SoO, lvl1.SoA)
cor.test(ParticipantOrder1$SoO, ParticipantOrder1$SoA, method="spearman", exact = FALSE)
```

```
## 
## 	Spearman's rank correlation rho
## 
## data:  ParticipantOrder1$SoO and ParticipantOrder1$SoA
## S = 863, p-value = 0.7
## alternative hypothesis: true rho is not equal to 0
## sample estimates:
##   rho 
## 0.109
```

```r
#Cor.test(lvl2.SoO, lvl2.SoA)
cor.test(ParticipantOrder2$SoO, ParticipantOrder2$SoA, method="spearman", exact = FALSE)
```

```
## 
## 	Spearman's rank correlation rho
## 
## data:  ParticipantOrder2$SoO and ParticipantOrder2$SoA
## S = 982, p-value = 1
## alternative hypothesis: true rho is not equal to 0
## sample estimates:
##    rho 
## -0.013
```

```r
#Cor.test(lvl1.SoO, lvl1.proprioception)
cor.test(ParticipantOrder1$SoO, ParticipantOrder1$Proprioception, method="spearman", exact = FALSE)
```

```
## 
## 	Spearman's rank correlation rho
## 
## data:  ParticipantOrder1$SoO and ParticipantOrder1$Proprioception
## S = 449, p-value = 2e-02
## alternative hypothesis: true rho is not equal to 0
## sample estimates:
##   rho 
## 0.537
```

```r
#Cor.test(lvl2.SoO, lvl2.proprioception)
cor.test(ParticipantOrder2$SoO, ParticipantOrder2$Proprioception, method="spearman", exact = FALSE)
```

```
## 
## 	Spearman's rank correlation rho
## 
## data:  ParticipantOrder2$SoO and ParticipantOrder2$Proprioception
## S = 192, p-value = 6e-05
## alternative hypothesis: true rho is not equal to 0
## sample estimates:
##   rho 
## 0.802
```

```r
#Cor.test(lvl1.SoO, lvl1.frustration)
cor.test(ParticipantOrder1$SoO, ParticipantOrder1$Frustration, method="spearman", exact = FALSE)
```

```
## 
## 	Spearman's rank correlation rho
## 
## data:  ParticipantOrder1$SoO and ParticipantOrder1$Frustration
## S = 1e+03, p-value = 0.1
## alternative hypothesis: true rho is not equal to 0
## sample estimates:
##    rho 
## -0.354
```

```r
#Cor.test(lvl2.SoO, lvl2.frustration)
cor.test(ParticipantOrder2$SoO, ParticipantOrder2$Frustration, method="spearman", exact = FALSE)
```

```
## 
## 	Spearman's rank correlation rho
## 
## data:  ParticipantOrder2$SoO and ParticipantOrder2$Frustration
## S = 1e+03, p-value = 0.6
## alternative hypothesis: true rho is not equal to 0
## sample estimates:
##    rho 
## -0.128
```


```r
 Avatar <- dfData %>% filter(Level=="Avatar")
 Blocks <- dfData %>% filter(Level=="Blocks")
#cor.test for Avatar SoA and SoO
cor.test(Avatar$SoA, Avatar$SoO ,method="spearman", exact = FALSE)
```

```
## 
## 	Spearman's rank correlation rho
## 
## data:  Avatar$SoA and Avatar$SoO
## S = 594, p-value = 0.1
## alternative hypothesis: true rho is not equal to 0
## sample estimates:
##   rho 
## 0.387
```

```r
#cor.test for Blocks SoA and SoO
cor.test(Blocks$SoA, Blocks$SoO ,method="spearman", exact = FALSE)
```

```
## 
## 	Spearman's rank correlation rho
## 
## data:  Blocks$SoA and Blocks$SoO
## S = 1e+03, p-value = 0.3
## alternative hypothesis: true rho is not equal to 0
## sample estimates:
##    rho 
## -0.275
```

```r
#cor.test for Avatar SoA and propriception
cor.test(Avatar$SoA, Avatar$Proprioception ,method="spearman", exact = FALSE)
```

```
## 
## 	Spearman's rank correlation rho
## 
## data:  Avatar$SoA and Avatar$Proprioception
## S = 665, p-value = 0.2
## alternative hypothesis: true rho is not equal to 0
## sample estimates:
##   rho 
## 0.314
```

```r
#cor.test for Blocks SoA and proprioception
cor.test(Blocks$SoA, Blocks$Proprioception ,method="spearman", exact = FALSE)
```

```
## 
## 	Spearman's rank correlation rho
## 
## data:  Blocks$SoA and Blocks$Proprioception
## S = 971, p-value = 1
## alternative hypothesis: true rho is not equal to 0
## sample estimates:
##       rho 
## -2.43e-03
```

```r
#cor.test for Avatar perf. and prop.
cor.test(Avatar$accPerc, Avatar$Proprioception ,method="spearman", exact = FALSE)
```

```
## 
## 	Spearman's rank correlation rho
## 
## data:  Avatar$accPerc and Avatar$Proprioception
## S = 780, p-value = 0.4
## alternative hypothesis: true rho is not equal to 0
## sample estimates:
##   rho 
## 0.195
```

```r
#cor.test for Blocks perf. and prop.
cor.test(Blocks$accPerc, Blocks$Proprioception ,method="spearman", exact = FALSE)
```

```
## 
## 	Spearman's rank correlation rho
## 
## data:  Blocks$accPerc and Blocks$Proprioception
## S = 899, p-value = 0.8
## alternative hypothesis: true rho is not equal to 0
## sample estimates:
##    rho 
## 0.0718
```


```r
#correlation test on SoA
cor.test(dfData$SoO, dfData$SoA, method="spearman", exact = FALSE)
```

```
## 
## 	Spearman's rank correlation rho
## 
## data:  dfData$SoO and dfData$SoA
## S = 7e+03, p-value = 0.7
## alternative hypothesis: true rho is not equal to 0
## sample estimates:
##   rho 
## 0.063
```

```r
SoOSoAScatter <- ggplot(dfData,aes(x=SoO,y=SoA, colour=Level, fill=Level))+
  geom_point(position=position_jitter(h=0.08, w=0.08), shape = 21, alpha = 0.5, size = 5) +
  expand_limits(x=c(1,7), y=c(1, 7))+
  scale_color_manual(values=c("red","blue")) +
  scale_fill_manual(values=c("red","blue")) +
  xlab(label = "SoO") +
  ylab(label = "SoA") +
  labs(fill = "Conditions", colour = "Conditions")+
  theme_bw(base_size = 25)+
  geom_smooth(method = "lm", fill = NA)

#correlation test on frustration
cor.test(dfData$SoO, dfData$Frustration, method="spearman", exact = FALSE)
```

```
## 
## 	Spearman's rank correlation rho
## 
## data:  dfData$SoO and dfData$Frustration
## S = 1e+04, p-value = 0.2
## alternative hypothesis: true rho is not equal to 0
## sample estimates:
##   rho 
## -0.23
```

```r
SoOFruScatter <- ggplot(dfData,aes(x=SoO,y=Frustration, colour=Level, fill=Level))+
  geom_point(position=position_jitter(h=0.08, w=0.08), shape = 21, alpha = 0.5, size = 3) +
  expand_limits(x=c(1,7), y=c(1, 7))+
  scale_color_manual(values=c("red","blue")) +
  scale_fill_manual(values=c("red","blue")) +
  xlab(label = "SoO") +
  ylab(label = "Frustration") +
  labs(fill = "Conditions", colour = "Conditions")+
  geom_smooth(method = "lm", fill = NA)

#correlation test on Proprioception
cor.test(dfData$SoO, dfData$Proprioception, method="spearman", exact = FALSE)
```

```
## 
## 	Spearman's rank correlation rho
## 
## data:  dfData$SoO and dfData$Proprioception
## S = 2e+03, p-value = 6e-07
## alternative hypothesis: true rho is not equal to 0
## sample estimates:
##   rho 
## 0.726
```

```r
SoOPropioScatter <- ggplot(dfData,aes(x=SoO,y=Proprioception, colour=Level, fill=Level))+
  geom_point(position=position_jitter(h=0.08, w=0.08), shape = 21, alpha = 0.5, size = 3) +
  expand_limits(x=c(1,7), y=c(1, 7))+
  scale_color_manual(values=c("red","blue")) +
  scale_fill_manual(values=c("red","blue")) +
  xlab(label = "SoO") +
  ylab(label = "Proprioception") +
  labs(fill = "Conditions", colour = "Conditions")+
  geom_smooth(method = "lm", fill = NA)
#Saving Plots
png("SoOSoAScatter.png", width = 800, height = 600)
plot(SoOSoAScatter)
```

```
## `geom_smooth()` using formula 'y ~ x'
```

```r
dev.off()
```

```
## quartz_off_screen 
##                 2
```

```r
png("SoOFruScatter.png", width = 800, height = 600)
plot(SoOFruScatter)
```

```
## `geom_smooth()` using formula 'y ~ x'
```

```r
dev.off()
```

```
## quartz_off_screen 
##                 2
```

```r
png("SoOPropioScatter.png", width = 800, height = 600)
plot(SoOPropioScatter)
```

```
## `geom_smooth()` using formula 'y ~ x'
```

```r
dev.off
```

```
## function (which = dev.cur()) 
## {
##     if (which == 1) 
##         stop("cannot shut down device 1 (the null device)")
##     .External(C_devoff, as.integer(which))
##     dev.cur()
## }
## <bytecode: 0x7f8795a639a8>
## <environment: namespace:grDevices>
```


```r
#correlation test on Frustration
cor.test(dfData$SoA, dfData$Frustration, method="spearman", exact = FALSE)
```

```
## 
## 	Spearman's rank correlation rho
## 
## data:  dfData$SoA and dfData$Frustration
## S = 1e+04, p-value = 3e-02
## alternative hypothesis: true rho is not equal to 0
## sample estimates:
##    rho 
## -0.364
```

```r
SoAFRuScatter <- ggplot(dfData,aes(x=SoA,y=Frustration, colour=Level, fill=Level))+
  geom_point(position=position_jitter(h=0.08, w=0.08), shape = 21, alpha = 0.5, size = 3) +
  expand_limits(x=c(1,7), y=c(1, 7))+
  scale_color_manual(values=c("red","blue")) +
  scale_fill_manual(values=c("red","blue")) +
  xlab(label = "SoA") +
  ylab(label = "Frustration") +
  labs(fill = "Conditions", colour = "Conditions")+
  geom_smooth(method = "lm", fill = NA)


#correlation test on Proprioception
cor.test(dfData$SoA, dfData$Proprioception, method="spearman", exact = FALSE)
```

```
## 
## 	Spearman's rank correlation rho
## 
## data:  dfData$SoA and dfData$Proprioception
## S = 6e+03, p-value = 0.3
## alternative hypothesis: true rho is not equal to 0
## sample estimates:
##   rho 
## 0.171
```

```r
SoAPropioScatter <- ggplot(dfData,aes(x=SoA,y=Proprioception, colour=Level, fill=Level))+
  geom_point(position=position_jitter(h=0.08, w=0.08), shape = 21, alpha = 0.5, size = 3) +
  expand_limits(x=c(1,7), y=c(1, 7))+
  scale_color_manual(values=c("red","blue")) +
  scale_fill_manual(values=c("red","blue")) +
  xlab(label = "SoA") +
  ylab(label = "Proprioception") +
  labs(fill = "Conditions", colour = "Conditions")+
  geom_smooth(method = "lm", fill = NA)

#correlation test on Proprioception and Frustration
cor.test(dfData$Proprioception, dfData$Frustration, method="spearman", exact = FALSE)
```

```
## 
## 	Spearman's rank correlation rho
## 
## data:  dfData$Proprioception and dfData$Frustration
## S = 1e+04, p-value = 8e-02
## alternative hypothesis: true rho is not equal to 0
## sample estimates:
##    rho 
## -0.296
```

```r
ProprioFruScatter <- ggplot(dfData,aes(x=Proprioception,y=Frustration, colour=Level, fill=Level))+ 
  geom_point(position=position_jitter(h=0.08, w=0.08), shape = 21, alpha = 0.5, size = 3) +
  expand_limits(x=c(1,7), y=c(1, 7))+
  scale_color_manual(values=c("red","blue")) +
  scale_fill_manual(values=c("red","blue")) +
  xlab(label = "Proprioception") +
  ylab(label = "Frustration") +
  labs(fill = "Conditions", colour = "Conditions")+
  geom_smooth(method = "lm", fill = NA)
#Saving Plots
png("SoAFRuScatter.png", width = 800, height = 600)
plot(SoAFRuScatter)
```

```
## `geom_smooth()` using formula 'y ~ x'
```

```r
dev.off()
```

```
## quartz_off_screen 
##                 2
```

```r
png("SoAPropioScatter.png", width = 800, height = 600)
plot(SoAPropioScatter)
```

```
## `geom_smooth()` using formula 'y ~ x'
```

```r
dev.off()
```

```
## quartz_off_screen 
##                 2
```

```r
png("ProprioFruScatter.png", width = 800, height = 600)
plot(ProprioFruScatter)
```

```
## `geom_smooth()` using formula 'y ~ x'
```

```r
dev.off
```

```
## function (which = dev.cur()) 
## {
##     if (which == 1) 
##         stop("cannot shut down device 1 (the null device)")
##     .External(C_devoff, as.integer(which))
##     dev.cur()
## }
## <bytecode: 0x7f8795a639a8>
## <environment: namespace:grDevices>
```


```r
#correlation test on SoO
cor.test(dfData$accPerc, dfData$SoO, method="spearman", exact = FALSE)
```

```
## 
## 	Spearman's rank correlation rho
## 
## data:  dfData$accPerc and dfData$SoO
## S = 8e+03, p-value = 0.7
## alternative hypothesis: true rho is not equal to 0
## sample estimates:
##    rho 
## -0.077
```

```r
PerfSoOScatter <- ggplot(dfData,aes(x=accPerc,y=SoO, colour=Level, fill=Level))+
  geom_point(position=position_jitter(h=0.1, w=0.0), shape = 21, alpha = 0.5, size = 3) +
  expand_limits(x=c(0,1), y=c(1, 7))+
  scale_color_manual(values=c("red","blue")) +
  scale_fill_manual(values=c("red","blue")) +
  xlab(label = "Performance") +
  ylab(label = "SoO") +
  labs(fill = "Conditions", colour = "Conditions")+
  geom_smooth(method = "lm", fill = NA)

#correlation test on SoA
cor.test(dfData$accPerc, dfData$SoA, method="spearman", exact = FALSE)
```

```
## 
## 	Spearman's rank correlation rho
## 
## data:  dfData$accPerc and dfData$SoA
## S = 7e+03, p-value = 0.4
## alternative hypothesis: true rho is not equal to 0
## sample estimates:
##   rho 
## 0.148
```

```r
PerfSoAScatter <- ggplot(dfData,aes(x=accPerc,y=SoA, colour=Level, fill=Level))+
  geom_point(position=position_jitter(h=0.1, w=0.0), shape = 21, alpha = 0.5, size = 3) +
  expand_limits(x=c(0,1), y=c(1, 7))+
  scale_color_manual(values=c("red","blue")) +
  scale_fill_manual(values=c("red","blue")) +
  xlab(label = "Performance") +
  ylab(label = "SoA") +
  labs(fill = "Conditions", colour = "Conditions")+
  geom_smooth(method = "lm", fill = NA)
#correlation test on Frustration
cor.test(dfData$accPerc, dfData$Frustration, method="spearman", exact = FALSE)
```

```
## 
## 	Spearman's rank correlation rho
## 
## data:  dfData$accPerc and dfData$Frustration
## S = 1e+04, p-value = 3e-02
## alternative hypothesis: true rho is not equal to 0
## sample estimates:
##    rho 
## -0.372
```

```r
PerfFruScatter <- ggplot(dfData,aes(x=accPerc,y=Frustration, colour=Level, fill=Level))+
  geom_point(position=position_jitter(h=0.1, w=0.0), shape = 21, alpha = 0.5, size = 3) +
  expand_limits(x=c(0,1), y=c(1, 7))+
  scale_color_manual(values=c("red","blue")) +
  scale_fill_manual(values=c("red","blue")) +
  xlab(label = "Performance") +
  ylab(label = "Frustration") +
  labs(fill = "Conditions", colour = "Conditions")+
  geom_smooth(method = "lm", fill = NA)
#correlation test on Proprioception
cor.test(dfData$accPerc, dfData$Proprioception, method="spearman", exact = FALSE)
```

```
## 
## 	Spearman's rank correlation rho
## 
## data:  dfData$accPerc and dfData$Proprioception
## S = 7e+03, p-value = 0.5
## alternative hypothesis: true rho is not equal to 0
## sample estimates:
##   rho 
## 0.129
```

```r
PerfProprioScatter <- ggplot(dfData,aes(x=accPerc,y=Proprioception, colour=Level, fill=Level))+
  geom_point(position=position_jitter(h=0.1, w=0.0), shape = 21, alpha = 0.5, size = 3) +
  expand_limits(x=c(0,1), y=c(1, 7))+
  scale_color_manual(values=c("red","blue")) +
  scale_fill_manual(values=c("red","blue")) +
  xlab(label = "Performance") +
  ylab(label = "Proprioception") +
  labs(fill = "Conditions", colour = "Conditions")+
  geom_smooth(method = "lm", fill = NA)
#Saving Plots
png("PerfSoOScatter.png", width = 800, height = 600)
plot(PerfSoOScatter)
```

```
## `geom_smooth()` using formula 'y ~ x'
```

```r
dev.off()
```

```
## quartz_off_screen 
##                 2
```

```r
png("PerfSoAScatter.png", width = 800, height = 600)
plot(PerfSoAScatter)
```

```
## `geom_smooth()` using formula 'y ~ x'
```

```r
dev.off()
```

```
## quartz_off_screen 
##                 2
```

```r
png("PerfFruScatter.png", width = 800, height = 600)
plot(PerfFruScatter)
```

```
## `geom_smooth()` using formula 'y ~ x'
```

```r
dev.off
```

```
## function (which = dev.cur()) 
## {
##     if (which == 1) 
##         stop("cannot shut down device 1 (the null device)")
##     .External(C_devoff, as.integer(which))
##     dev.cur()
## }
## <bytecode: 0x7f8795a639a8>
## <environment: namespace:grDevices>
```

```r
png("PerfProprioScatter.png", width = 800, height = 600)
plot(PerfProprioScatter)
```

```
## `geom_smooth()` using formula 'y ~ x'
```

```r
dev.off()
```

```
## quartz_off_screen 
##                 2
```


```r
#correlation test on SoA order 1
cor.test(ParticipantOrder1$accPerc, ParticipantOrder1$SoA, method="spearman", exact = FALSE)
```

```
## 
## 	Spearman's rank correlation rho
## 
## data:  ParticipantOrder1$accPerc and ParticipantOrder1$SoA
## S = 678, p-value = 0.2
## alternative hypothesis: true rho is not equal to 0
## sample estimates:
## rho 
## 0.3
```

```r
ggplot(ParticipantOrder1,aes(x=accPerc,y=SoA, colour=Level))+ geom_point() + expand_limits(x=c(0,1), y=c(1, 7)) + geom_smooth(method = "lm", fill = NA)
```

```
## `geom_smooth()` using formula 'y ~ x'
```

<img src="AnalysisReport_files/figure-html/Correlation test for Performance on Soa using orderNumber-1.png" width="672" />

```r
#correlation test on SoA order 2
cor.test(ParticipantOrder2$accPerc, ParticipantOrder2$SoA, method="spearman", exact = FALSE)
```

```
## 
## 	Spearman's rank correlation rho
## 
## data:  ParticipantOrder2$accPerc and ParticipantOrder2$SoA
## S = 929, p-value = 0.9
## alternative hypothesis: true rho is not equal to 0
## sample estimates:
##    rho 
## 0.0409
```

```r
ggplot(ParticipantOrder2,aes(x=accPerc,y=SoA, colour=Level))+ geom_point() + expand_limits(x=c(0,1), y=c(1, 7)) + geom_smooth(method = "lm", fill = NA)
```

```
## `geom_smooth()` using formula 'y ~ x'
```

<img src="AnalysisReport_files/figure-html/Correlation test for Performance on Soa using orderNumber-2.png" width="672" />


```r
#This chunk is for all the missing data and graphs for the results sections
MBlocks <- dfData %>% filter(Level=="Blocks")
MAvatar <- dfData %>% filter(Level=="Avatar")

#Median: I manually changed X
median(MBlocks$Proprioception , trim = 0, na.rm = FALSE)
```

```
## [1] 1
```

```r
median(MAvatar$Proprioception , trim = 0, na.rm = FALSE)
```

```
## [1] 3
```

```r
#Performance
  #boxplot
PerformanceBoxplot <- ggplot(dfData, aes(accPerc, y=Level, fill=Level)) + 
  coord_flip() + 
  scale_fill_manual(values=c("red","blue"))+
  ylab(label = "Level") +
  xlab(label = "Performance(%)") +
  labs(fill = "Conditions", colour = "Conditions")+
  geom_boxplot(outlier.colour="red", outlier.shape=8,outlier.size=4, alpha=0.5)
  #Histogram
PerformanceHisto <- ggplot(dfData,aes(accPerc, fill=Level))+
   scale_fill_manual(values=c("red","blue"))+
   xlab(label = "Performance") +
   ylab(label = "Fequency") +
   labs(fill = "Conditions", colour = "Conditions")+
   geom_histogram(alpha=0.5,bins=50,position="identity")

#SoO
  #Histogram
SoOHisto <- ggplot(dfData,aes(SoO, fill=Level),xlab=7,ylab=7)+
   scale_fill_manual(values=c("red","blue"))+
   xlab(label = "SoO") +
   ylab(label = "Fequency") +
   labs(fill = "Conditions", colour = "Conditions")+
   geom_histogram(alpha=0.5,bins=14,position="identity")
  #boxplot
SoOBoxplot <- ggplot(dfData, aes(SoO, y=Level, fill=Level)) + 
  coord_flip() + 
  xlab(label = "SoO") +
  ylab(label = "Level") +
  scale_fill_manual(values=c("red","blue"))+
  labs(fill = "Conditions", colour = "Conditions")+
  geom_boxplot(outlier.colour="red", outlier.shape=8,outlier.size=4, alpha=0.5)

#SoA
  #Histogram
SoAHisto <- ggplot(dfData,aes(SoA, fill=Level),xlab=7,ylab=7)+
   scale_fill_manual(values=c("red","blue"))+
   xlab(label = "SoA") +
   ylab(label = "Fequency") +
   labs(fill = "Conditions", colour = "Conditions")+
   geom_histogram(alpha=0.5,bins=14,position="identity")
  #boxplot
SoABoxplot <- ggplot(dfData, aes(SoA, y=Level, fill=Level)) + 
  coord_flip() + 
  xlab(label = "SoA") +
  ylab(label = "Level") +
  labs(fill = "Conditions", colour = "Conditions")+
  scale_fill_manual(values=c("red","blue"))+
  geom_boxplot(outlier.colour="red", outlier.shape=8,outlier.size=4, alpha=0.5)

#Frustation
  #Histogram
FrustationHisto <- ggplot(dfData,aes(Frustration, fill=Level),xlab=7,ylab=7)+
   scale_fill_manual(values=c("red","blue"))+
   xlab(label = "Frustration") +
   ylab(label = "Fequency") +
   labs(fill = "Conditions", colour = "Conditions")+
   geom_histogram(alpha=0.5,bins=14,position="identity")
  #boxplot
FrustationBoxplot <- ggplot(dfData, aes(Frustration, y=Level, fill=Level)) + 
  coord_flip() + 
  xlab(label = "Frustration") +
  ylab(label = "Level") +
  labs(fill = "Conditions", colour = "Conditions")+
  scale_fill_manual(values=c("red","blue"))+
  geom_boxplot(outlier.colour="red", outlier.shape=8,outlier.size=4, alpha=0.5)

#Proprioception 
  #Histogram
ProprioceptionHisto <- ggplot(dfData,aes(Proprioception , fill=Level),xlab=7,ylab=7)+
   scale_fill_manual(values=c("red","blue"))+
   xlab(label = "Proprioception ") +
   ylab(label = "Fequency") +
   labs(fill = "Conditions", colour = "Conditions")+
   geom_histogram(alpha=0.5,bins=14,position="identity")
  #boxplot
ProprioceptionBoxplot <- ggplot(dfData, aes(Proprioception , y=Level, fill=Level)) + 
  coord_flip() + 
  xlab(label = "Proprioception ") +
  ylab(label = "Level") +
  labs(fill = "Conditions", colour = "Conditions")+
  scale_fill_manual(values=c("red","blue"))+
  geom_boxplot(outlier.colour="red", outlier.shape=8,outlier.size=4, alpha=0.5)

 #save plots (Does not work yet)

 # vector1 <- c(PerformanceBoxplot,PerformanceHisto,SoOHisto)
 # 
 # for ( i in seq_along(vector1)) {
 #   png(i+".png", width = 800, height = 600)
 #   plot(i)
 #   dev.off()
 # }

png("PerformanceBoxplot.png", width = 800, height = 600)
plot(PerformanceBoxplot)
dev.off()
```

```
## quartz_off_screen 
##                 2
```

```r
png("PerformanceHisto.png", width = 800, height = 600)
plot(PerformanceHisto)
dev.off()
```

```
## quartz_off_screen 
##                 2
```

```r
png("SoOHisto.png", width = 800, height = 600)
plot(SoOHisto)
dev.off()
```

```
## quartz_off_screen 
##                 2
```

```r
png("SoOBoxplot.png", width = 800, height = 600)
plot(SoOBoxplot)
dev.off()
```

```
## quartz_off_screen 
##                 2
```

```r
png("SoAHisto.png", width = 800, height = 600)
plot(SoAHisto)
dev.off()
```

```
## quartz_off_screen 
##                 2
```

```r
png("SoABoxplot.png", width = 800, height = 600)
plot(SoOBoxplot)
dev.off()
```

```
## quartz_off_screen 
##                 2
```

```r
png("FrustationHsto.png", width = 800, height = 600)
plot(FrustationHisto)
dev.off()
```

```
## quartz_off_screen 
##                 2
```

```r
png("FrustationBoxplot.png", width = 800, height = 600)
plot(FrustationBoxplot)
dev.off()
```

```
## quartz_off_screen 
##                 2
```


```r
#This chunk is for all the missing data and graphs for the results sections
#SoO + SoA
AVSoOSoAScatterplot <- ggplot(dfData,aes(x=SoO,y=SoA, colour=Level, fill=Level))+ 
  geom_point(position=position_jitter(h=0.08, w=0.08), shape = 21, alpha = 0.5, size = 3) +
  expand_limits(x=c(1,7), y=c(1, 7))+
  scale_color_manual(values=c("#E66100","#5D3A9B")) +
  scale_fill_manual(values=c("#E66100","#5D3A9B")) +
  xlab(label = "SoO") +
  ylab(label = "SoA") +
  labs(fill = "Conditions", colour = "Conditions")+
  theme_minimal()+
  geom_smooth(method = "lm", fill = NA)
#performance + frustration
AVperformanceFrustrationScatterplot <- ggplot(dfData,aes(x=accPerc,y=Frustration, colour=Level, fill=Level))+
  geom_point(position=position_jitter(h=0.1, w=0.0), shape = 21, alpha = 0.5, size = 3) +
  expand_limits(x=c(0,1), y=c(1, 7))+
  scale_color_manual(values=c("#E66100","#5D3A9B")) +
  scale_fill_manual(values=c("#E66100","#5D3A9B")) +
  xlab(label = "Performance") +
  ylab(label = "Frustration") +
  theme_minimal()+
  labs(fill = "Conditions", colour = "Conditions")+
  geom_smooth(method = "lm", fill = NA)
#SoA + frustration
AVSoAFrustrationScatterplot <- ggplot(dfData,aes(x=SoA,y=Frustration, colour=Level, fill=Level))+
  geom_point(position=position_jitter(h=0.1, w=0.0), shape = 21, alpha = 0.5, size = 3) +
  expand_limits(x=c(1,7), y=c(1, 7))+
  scale_color_manual(values=c("#E66100","#5D3A9B")) +
  scale_fill_manual(values=c("#E66100","#5D3A9B")) +
  xlab(label = "SoA") +
  ylab(label = "Frustration") +
  labs(fill = "Conditions", colour = "Conditions")+
  theme_minimal()+
  geom_smooth(method = "lm", fill = NA)

AVSoOBoxplot<- ggplot(dfData, aes(SoO, y=Level, fill=Level)) + 
  coord_flip() + 
  xlab(label = "SoO") +
  ylab(label = "Level") +
  labs(fill = "Conditions", colour = "Conditions")+
  scale_fill_manual(values=c("#E66100","#5D3A9B"))+
  theme_minimal()+
  geom_boxplot(outlier.colour="red", outlier.shape=8,outlier.size=4, alpha=0.5)


png("AVSoOSoAScatterplot.png", width = 800, height = 600)
plot(AVSoOSoAScatterplot)
```

```
## `geom_smooth()` using formula 'y ~ x'
```

```r
dev.off()
```

```
## quartz_off_screen 
##                 2
```

```r
png("AVperformanceFrustrationScatterplot.png", width = 800, height = 600)
plot(AVperformanceFrustrationScatterplot)
```

```
## `geom_smooth()` using formula 'y ~ x'
```

```r
dev.off()
```

```
## quartz_off_screen 
##                 2
```

```r
png("AVSoAFrustrationScatterplot.png", width = 800, height = 600)
plot(AVSoAFrustrationScatterplot)
```

```
## `geom_smooth()` using formula 'y ~ x'
```

```r
dev.off()
```

```
## quartz_off_screen 
##                 2
```

```r
png("AVSoOBoxplot.png", width = 800, height = 600)
plot(AVSoOBoxplot)
dev.off()
```

```
## quartz_off_screen 
##                 2
```

```r
wilcox.test(dfAvatar$SoO, dfBlocks$SoO, paired=TRUE,exact=FALSE)
```

```
## 
## 	Wilcoxon signed rank test with continuity correction
## 
## data:  dfAvatar$SoO and dfBlocks$SoO
## V = 136, p-value = 4e-04
## alternative hypothesis: true location shift is not equal to 0
```

```r
wilcox.test(dfAvatar$SoA, dfBlocks$SoA, paired=TRUE,exact=FALSE)
```

```
## 
## 	Wilcoxon signed rank test with continuity correction
## 
## data:  dfAvatar$SoA and dfBlocks$SoA
## V = 36, p-value = 0.8
## alternative hypothesis: true location shift is not equal to 0
```

```r
wilcox.test(dfAvatar$Frustration, dfBlocks$Frustration, paired=TRUE,exact=FALSE)
```

```
## 
## 	Wilcoxon signed rank test with continuity correction
## 
## data:  dfAvatar$Frustration and dfBlocks$Frustration
## V = 28, p-value = 0.6
## alternative hypothesis: true location shift is not equal to 0
```

```r
wilcox.test(dfAvatar$Proprioception, dfBlocks$Proprioception, paired=TRUE,exact=FALSE)
```

```
## 
## 	Wilcoxon signed rank test with continuity correction
## 
## data:  dfAvatar$Proprioception and dfBlocks$Proprioception
## V = 84, p-value = 7e-03
## alternative hypothesis: true location shift is not equal to 0
```


```r
gg2 <- summarySE(dfData, measurevar="SoO", groupvars =c( "Level"))
#https://www.rdocumentation.org/packages/Rmisc/versions/1.5/topics/summarySE
#gg2 has the red dots from the means it produces and the ci values used below

 

SoOCompactPlot <- ggplot(gg2, aes(Level, SoO, colour=Level)) + theme_bw(base_size = 25) +
  geom_jitter(data = dfData, aes(Level, SoO), width=0.2, color="black", alpha=0.5, size=3) + 
  geom_point(position=position_dodge(0.2), size=4, colour="red") +
  geom_errorbar(aes(ymin=SoO-ci, ymax=SoO+ci), width=.4, position = position_dodge(0.2), color=c("red", "blue")) +
  scale_x_discrete(limits=c(), labels=c("Blocks", "Avatar")) +
  scale_y_continuous(limits = c(1,7)) +
  ylab("SoO Scores") + xlab("") + theme(legend.position="none")

png("SoOCompactPlot.png", width = 800, height = 600)
plot(SoOCompactPlot)
```

```
## Warning: Removed 3 rows containing missing values (geom_point).
```

```r
dev.off()
```

```
## quartz_off_screen 
##                 2
```


```r
gg2 <- summarySE(dfData, measurevar="SoA", groupvars =c( "Level"))
#https://www.rdocumentation.org/packages/Rmisc/versions/1.5/topics/summarySE
#gg2 has the red dots from the means it produces and the ci values used below

 

SoACompactPlot <- ggplot(gg2, aes(Level, SoA, colour=Level)) + theme_bw(base_size = 25) +
  geom_jitter(data = dfData, aes(Level, SoA), width=0.2, color="black", alpha=0.5, size=3) + 
  geom_point(position=position_dodge(0.2), size=4, colour="red") +
  geom_errorbar(aes(ymin=SoA-ci, ymax=SoA+ci), width=.4, position = position_dodge(0.2), color=c("red", "blue")) +
  scale_x_discrete(limits=c(), labels=c("Blocks", "Avatar")) +
  scale_y_continuous(limits = c(1,7)) +
  ylab("SoA Scores") + xlab("") + theme(legend.position="none")

png("SoACompactPlot.png", width = 800, height = 600)
plot(SoACompactPlot)
```

```
## Warning: Removed 4 rows containing missing values (geom_point).
```

```r
dev.off()
```

```
## quartz_off_screen 
##                 2
```


```r
gg2 <- summarySE(dfData, measurevar="accPerc", groupvars =c( "Level"))
#https://www.rdocumentation.org/packages/Rmisc/versions/1.5/topics/summarySE
#gg2 has the red dots from the means it produces and the ci values used below

 

accPercCompactPlot <- ggplot(gg2, aes(Level, accPerc, colour=Level)) + theme_bw(base_size = 25) +
  geom_jitter(data = dfData, aes(Level, accPerc), width=0.2, color="black", alpha=0.5, size=3) + 
  geom_point(position=position_dodge(0.2), size=4, colour="red") +
  geom_errorbar(aes(ymin=accPerc-ci, ymax=accPerc+ci), width=.4, position = position_dodge(0.2), color=c("red", "blue")) +
  scale_x_discrete(limits=c(), labels=c("Blocks", "Avatar")) +
  scale_y_continuous(limits = c(0,30)) +
  ylab("Performance(%)") + xlab("") + theme(legend.position="none")

png("accPerc.png", width = 800, height = 600)
plot(accPercCompactPlot)
dev.off()
```

```
## quartz_off_screen 
##                 2
```

