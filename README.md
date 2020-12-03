# MED5-Data

## Results

```
SoA
       Mean Median SD                Quantiles
Body   5.4  6      1.42902248518275  1;5;6;6  
Blocks 5.65 6      0.875093979915421 4;5;6;6  
Spearman's rho: 776.2 (p=0.06784)
Wilcoxon: 39.5 (p=0.68514)

SoO
       Mean Median SD               Quantiles 
Body   4.7  5      1.45457535854428 2;4;5;6   
Blocks 2.6  3      1.27320565172283 1;1.75;3;3
Spearman's rho: 474.0 (p=0.00220)
Wilcoxon: 171.0 (p=0.00017)

Proprioception
       Mean Median SD               Quantiles 
Body   3.3  3      2.05452004896008 1;2;3;4.25
Blocks 1.95 1.5    1.19097483291276 1;1;1.5;3 
Spearman's rho: 873.0 (p=0.13800)
Wilcoxon: 108.0 (p=0.00623)

Frustration
       Mean Median SD               Quantiles   
Body   3.85 4      1.53125335660212 1;3;4;5     
Blocks 3.65 3.5    1.13670808176853 2;3;3.5;4.25
Spearman's rho: 1150.8 (p=0.57111)
Wilcoxon: 50.5 (p=0.74904)
```

## Setup

Install dependencies:

```
install.packages("ggplot2", "tidyverse")
```

## Run

Run `questionnaire.r` to analyse data from `questionnaire.csv` inside the root folder of this repository.

```
Rscript questionnaire.r
```