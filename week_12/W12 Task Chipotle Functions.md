---
title: "W12 Task: Chipotle Functions"
author: "Gabriel Guerrero"
date: "November 29, 2023"
execute:
  keep-md: true
  warning: false
format:
  html:
    code-fold: true
    code-tools: true
---



## Resources
http://r4ds.had.co.nz/r-markdown-formats.html
http://r4ds.had.co.nz/functions.html
https://byuistats.github.io/M335/online_class/week8_functions.Rmd

https://www.loom.com/share/09b052fd172e465089767bd3f7746d0e
https://www.loom.com/share/27667b13fad544f1851576a8c65e9a26
https://www.loom.com/share/7caff5b306f649df81d456b581fb0134

## Background

You got your dream job working as a data analyst for one of your favorite restaurants, Chipotle!


Chipotle is planning to run a large 1 or 2 day promotion. They would like the promotion to take place when the restaurant is busiest. They have gathered restaurant level data that you can use to answer the question: what is the busiest day in the restaurant?

We will answer this question over the course of a couple of assignments. For now, we will build a couple of functions that help us evaluate one site at a time.

The dataset this comes from is not needed for this task. (The next task will use the dataset.) Your function just needs a string as input, not the column of data. However, in case you are curious, here is the restaurant level data: https://byuistats.github.io/M335/data/chipotle_reduced.csv

Here is a data dictionary

## Process
The data contains a column popularity_by_day. This column contains a lot of information we need to extract from a string. As an example, for the restaurant with placekey equal to “zzw-222@5vg-nwf-mp9”, the value for popularity_by_day is a string:

{“Monday”:94,“Tuesday”:76,“Wednesday”:89,“Thursday”:106,“Friday”:130,“Saturday”:128,“Sunday”:58}

### Step 1
Using the string above as a test case, or example, implement your regex/string skills to split the string and convert it into a tibble with two columns: day of week and number of visits. You should get a tibble that looks like something like this:

::: {.cell}

```{.r .cell-code}
library(tidyverse) 
```
:::

::: {.cell}
::: {.cell-output .cell-output-stdout}
```
        day visits
1    Monday     94
2   Tuesday     76
3 Wednesday     89
4  Thursday    106
5    Friday    130
6  Saturday    128
7    Sunday     58
```
:::
:::

### Step 2

Use what you developed above to create 2 functions. Both functions should take as input a character string, like the one provided in bullet point 1, which contains a count of visits by day of the week. The 2 functions will differ in what they return:

::: {.cell}
::: {.cell-output .cell-output-stdout}
```
[1] "Friday"
```
:::
:::


## Conclusions

N/A