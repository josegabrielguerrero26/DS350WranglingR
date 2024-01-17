---
title: "W12 Case Study: Distance Between Savior Names, Part 2"
author: "Gabriel Guerrero"
date: "December 02, 2023"
execute:
  keep-md: true
  warning: false
format:
  html:
    code-fold: true
    code-tools: true
editor_options: 
  chunk_output_type: inline
---



## Background

In 1978 Susan Easton Black stated, "Even statistically, he \[Christ\] is the dominant figure of the Book of Mormon."

With our "string" skills we are going to check her results and build an improved statistic using number of words between references.

## Process


::: {.cell}

:::

### Step1

Get the scripture text and savior name data into R. This is the exact same same scripture and Savior name data used in the "Distance Between Savior Names Part 1" task. (The code and data to read in the code is found there)


::: {.cell}

:::


### Step2

1.  Our ultimate goal will be to display the **distribution** of the distance between savior names for each book in the Book of Mormon (i.e. 15 different distributions). Ideally the plot should facilitate easy comparison between the distributions.

    -   This is very similar to what we did in [Part 1 task](https://byuistats.github.io/DS350_assignments/Task_21_savior_names1.html), except that there is a distribution for each book (15 total distributions) instead of just 1 overall distribution for the entire Book of Mormon text.


::: {.cell}

:::


### Step3

1.  Use the list of Savior names and the Book of Mormon text to find the distribution of words between references to the Savior for each book in the Book of Mormon.

    -   Split on each instance of a Savior name in the Book of Mormon.

    -   Then count the number of words between each instance.

    -   By nesting the data you can use the `purrr` package to do this efficiently while still keeping track of the book it belongs to - which is needed for the visualizations requested below.



::: {.cell}
::: {.cell-output .cell-output-stdout}
```
# A tibble: 10 × 4
# Groups:   book_title [1]
   book_title words mean  index
   <fct>      <int> <chr> <int>
 1 1 Nephi       38 53        1
 2 1 Nephi       17 53        2
 3 1 Nephi      135 53        3
 4 1 Nephi       21 53        4
 5 1 Nephi       94 53        5
 6 1 Nephi       18 53        6
 7 1 Nephi        8 53        7
 8 1 Nephi       94 53        8
 9 1 Nephi       73 53        9
10 1 Nephi        8 53       10
```
:::

::: {.cell-output-display}
![](W12-Case-Study-Distance-Between-Savior-Names,-Part-2_files/figure-html/unnamed-chunk-4-1.png){width=672}
:::
:::

::: {.cell}

:::


## Conclusions

The savior distribution varies with each book of the Book of Mormon. I see that Helaman has the longest distribution of all books while 4 Nephi has the longest. I think I am going to read 4 Nephi to learn more about Jesus.
