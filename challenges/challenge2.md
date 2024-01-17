---
title: " Challenge 2"
author: "Gabriel Guerrero"
date: "November 26, 2023"
execute:
  keep-md: true
  warning: false
format:
  html:
    code-fold: true
    code-tools: true
---



## Background

Recreate the chart

## Process

### Step 1

Packages


::: {.cell}

:::

### Get the Data 


::: {.cell}
::: {.cell-output .cell-output-stdout}
```
# A tibble: 100 × 20
     age gender split_half clocktime chiptime  year marathon   country split_10k
   <dbl> <chr>       <dbl>     <dbl>    <dbl> <dbl> <chr>      <chr>       <dbl>
 1    24 M             NA        NA      309.  2001 Cowtown M… US           NA  
 2    50 F            181.      383.     377.  2006 New York … US           81.4
 3    NA <NA>          NA        NA      217.  1998 New York … US           NA  
 4    NA F             NA        NA      229.  2012 Edge to E… Canada       NA  
 5    NA M             NA        NA      189.  2009 Barcelona… Spain        NA  
 6    NA <NA>          NA       385.     362.  2013 Nike Wome… US           NA  
 7    NA M            112.      277.     277.  2008 Baltimore… US           NA  
 8    NA M             NA        NA      236.  2001 Copenhage… Denmark      NA  
 9    40 M             NA        NA      222.  2013 Friends o… US           NA  
10    NA <NA>          NA        NA      210.  1998 Berlin Ma… Germany      NA  
# ℹ 90 more rows
# ℹ 11 more variables: split_30k <dbl>, split_40k <dbl>, marathon2 <chr>,
#   finishers <dbl>, meantime <dbl>, female <dbl>, us <dbl>, canada <dbl>,
#   europe <dbl>, other <dbl>, age_gender <dbl>
```
:::

::: {.cell-output .cell-output-stdout}
```
 [1] "age"        "gender"     "split_half" "clocktime"  "chiptime"  
 [6] "year"       "marathon"   "country"    "split_10k"  "split_30k" 
[11] "split_40k"  "marathon2"  "finishers"  "meantime"   "female"    
[16] "us"         "canada"     "europe"     "other"      "age_gender"
```
:::

::: {.cell-output .cell-output-stdout}
```
[1] 194746
```
:::

::: {.cell-output .cell-output-stdout}
```
# A tibble: 57,529 × 21
     age gender split_half clocktime chiptime  year marathon   country split_10k
   <dbl> <chr>       <dbl>     <dbl>    <dbl> <dbl> <chr>      <chr>       <dbl>
 1    50 F           181.       383.     377.  2006 New York … US           81.4
 2    NA <NA>         NA        385.     362.  2013 Nike Wome… US           NA  
 3    NA M           112.       277.     277.  2008 Baltimore… US           NA  
 4    28 <NA>        104.       214.     212.  2012 Philadelp… US           49.1
 5    42 M            NA        243.     242.  2009 Maine Mar… US           NA  
 6    34 M            NA        212.     212.  2005 Mercedes … US           NA  
 7    43 F            NA        250.     241.  2000 City of L… US           NA  
 8    46 M            NA        206.     204.  2010 Berlin Ma… Germany      NA  
 9    49 M            NA        197.     197.  2009 Rock n Ro… US           NA  
10    28 M            88.0      186.     186.  2009 Vermont C… US           NA  
# ℹ 57,519 more rows
# ℹ 12 more variables: split_30k <dbl>, split_40k <dbl>, marathon2 <chr>,
#   finishers <dbl>, meantime <dbl>, female <dbl>, us <dbl>, canada <dbl>,
#   europe <dbl>, other <dbl>, age_gender <dbl>, time_hour <dbl>
```
:::
:::



## Graph

::: {.cell}
::: {.cell-output-display}
![](challenge2_files/figure-html/unnamed-chunk-3-1.png){width=960}
:::
:::



NA
