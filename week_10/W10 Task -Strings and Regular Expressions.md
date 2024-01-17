---
title: "W10 Task: Strings and Regular Expressions"
author: "Gabriel Guerrero"
date: "November 14, 2023"
execute:
  keep-md: true
  warning: false
format:
  html:
    code-fold: true
    code-tools: true
---



## Resources
Readings
Chapter 14: R for Data Science—Strings: http://r4ds.had.co.nz/strings.html
RVerbalExpressions package: https://github.com/VerbalExpressions/RVerbalExpressions
regexr.com (optional): http://regexr.com/
Regular Expression examples (optional): https://qntm.org/files/re/re.html
Regular Expression support applet (optional): https://regex101.com/


## Background

Using g.r.e.p. (global regular expression print) and regular expressions (regex) to find character string patterns is a valuable tool in data analysis and is available with all operating systems and many different programming languages. It is a powerful tool once it is understood. The library(stringr) package makes these tools much easier to use.

## Process
The three tasks below can be completed in many different ways, but generally should not require many lines of code.

### Step 1

1. Use the readr::read_lines() function to read in each: string—randomletters.txt and randomletters_wnumbers.txt.

2. With the randomletters.txt file, pull out every 1700 letter (for example, 1, 1700, 3400, 5100, …) and find the quote that is hidden—the quote ends with a period.



::: {.cell}

:::

::: {.cell}
::: {.cell-output .cell-output-stdout}
```
 [1] "h" "e" " " "p" "l" "u" "r" "a" "l" " " "o" "f" " " "a" "n" "e" "c" "d" "o"
[20] "t" "e" " " "i" "s" " " "n" "o" "t" " " "d" "a" "t" "a" "." "z" " " "a" "n"
[39] "f" "r" "a"
```
:::
:::

3. With the randomletters_wnumbers.txt file, find all the numbers hidden, and convert those numbers to letters using the letters order in the alphabet to decipher the message. For example, a 1=a, 2=b,…, 26=z (Hint: the message starts with “experts”).

::: {.cell}
::: {.cell-output .cell-output-stdout}
```
[1] "expertsoftenpossessmoredatathanjudgment"
```
:::
:::


3. With the randomletters.txt file, remove all the spaces and periods from the string then find the longest sequence of vowels.


::: {.cell}
::: {.cell-output .cell-output-stdout}
```
[1] "oaaoooo"
```
:::
:::


## Conclusions

N/A
