---
title: "Case Study: Stocks Tidyquant"
author: "Gabriel Guerrero"
date: "March 15, 2024"
execute:
  keep-md: true
  warning: false
format:
  html:
    code-fold: true
    code-tools: true
---



## Background

The stock market is overflowing with data. There are many packages in R that allow us to get quick access to information on publicly traded companies. Imagine that you and a friend each purchased about \$1,000 of stock in three different stocks at the start of October last year, and you want to compare your performance up to this week. Use the stock shares purchased and share prices to demonstrate how each of you fared over the period you were competing (assuming that you did not change your allocations).

## Libraries


::: {.cell}

:::


## Picking

Decide the three stocks that your friend picks and the three that you pick.

**Me:** Apple: AAPL

Netflix: NFLX

Coka cola: COKE

**Friend**: Dollar Tree Corp: DG

Enphase Energy : ENPH

Disney: DIS


::: {.cell}

:::


## Create a charts

to show who is winning at each day of the competition.

### Individual Stock Performance


::: {.cell}
::: {.cell-output-display}
![](Case-Study-Stocks-Tidyquant_files/figure-html/unnamed-chunk-3-1.png){width=672}
:::

::: {.cell-output-display}
![](Case-Study-Stocks-Tidyquant_files/figure-html/unnamed-chunk-3-2.png){width=672}
:::
:::


### Comparing Gabriel Vs Friend Stock Performance


::: {.cell}
::: {.cell-output .cell-output-stdout}
```
# A tibble: 728 × 3
# Groups:   owner [2]
   owner  date        returns
   <chr>  <date>        <dbl>
 1 Friend 2022-10-03  0      
 2 Friend 2022-10-04  0.00855
 3 Friend 2022-10-05 -0.0333 
 4 Friend 2022-10-06 -0.00762
 5 Friend 2022-10-07 -0.00621
 6 Friend 2022-10-10  0.0108 
 7 Friend 2022-10-11 -0.00629
 8 Friend 2022-10-12 -0.0153 
 9 Friend 2022-10-13  0.0196 
10 Friend 2022-10-14 -0.0394 
# ℹ 718 more rows
```
:::

::: {.cell-output-display}
![](Case-Study-Stocks-Tidyquant_files/figure-html/unnamed-chunk-4-1.png){width=672}
:::

::: {.cell-output-display}
![](Case-Study-Stocks-Tidyquant_files/figure-html/unnamed-chunk-4-2.png){width=672}
:::
:::


## Conclusions

I picked Apple, Coca Cola and Netflix stocks. I see that the best performing stock is Coca Cola followed by Netflix. My friend´s stock did not perform so well with a loss on value for more than $200. for these two stocks: Dollar tree corporation and Enphase Energy.

In the aggregate, the graph suggests that I have a better performance over the months than my friend. My stocks returns are more positive than negative while my friend´s stoke tanked several times over this year.

The instruction did not mention to have tables but I think that would have helped to identify for how much I get more ROI than my friend. Anyway, just looking at the shape of the graph, it is evident that I´m better off.


