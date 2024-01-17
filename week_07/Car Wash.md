---
title: "Car Wash"
author: "Gabriel Guerrero"
date: "October 22, 2023"
execute:
  keep-md: true
  warning: false
format:
  html:
    code-fold: true
    code-tools: true
---



## 1. Background

A car wash business based in Rexburg, Idaho USA wants to see if the temperature hurts their bottom line. They have point of sale data for the months of April, May, June, and July. You will need to aggregate the data into hourly sales totals and merge the sales data together with the temperature data to provide insight into the relationship between temperature and car wash sales.

## 2. Load Packages


::: {.cell}

```{.r .cell-code}
library(tidyverse)
library(lubridate)
library(downloader)
```
:::


## In a R markdown file, read in the car wash data


::: {.cell}
::: {.cell-output .cell-output-stdout}
```
tibble [533 × 5] (S3: tbl_df/tbl/data.frame)
 $ name         : chr [1:533] "SplashandDash" "SplashandDash" "SplashandDash" "SplashandDash" ...
 $ type         : chr [1:533] "Services" "Services" "Services" "Services" ...
 $ time         : POSIXct[1:533], format: "2016-05-13 20:27:00" "2016-05-13 20:27:00" ...
 $ amount       : num [1:533] 1 0 23.6 18.9 23.6 ...
 $ business_time: POSIXct[1:533], format: "2016-05-13 15:27:00" "2016-05-13 15:27:00" ...
```
:::

::: {.cell-output .cell-output-stdout}
```
integer(0)
```
:::

::: {.cell-output .cell-output-stdout}
```
[1] 0
```
:::

::: {.cell-output .cell-output-stdout}
```
         name          type          time        amount business_time 
            0             0             0             2             0 
```
:::

::: {.cell-output-display}
![](Car-Wash_files/figure-html/unnamed-chunk-2-1.png){width=672}
:::
:::


## Use riem_measures(station = "RXE", date_start = , date_end = ) for station RXE from library(riem) to get the Rexburg temperatures for the relevant dates. 



::: {.cell}

```{.r .cell-code}
#riem temperatures
temp <-riem::riem_measures	(station = "RXE", date_start = "2016-05-13", date_end = "2016-07-18")
temp1<- mutate(temp, group_hour= ceiling_date(valid, "hour"))

#temp1
temp2<-temp1 %>%
    group_by(group_hour)%>%
    summarize(business_time = n(),
              average_temp = mean(tmpf,na.rm = TRUE),
              average_temp2=mean(dwpf,na.rm = TRUE),)
#temp2

dfc<- df2 %>%
      inner_join(temp2,by=c('group_hour'='group_hour'))
head(dfc,5)
```

::: {.cell-output .cell-output-stdout}
```
# A tibble: 5 × 6
  group_hour          business_time.x amount business_time.y average_temp
  <dttm>                        <int>  <dbl>           <int>        <dbl>
1 2016-05-13 16:00:00               2    1                13           72
2 2016-05-16 10:00:00               1    0                13           54
3 2016-05-16 13:00:00               3   66.0              13           60
4 2016-05-16 15:00:00               1   23.6              13           58
5 2016-05-16 17:00:00               4  127.               13           55
# ℹ 1 more variable: average_temp2 <dbl>
```
:::
:::

## Graph 1


::: {.cell}

```{.r .cell-code}
ggplot(data=dfc)+
  geom_point(aes(x=group_hour, y=average_temp, size=amount, color=amount))+
 theme_bw()+
  ylab("Temperature in Fahrenheit ")+
  xlab("Dates")+
  ggtitle("Car Wash Analysis")+ theme(plot.title = element_text(hjust = 0.5))+# title+
  labs(color="Revenue Amount")+
  guides(size="none")+
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1)
  )
```

::: {.cell-output-display}
![](Car-Wash_files/figure-html/unnamed-chunk-4-1.png){width=672}
:::
:::

## Graph 2

::: {.cell}

```{.r .cell-code}
dcf1 <-dfc

dcf1$hours <- format(dcf1$group_hour,"%H:%M:%S")

ggplot(data=dcf1)+
  geom_point(aes(x=hours, y=average_temp, size=amount, color=amount))+
scale_colour_gradient(low = "red", high = "green")+
 theme_classic()+
  ylab("Temperature in Fahrenheit ")+
  xlab("Hours of the Day")+
  ggtitle("Car Wash Anlaysis")+ theme(plot.title = element_text(hjust = 0.5))+# title+
  labs(color="Revenue Amount")+
  guides(size="none")+
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1)
)        
```

::: {.cell-output-display}
![](Car-Wash_files/figure-html/unnamed-chunk-5-1.png){width=672}
:::
:::




## Conclusions
Looking at the graphs, it seems that there is a relationship between seasons and car wash. In the first graph, as the temperature increase and the summer begins there are more sales. In the second graph, the hours is a huge deal for the car wash hours. I´d increase my workforce between 13:00pm and 18:00pm where the operations is concentrated. 


