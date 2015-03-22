---
title       : mpgCalc
subtitle    : 
author      : Josh Gardner
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Fuel efficiency matters

1. Fuel is expensive!
2. Fuel-efficient vehicles reduce our carbon footprint

## So -- you want to know your car's mpg!

mpcCalc can help!

* Input basic information about your car
* Get an instant, reliable estimate of your overall mpg


--- .class #id 

## This app isn't just for car owners!

* Can be used for prospective car buyers--to evaluate claims made by car manufacturers, or to search for the ideal specifications needed to produce a desirable fuel economy.
* Car renters might also want a quick way to verify their vehicle's fuel economy to save on gas while traveling.

## How to use mpgCalc

**This is a turnkey system.** It's ready to use, with no setup required. 

* Input your vehicle's specifications (these items were specifically selected as both important to mpg estimation and as features every car owner would know)
* See the instant mpg calculation! The numbers and the visualization both update immediately with virtually no lag time.
* Compare your vehicle to the other cars in the dataset using the plot.

--- .class #id 

## Modeling Details

mpgCalc uses a linear regression model, built on the mtcars dataset, to generate estimates of mpg for the user-provided specifications.

*The model uses variables selected both for being strong predictors of mpg, but also as features every car owner would know.
* See the instant mpg calculation! 
* Input your vehicle's specifications (these items were specifically selected as both important to mpg estimation and The numbers and the visualization both update immediately with virtually no lag time.
* Compare your vehicle to the other cars in the dataset using the plot.


--- .class #id 
## Model Summary

```r
mtcars$am <- factor(mtcars$am)
appcarfit <- lm(mpg ~ cyl + hp + wt + am + gear, data = mtcars)
```


```r
summary(appcarfit)$coefficients
```

```
##               Estimate Std. Error    t value     Pr(>|t|)
## (Intercept) 37.1873000  6.0009131  6.1969403 1.484352e-06
## cyl         -0.8060183  0.6641589 -1.2135926 2.358132e-01
## hp          -0.0233920  0.0158572 -1.4751655 1.521759e-01
## wt          -2.6313041  0.9444780 -2.7859876 9.829623e-03
## am1          1.6657414  1.7319031  0.9617983 3.450112e-01
## gear        -0.2411571  1.1818776 -0.2040458 8.399065e-01
```

```r
summary(appcarfit)$r.squared
```

```
## [1] 0.8492728
```




