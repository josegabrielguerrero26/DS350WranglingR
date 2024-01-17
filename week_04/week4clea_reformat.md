---
title: "Week 4 Clean and Reformat (aka tidy) Stock"
author: "Gabriel Guerrero"
date: "October 03, 2023"
execute:
  keep-md: true
  warning: false
format:
  html:
    code-fold: false
    code-tools: false
---





## Step1 
Use the appropriate function in library(readr) to read in the .RDS file found on GitHub
Depending on your computer, you should use read_rds(url("WEBLOCATION.RDS")) or read_rds("WEBLOCATION.RDS") to download and read the .RDS file type. Remember, R is case sensitive. Replace WEBLOCATION.RDS with the correct url address. When using file paths to read files in from Github (and other locations), you must pay attention to 'raw' vs. 'blob' (seeing the assigned reading).

::: {.cell}

:::

Downloading

::: {.cell}
::: {.cell-output .cell-output-stdout}
```
# A tibble: 5 × 3
  contest_period      variable value
  <chr>               <chr>    <dbl>
1 January-June1990    PROS      12.7
2 February-July1990   PROS      26.4
3 March-August1990    PROS       2.5
4 April-September1990 PROS     -20  
5 May-October1990     PROS     -37.8
```
:::
:::

#Step 2
The contestant_period column is not “tidy” we want to create a month_end and a year_end column from the information it contains.


::: {.cell}
::: {.cell-output .cell-output-stdout}
```
# A tibble: 300 × 4
   month_end year_end variable value
   <chr>     <chr>    <chr>    <dbl>
 1 June      1990     PROS      12.7
 2 July      1990     PROS      26.4
 3 August    1990     PROS       2.5
 4 September 1990     PROS     -20  
 5 October   1990     PROS     -37.8
 6 November  1990     PROS     -33.3
 7 December  1990     PROS     -10.2
 8 January   1991     PROS     -20.3
 9 February  1991     PROS      38.9
10 March     1991     PROS      20.2
# ℹ 290 more rows
```
:::
:::

## Step 3
Save your “tidy” data as an .rds object. (see if you can read in the saved file!

::: {.cell}

```{.r .cell-code}
saveRDS(df1, file="taks4.rds")
readRDS("taks4.rds")
```

::: {.cell-output .cell-output-stdout}
```
# A tibble: 300 × 4
   month_end year_end variable value
   <chr>     <chr>    <chr>    <dbl>
 1 June      1990     PROS      12.7
 2 July      1990     PROS      26.4
 3 August    1990     PROS       2.5
 4 September 1990     PROS     -20  
 5 October   1990     PROS     -37.8
 6 November  1990     PROS     -33.3
 7 December  1990     PROS     -10.2
 8 January   1991     PROS     -20.3
 9 February  1991     PROS      38.9
10 March     1991     PROS      20.2
# ℹ 290 more rows
```
:::
:::

## Step 4

Use code to create a table of the DJIA returns that matches the table shown below (apply pivot_wider() to the data). Pay attention to detail.



::: {.cell}

```{.r .cell-code}
df2 <- filter(df1, variable=="DJIA")%>%
  select(-variable)%>%
  mutate(month_end= case_when(month_end == "Febuary" ~ "February", month_end == "Dec." ~ "December", TRUE ~ month_end))%>%
  mutate(value = as.character(value)) %>%
  mutate(value = if_else(is.na(value), "-", value)) %>%
  pivot_wider(names_from = year_end, values_from = value, values_fill = "-") %>%
  arrange(factor(month_end, levels = month.name)) 

df2
```

::: {.cell-output .cell-output-stdout}
```
# A tibble: 12 × 10
   month_end `1990` `1991` `1992` `1993` `1994` `1995` `1996` `1997` `1998`
   <chr>     <chr>  <chr>  <chr>  <chr>  <chr>  <chr>  <chr>  <chr>  <chr> 
 1 January   -      -0.8   6.5    -0.8   11.2   1.8    15     19.6   -0.3  
 2 February  -      11     8.6    2.5    5.5    3.2    15.6   20.1   10.7  
 3 March     -      15.8   7.2    9      1.6    7.3    18.4   9.6    7.6   
 4 April     -      16.2   10.6   5.8    0.5    12.8   14.8   15.3   22.5  
 5 May       -      17.3   17.6   6.7    1.3    19.5   9      13.3   10.6  
 6 June      2.5    17.7   3.6    7.7    -6.2   16     10.2   16.2   15    
 7 July      11.5   7.6    4.2    3.7    -5.3   19.6   1.3    20.8   7.1   
 8 August    -2.3   4.4    -0.3   7.3    1.5    15.3   0.6    8.3    -13.1 
 9 September -9.2   3.4    -0.1   5.2    4.4    14     5.8    20.2   -11.8 
10 October   -8.5   4.4    -5     5.7    6.9    8.2    7.2    3      -     
11 November  -12.8  -3.3   -2.8   4.9    -0.3   13.1   15.1   3.8    -     
12 December  -9.3   6.6    0.2    8      3.6    9.3    15.5   -0.7   -     
```
:::
:::
