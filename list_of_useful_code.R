Useful_code
# CLASS BOOK https://r4ds.had.co.nz/workflow-projects.html
# Comment block: Shift + Crtl + C

#libraries

install.packages("USAboundariesData", repos = "https://ropensci.r-universe.dev", type = "source")
install.packages("tidyquant")# tidyquant financial analysis

library(downloader) # download 
library(ggplot2) # graphs
library(tidyverse)# cleaning
library(readxl) #read files
library(lubridate) # working with times
library(tidyquant) # finance
library(ggrepel) # titles
library(USAboundaries) # uS maps
library(sf) # mapping us maps
library(dplyr) #rankings
library(DT)# interactive graphs
library(stringi)# using text vector function such as stri_state_latex
install.packages("flexdashboard")
library(openxlsx)# write excel files

colnames()# nombre de columns
str() # name and type of columns
sort(df2$group_hour, decreasing = TRUE) #sorting columns
theme(legend.position = "top")+
  guides(fill=guide_legend(nrow=3,byrow=TRUE))#legends at the top with two rows


getwd()# directory location
setwd("D:/OneDrive - AVASA/BYU-I/DS 350 Data Wrangling/DS350_FA23_Guerrero_Gabr")# change directory locaciton

setwd("C:/Users/Gabriel Guerrero/OneDrive - AVASA/BYU-I/DS 350 Data Wrangling/DS350_FA23_Guerrero_Gabr")


filter(dataset, column=="", column>1, column <3) # filter
byu<- dfbyu%>% filter(!groups %in% c('Others'))# diferent from 

slice(dataset, n=5) # 4 rows randon
slice(dataset, 5) # 5 lines

set.seed (1234)# randon slide but always the same

arrange(diamond, price)
arrange(diamonds, desc(price))


select(diamonds,carat, price)
select(1:3)# select colomns 1-3


rename(diamonds, us_dollar== price) # rename columns

mutate(diamonds, vol_est= x*y*z) # add a column with multiplicaciton of x,y,z
mutate(diamonds, price_p_car=price/vol_est) #add column of division
%>% view()

mutate(diamons, if_else(color=="D"),1,0)
mutate(diamonds, mycol1= case_when(color=="D" ~1,
                                  color=="E" ~2,
                                  color=="F"~3,
                                  color =="G"~100,
                                  TRUE~ NA_real_)
       )
chart_1<- mutate(dfcom, age_references=case_when(
  age>= 0 & age <= 10 ~ "0-10",
  age>= 11 &age <= 20 ~ "11-20",
  age>= 21 & age <= 30 ~ "21-30",
  age> 30 ~ ">30",
  TRUE ~ "others"  ))

#AGGREGATIONS
summarise(diamonds, num_of_rows=n())
summarize(diamonds, avg_caract= mean(carts),
                    max_pice= max(carts))

#summaryze without missing values
summarize(business_time = n(),
          average_temp = mean(tmpf,na.rm = TRUE),
          average_temp2=mean(dwpf,na.rm = TRUE),)

summarize(diamonds, 
          num_of_rows = n(),
          distint_colosr = n_distinct(color),
          prop_over_1carat = mean(carat>1),# only the mean of carat great than1
          prop_colord = mean(color=="D"),
          prop_proci_range =mean(between(price,100,200))# <=100, <=
)
          
count(diamonds, color)
count(diamonds, color, cut)


#pipe operator carry one funtion to other "%>%"(and then)

diamonds %>%
    filter(color=="D")%>%
    count(cut)
    count(filter(diamonds, color=="D"),cut)
    
diamonds %>%
      filter(color=="D",
          between(carct, 0.75,1) %>%
      summarize(number_of_rows=n(),
                ave_carat=mean(carat),
                ave_rpice= mean(price)
                ))

a <- filter(flights,origin=="JFK"| origin=="EWR"| origin=="LGA", sched_dep_time<=1200)

#GRUPING OPERATIONS- depends on the level be careful with the count
group_by(diamonds, color)

diamonds %>%
    group_by(color,cut)%>%
    summarize(num_of_rows = n(),
              ave_carat = mean(carat),
              ave_price =mean(price))
ungroup() %>%
  mutate(count= n())

#What portion of the diamonds fits withing each color classificaction?
diamonds %>%
  group_by(color)%>%
  summarize(count= n())%>%
  mutate(total= sum(count),
        pct=(count/total))
  mutate_if(is.numeric, round, 1)


#Grap How many diamonds by cut classification are in the dataset?
diamonds %>%
    count(cut) %>%
  ggplot(aes(cut,n))+
  geom_col()

# separate funtion
separate(country, into=c("country", "continent", sep=", "))

#separating columns data types
separate(dutation, into = c("values","unit"), convert=TRUE)

#separating variou rows
separate_rows(ingredientes, sep = ", ")

#uniting data columns
unite("name", given_name, family_name, sep=" ")

# Save an object to a file
saveRDS(object, file = "my_data.rds")
# Restore the object
readRDS(file = "my_data.rds")

# Saving on object in RData format
save(data1, file = "data.RData")
# Save multiple objects
save(data1, data2, file = "data.RData")
# To load the data again
load("data.RData")

#save space
save.image(file = "my_work_space.RData")
#restore space
load("my_work_space.RData")


#TyDY- read files}*******************************************************************************

library(downloader)
library(readxl)
library(tidyverse)
download("https://github.com/fivethirtyeight/guns-data/raw/master/full_data.csv", dest="myxl.csv", mode="wb")

read_csv("myxl.csv")

#read zip file putting in temp and when push to git it will no go the data just the code
bob2<- tempfile()
bob_dir <-tempdir()

download("https://github.com/fivethirtyeight/guns-data/raw/master/full_data.zip", destfile=bob2,mode="wb")
unzip(bob2, exdir = bob_dir)
read_excel(paste(bob_dir,"myxl.xlsx", sep="/"))


download("https://github.com/fivethirtyeight/guns-data/raw/master/full_data.xls", dest="caffeine.xls", mode="wb")
getwd()
read_excel("caffeine.xls")

bob2<- tempfile()
download("https://github.com/fivethirtyeight/guns-data/raw/master/full_data.xls", 
         destfile=bob2,# temporary directory for files
         mode="wb")
read_excel("caffeine.xls")

#Inf	NA	NaN
is.finite()
is.infinite()
is.nan()


#ggplot
#| echo: false
#| fig-width: 10
#| fig-height: 5
#dfclean
dfseason <- filter(dfclean, month>0, month<=3)
dfseason <-na.omit(dfseason)
#dfseason

ggplot()+
  geom_bar(data=dfseason, mapping = aes(x=intent, fill=intent))+
  facet_wrap(~ year, nrow = 1)+
  coord_flip() + #change from horizontal to vertical a graph
  theme_classic()+
  ylab("# Incidents")+
  xlab("Race")+
  ggtitle("Cases by Sex and Race")+ theme(plot.title = element_text(hjust = 0.5))+# title
  guides(size=guide_legend("Counts of Incidents"))+
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))


#Anotation
ggplot(df2, aes(x=origin,y=arrival_mean)) +
  geom_point() +
  annotate("text",
           x = Inf, y = Inf,
           label = "Airport Origin and arrival mean.", vjust = "top", hjust = "right"
  )

#annotation2
annotations <- data.frame(
  xpos = c(-Inf,-Inf,Inf,Inf),
  ypos =  c(-Inf, Inf,-Inf,Inf),
  annotateText = c("Bottom Left (h0,v0)","Top Left (h0,v1)"
                   ,"Bottom Right h1,v0","Top Right h1,v1"),
  hjustvar = c(0,0,1,1) ,
  vjustvar = c(0,1,0,1)) #<- adjust



ggplot(data = df2)+
  geom_col(mapping = aes(x=origin,y=arrival_mean, fill = origin))+
  theme_bw()+
  ylab("# Mean")+
  xlab("Airports")+
  ggtitle("Flights Delta")+ theme(plot.title = element_text(hjust = 0.5))+ # title+
  geom_text(data=annotations,aes(x=xpos,y=ypos,hjust=hjustvar,vjust=vjustvar,label=annotateText))
  transition_time(year)# image with transition in time. use the package library(transformr) and (gganimate)

#well polish graph
p <- ggplot(data = df1)+
  geom_boxplot(mapping = aes(x=carrier, y=dep_delay, color=carrier))+
  geom_col(alpha=.8)
  theme_classic()+
  scale_colour_gradient(low = "red", high = "green")+
  coord_cartesian(ylim = c(-30, 10)) + 
  facet_wrap(~ origin, nrow = 3)+
  labs(title = "Flights", y = "Delays", x = "Airlines",
       subtitle="Flights from only 3 airports",
       caption ="Schedule times before 12:00AM")+
  theme(plot.title = element_text(hjust = 0.5))+
  theme(legend.position = "top")+
  
  guides(colour = guide_legend(nrow = 2, override.aes = list(size =2 )))+
  
  scale_x_continous(breaks= 2008:2018,
                    expand=expansion(add = c(0.4,0))) #control x axis
  scale_y_continuous(breaks = 0:6, #control y axis
                     label=paste(0:6, "Hours", sep=" "),
                     expand = expansion(mult = c(0,2)))+
    
    theme(axis.title= element_blank(),
        legend.title = element_blank(),
        legend.justification=top,
        axis.lines.y= element_blank(),
        axis.ticks.y=element_blank(),
        panel.grid.major.y=element_line(color="gray", linetype=3),
        plot.caption = element_text(color="gray", hjust=0, size=8),
        plot.title.position ="plot",
        plot.caption.position = "plot"
        
        ) # eliminate x and y axis and top justification legend
  
  
  p+labs(title="safasdf\n a",
         subtitle = "jksjdkf",
         caption = "hello")
  
  # Two legends names size and color
  p+labs(size="Amount", color="Size of something")
  p+guides(size = "none") # eliminate second legend
  scale_color_continuous(labels = scales::unit_format(unit = "", scale = 1e-3))# change numbers in legen text
  
  
  
  
  
  #ggplot with mean from column // side by side comparation 
  
  ggplot(data = dfutah)+
    geom_col(aes(x=schoolID, y=ave_adj_salary, fill=schoolID), 
             position='dodge', stat='summary', fun='mean')+
    labs(title = "Baseball Salaries", y = "Average Adjusted Salary", x = "Groups BYU vs Others")+
    theme(plot.title = element_text(hjust = 0.5))+
    scale_y_continuous(breaks =seq(0,7e06, by=1e6), 
                       labels = c("0","1 M","2 M", "3 M", "4M", "5M", "6M","7M"))+
    theme_bw()+
    coord_cartesian(ylim=c(7e4,9e04))# move the y size to zoom in the graph
  
  
#EXAMPLE OF GRAPH 2-----
  
  graf <- ggplot(data_2020, aes(log(gdp_per_cap),fruit_pp))+
    geom_point(aes(colour= continent, size=entity), size=2.1)+
    theme_bw()+
    theme(panel.grid = element_line(color = "#e2e2e2",
                                    size = 0.5,
                                    linetype = "dashed"),
          panel.grid.minor = element_blank(),
          legend.title = element_blank()
    )+
    
    coord_cartesian(ylim = c(0, 370))+
    scale_x_continuous(breaks = log(c(1000, 2000, 5000, 10000, 20000, 50000, 100000)),
                       labels = c("$1,000", "$2,000", "$5,000", "$10,000", "$20,000","", "$100,000"), trans = "log")+
    
    scale_y_continuous(breaks =seq(0,350, by=50), 
                       labels = c("0 kg","50 kg", "100 kg", "150 kg", "200 kg","250 kg","300 kg", "350 kg"),
                       expand=expansion(add = c(0.4,0)))+
    
    scale_color_manual(values = c("#a2559c","#00847e", "#4c6a9c", "#e56e5a","#9a5129","#883039"))+
    guides(color = guide_legend( 
      override.aes=list(shape = 15, size=3)))
  
  graf+ labs(title="Fruit consumption vs. GDP per capita, 2020",
             subtitle = "Average per capita fruit consumption, measured in kilograms per year versus gross domestic
product (GDP) per capita, measured in constant international-$.",
caption = "Source: Food and Agriculture Organization of the United Nations, Data compiled from multiple sources by World Bank
OurWorldInData.org/diet-compositions • CC BY")+
    ylab("Fruit supply per person")+
    xlab("GDP per capita")+
    theme(
      plot.caption = element_text(color="black", hjust=0, size=9, lineheight = 1.2),
      plot.caption.position = "plot",
      plot.title.position ="plot",
      plot.title = element_text(face="bold", color="black", hjust=0, size=15, lineheight = 1.2),
      legend.text = element_text(size=12),
      legend.justification = "top",
      plot.subtitle = element_text(color="black", hjust=0, size=11, lineheight = 1),
      axis.text = element_text(size=11, lineheight = 2),
      axis.text.x = element_text(margin = margin(t = 0, r = 20, b = 2, l = 0),hjust = .6,lineheight = 1),
      axis.text.y = element_text(margin = margin(r = 0)),
      panel.border = element_blank(), axis.line = element_line(colour = "black"),
      axis.line.y = element_blank(),
      axis.ticks =element_blank()
      
    )
  
  
  
# GGPLOT example 3-----
#order the bar from higher to lower.
ggplot(data = bfm2, mapping = aes(x=reorder(book_title,BOM_words), y =BOM_words, fill=book_title)) +
    coord_flip() +
    geom_col() +
    labs(x = "Books",
         y = "# of Words",
         title = "Number of words per verse in the Book of Mormon")+
    theme(plot.title = element_text(hjust = 0.5),
          plot.subtitle = element_text(hjust = 0.5),
          legend.text  = element_blank(),
          legend.position = "none")
  
#label in ggplot
  label <- data.frame(
    waiting = c(55, 80), 
    eruptions = c(2, 4.3), 
    label = c("peak one", "peak two")
  )
  
  ggplot(faithfuld, aes(waiting, eruptions)) +
    geom_tile(aes(fill = density)) + 
    geom_label(data = label, aes(label = label))
  
  
  #anotate with a pointing line
  
  p + 
    annotate(
      geom = "curve", x = 4, y = 35, xend = 2.65, yend = 27, 
      curvature = .3, arrow = arrow(length = unit(2, "mm"))
    ) +
    annotate(geom = "text", x = 4.1, y = 35, label = "subaru", hjust = "left")
  
  
  #legends inside the grid area 
  
  ggplot(mpg, aes(displ, hwy, colour = class)) + 
    geom_point()
  
  ggplot(mpg, aes(displ, hwy, colour = class)) + 
    geom_point(show.legend = FALSE) +
    directlabels::geom_dl(aes(label = class), method = "smart.grid")
  
  
  #circles of legends
  ggplot(mpg, aes(displ, hwy)) +
    geom_point() + 
    ggforce::geom_mark_ellipse(aes(label = cyl, group = cyl))
  
  #highlight only 3 lines in ggplot
  data(Oxboys, package = "nlme")
  ggplot(Oxboys, aes(age, height, group = Subject)) + 
    geom_line() + 
    geom_point() + 
    gghighlight::gghighlight(Subject %in% 1:3)
  
  #Example graph 3- time series
  
  p<-ggplot(data = df2_day)+
    geom_line(aes(x=group_day,y=amount, color=Name))+
    stat_summary(aes(x=group_day,y=amount,colour="mean",group=1), fun.y=mean, geom="line", colour="black",linetype = "solid", size = 1.1)+
    theme_classic()+
    ylab("Amount in US dollars")+
    xlab("Days")+
    ggtitle("Business Revenue Idaho by Day")+ theme(plot.title = element_text(hjust = 0.5))+
    guides(color=guide_legend("Name of the Busines"))
  
  p+ labs(tag = " ― Average")+
    coord_cartesian(clip = "off") +
    theme(plot.tag.position = c(.86, .25))
  
  
#grpah 4 independent lines + percentages y axis
  ggplot(data = dfcsm)+
    geom_area(data = dfcsm[dfcsm$owner == "Friend", ], aes(x=group_month, y=returns, fill="Friend"))+
    geom_line(data = dfcsm[dfcsm$owner == "Gabriel", ], aes(x=group_month,y=returns, color="Gabriel"), size=1)+
    theme_classic()+
    ylab("Montly Returns in Percentages")+
    xlab("Year- Month")+
    labs(fill = NULL, 
         color = NULL)+
    ggtitle("My vs Friend Montly Returns")+ theme(plot.title = element_text(hjust = 0.5))+
    scale_x_date(date_labels = "%b/%y", breaks = "1 months")+
    theme(axis.text.x = element_text(angle=45, hjust = 1))+
    #geom_line(aes(x=group_month, y=returns,color=owner)) 
    scale_color_manual(values = "#4287f5") +
    scale_fill_manual(values = "#9da1a6")+
    # Changing Y-axis to percentage
    scale_y_continuous(labels = scales::percent)
  
  
  
  
  
# WEEK 5 EXPLORATORY ANALYSIS -----
#If variation describes the behavior within a variable, covariation describes the behavior between variables. Covariation is the tendency for the values of two or more variables to vary together in a related way
#*

#"Visualizing Distributions"
#Categorical variable use bar
  
ctm2 <- clean_names(flight)  #with janitor library clean the columns spaces
  
  
ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut))
diamonds%>%
  count(cut)

#Continous variable use histograms
ggplot(data = diamonds) +
  geom_histogram(mapping = aes(x = carat), binwidth = 0.5)   
diamonds %>% 
  count(cut_width(carat, 0.5))
    
#replace missing values
diamonds2 <- diamonds %>% 
  mutate(y = ifelse(y < 3 | y > 20, NA, y))
  
 #suppressing warning when missing values
ggplot(data = diamonds2, mapping = aes(x = x, y = y)) + 
  geom_point(na.rm = TRUE)

#making missing values visible 
nycflights13::flights %>% 
  mutate(
    cancelled = is.na(dep_time),
    sched_hour = sched_dep_time %/% 100,
    sched_min = sched_dep_time %% 100,
    sched_dep_time = sched_hour + sched_min / 60
  ) %>% 
  ggplot(mapping = aes(sched_dep_time)) + 
  geom_freqpoly(mapping = aes(colour = cancelled), binwidth = 1/4)

#density
ggplot(data = diamonds, mapping = aes(x = price, y = ..density..)) + 
  geom_freqpoly(mapping = aes(colour = cut), binwidth = 500)



#*************/ WEEK 6 JOIINS /************************


planes %>% # look for repeated data
  count(tailnum) %>% 
  filter(n > 1)

beatles1 %>% bind_cols(beatles2)# bin column that align.
band %>% bind_rows(band2)# bin rows that align.
band %>% left_join(instrument, by = "name") # left join
band %>% right_join(instrument, by = "name") # right join
band %>% inner_join(instrument, by = "name")#inner join
band %>% semi_join(instrument, by = "name")#returns every row in the first data set that has a match in the second data set
band %>% anti_join(instrument, by = "name")# it returns all of the rows in the first data set that do not have a match in the second data set.
instrument %>% distinct(plays)# returns the distinct values of a column.
df2 <- emp_df %>% inner_join( dept_df, 
                              by=c('dept_id'='dept_id', 
                                   'dept_branch_id'='dept_branch_id'))



#Week 7- HOURS -------------
ymd_hms("2017-01-31 20:11:59")
#> [1] "2017-01-31 20:11:59 UTC"
mdy_hm("01/31/2017 08:01")
#> [1] "2017-01-31 08:01:00 UTC"

make_datetime_100 <- function(year, month, day, time) {
  make_datetime(year, month, day, time %/% 100, time %% 100)
}
#create times
flights_dt <- flights %>% 
  filter(!is.na(dep_time), !is.na(arr_time)) %>% 
  mutate(
    dep_time = make_datetime_100(year, month, day, dep_time),
    arr_time = make_datetime_100(year, month, day, arr_time),
    sched_dep_time = make_datetime_100(year, month, day, sched_dep_time),
    sched_arr_time = make_datetime_100(year, month, day, sched_arr_time)
  ) %>% 
  select(origin, dest, ends_with("delay"), ends_with("time"))
#work with overnights
flights_dt <- flights_dt %>% 
  mutate(
    overnight = arr_time < dep_time,
    arr_time = arr_time + days(overnight * 1),
    sched_arr_time = sched_arr_time + days(overnight * 1)
  )

#changing character to times
str(myticks)                                 
myticks$date <-as.Date(myticks$date, format = "%Y-%m-%d")+ 
  
scale_x_date(date_labels = "%B", breaks = "1 months")+ # graph times
theme(axis.text.x = element_text(angle=45, hjust = 1))


#time zome
Sys.timezone()
(x1 <- ymd_hms("2015-06-01 12:00:00", tz = "America/New_York"))
(x2 <- ymd_hms("2015-06-01 18:00:00", tz = "Europe/Copenhagen"))

x4a <- with_tz(x1, tzone = "Australia/Lord_Howe")#change time zone to a variable

dfc1$hours <- format(dfc1$group_hour,"%H:%M:%S")   #change format to only hours, minutes and seconds


#CHECKING a DATABASE
summary(df1)
str(df1)

hist(df1$amount,
     xlab = "time",
     main = "Histogram of time",
     breaks = sqrt(nrow(df1))
)
which(is.na(df1))# checking missing values in all vector be careful how full is
sum(is.na(df1))# give a resume if missing values
colSums(df1==0) # give a resume with sum of ceros



#WEEK 8 US MAPS with library(USAboundaries)-----------
states <-  (states <- us_states())
states
states <- states %>% 
  filter(
    
    state_name %in% state.name,
    state_name != "Hawaii",
    state_name != "Alaska")

# variable with selected states
contemporary_ne <- us_states(states = c("Massachusetts", "Vermont", "Maine",
                                        "New Hampshire", "Rhode Island",
                                        "Connecticut"))
ggplot(data=states)+
  geom_sf(aes(group = state_name))+
  geom_sf(data=rankcities,aes(group = city,size=population, color=population))+
  labs(title = "US MAP Excluding ALaska and Hawaii")+
  theme_bw()


#dowload and read SHP file datasets GEO MAPS

wells <- "https://byuistats.github.io/M335/data/Wells.zip"
df <- tempfile(); uf <- tempfile()
download(wells, df, mode = "wb")
unzip(df, exdir = uf)
wells <- read_sf(uf)

#reordering x axis 
ggplot(df, aes(x = reorder(f.name, -age), y = age))

# display unique values from the same column
unique(permits$variable)

#delete 13,14 columns
county <- county[,-c(13,14)]

#WEEK 9 Interactive Graphs-----------

#interactive line with numbers
library(dygraphs)
lungDeaths <- cbind(mdeaths, fdeaths)
dygraph(lungDeaths)

#interactive table
library(DT)
library(tidyverse)
datatable(iris)

#interactive line with bar
dygraph(lungDeaths) %>%
  dySeries("mdeaths", label = "Male") %>%
  dySeries("fdeaths", label = "Female") %>%
  dyOptions(stackedGraph = TRUE) %>%
  dyRangeSelector(height = 20)



#intractive with low windows
library(quantmod)

tickers <- c("AAPL", "NFLX", "COKE")
getSymbols(tickers)
closePrices <- do.call(merge, lapply(tickers, function(x) Vo(get(x)))) #VO volumen
dateWindow <- c("2018-01-01", "2023-01-01")

dygraph(closePrices, main = "Volume of Stocks", group = "stock") %>%
  dyRebase(value = 100) %>%
  dyRangeSelector(  height = 20, dateWindow = dateWindow)%>%
  dyShading(
    from = "2022-07-22",
    to = "2022-08-02",
    color="red")%>%
  dyShading(
    from = "2022-04-17",
    to = "2022-05-22",
    color="red")%>%
  dyLegend(
    show = "always",
    hideOnMouseOut = TRUE)

#holt winter forecast
hw <- HoltWinters(ldeaths)
p <- predict(hw, n.ahead = 72, prediction.interval = TRUE)

dygraph(p, main = "Predicted Lung Deaths (UK)") %>%
  dySeries(c("lwr", "fit", "upr"), label = "Deaths")

#EXAMPLE USING MAPS LEAFLET

leaflet() %>%
  setView(lng = -100, lat = 60,zoom = 3.45) %>%
  addTiles()%>%
  addMarkers(data=df,~long, ~lat, popup = ~as.character(death_rate), label = ~as.character(province))

#circles in the MAP
pal <- colorNumeric(
  palette = "viridis",
  domain = df$confirmed
)

leaflet() %>%
  setView(lng = -100, lat = 60,zoom = 3.45) %>%
  addTiles()%>%
  addCircles(data=df, ~long,~lat, 
             radius = ~sqrt(confirmed)*100,
             label = ~paste(province, death_rate),
             color=  ~pal(confirmed),
             fillOpacity = 1)



#interactive years 
map_with_animation <- p +
  transition_time(year) +
  ggtitle('Year: {frame_time}',
          subtitle = 'Frame {frame} of {nframes}')
num_years <- max(dfpstate$year) - min(dfpstate$year) + 1
animate(map_with_animation, nframes = num_years)


#week10: WORKING WITH STRINGTS-----------
library(tidyverse) Strings


cat("Hidden Quote:", new1)# glue and type a phrase

str_c("x", "y", sep = ", ")# combining strings
str_c(c("x", "y", "z"), collapse = ", ") #collapsing
str_view(c("grey", "gray"), "gr(e|a)y")# return grey and gray
str_view(x, "^apple$")# return the whole word ^for beginning and $ for end
sum(str_detect(words, "^t"))# how many words start with t
mean(str_detect(words, "[aeiou]$"))## What proportion of common words end with a vowel?
df %>% 
  filter(str_detect(word, "x$"))# filter words ends with x
str_replace(x, "[aeiou]", "-")#replace first maching
str_replace_all(x, "[aeiou]", "-")#repacing all maching

#counting vowels and consonants
df %>% 
  mutate(
    vowels = str_count(word, "[aeiou]"),
    consonants = str_count(word, "[^aeiou]"))
#Split
sentences %>%
  head(5) %>% 
  str_split(" ")

library(tidyverse) factor
#sorting months in a factor level to order appropiatelly
month_levels <- c(
  "Jan", "Feb", "Mar", "Apr", "May", "Jun", 
  "Jul", "Aug", "Sep", "Oct", "Nov", "Dec")
y1 <- factor(x1, levels = month_levels)

sort(y1)#> Levels: Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec

#use factor in a geom_point to order the series
rincome_summary <- gss_cat %>%
  group_by(rincome) %>%
  summarise(
    age = mean(age, na.rm = TRUE),
    tvhours = mean(tvhours, na.rm = TRUE),
    n = n()
  )

ggplot(rincome_summary, aes(age, fct_reorder(rincome, age))) + geom_point()


#order in increasing frequency
gss_cat %>%
  mutate(marital = marital %>% fct_infreq() %>% fct_rev()) %>%
  ggplot(aes(marital)) +
  geom_bar()

#reorden by count from less to more
gss_cat %>%
  mutate(partyid = fct_recode(partyid,
                              "Republican, strong"    = "Strong republican",
                              "Republican, weak"      = "Not str republican",
                              "Independent, near rep" = "Ind,near rep",
                              "Independent, near dem" = "Ind,near dem",
                              "Democrat, weak"        = "Not str democrat",
                              "Democrat, strong"      = "Strong democrat"
  )) %>%
  count(partyid)


#eliminate spaces
text1 <- str_replace_all(text1, " ", "")
text1 <-gsub(" ", "", text1)

LETTERS[v2]# numbers into letters

#split string in subvector and count numnbers
scr1<- names%>%
  mutate(split=strsplit(names$name, " "))%>%
  mutate(number=lengths(gregexpr("\\W+", split)),
         count=row_number())# adding a row number column



str_remove_all("e|a")%>% str_length()#remove e and a and count 
str_extract_all("([:alpha:])\\1\\1")#extract only letter that repeat twice 
str_split(pattern = "")%>% unlist()%>%class() # unlist= vector, Class= list 


#Final Project ------------------------------------------------

rev_c$revenue = gsub("\\$", "", rev_c$revenue) #eliminate $

rev_c$revenue = gsub("\\,", "", rev_c$revenue)# eliminate commnas

rev_c$revenue%>% as.numeric(rev_c$revenue) # making numeric

rev_d<-subset(rev_c, select = -c(revenue,dates_f,country,code))# select all minus this


geom_text(data=bom, aes(x=book_title, y=words, label=mean))
scale_y_continuous(breaks =c(0,10,100, 1000),
                     limits = 1,1200,
                     expand = expand_scale(mult = c(1, 100),
                                           add = c(1, 1000)))
#week 11------------------------------------------------

rmarkdown::render("diamond-sizes.Rmd", output_format = "word_document")


 function(x, y, op) {
   switch(op,
     plus = x + y,
     minus = x - y,
     times = x * y,
     divide = x / y,
    stop("Unknown op!")
 )
 }
#function show missing
show_missings <- function(df) {
  n <- sum(is.na(df))
  cat("Missing values: ", n, "\n", sep = "")
  invisible(df)
}
show_missings(mtcars)

f <- function(x) {
  x + y
} 
y <- 100
f(10)


#week 12------------------------------------------------

#creating a function to count a word
count_word <- function(word_to_count){
  bomnt%>%
    mutate_(jcount=str_count(scripture_text,word_to_count)) %>%
    group_by(volume_title)%>%
    summarise(jtotal=sum(jcount))
  
}
count_word("Jesus")# calling

# making the function more robust
count_word <- function(script_data, word_to_count){
  script_data%>%
    mutate_(jcount=str_count(scripture_text,word_to_count)) %>%
    group_by(volume_title)%>%
    summarise(jtotal=sum(jcount))
  
}
count_word(data, "Jesus")# calling

# making the function group by 1 column
count_word <- function(script_data, word_to_count, group_col){
  script_data%>%
    mutate_(jcount=str_count(scripture_text,word_to_count)) %>%
    group_by({{group_col}})%>%
    summarise(jtotal=sum(jcount))
  
}
count_word(script_data=data,word_to_count= "Jesus", group_col=book_title)# calling



# making the function group by many things
count_word <- function(script_data, word_to_count, ...){
  script_data%>%
    mutate_(jcount=str_count(scripture_text,word_to_count)) %>%
    group_by(...)%>%
    summarise(jtotal=sum(jcount))
  
}
count_word(script_data=data,word_to_count= "Jesus", volume_title, book_title)# calling

# Nesting data
N_iris<- iris%>% group_by(Species)%>% nest()# the the group with a table

mymean<- function(input_data){
  mean(input_data$sepal.width)
}
N_iris%>% mutate(amean=map_dbl(data,mymean)) # make calculation in the nested table

#Unnest
N_iris%>% mutate(amean=map_dbl(data,mymean))%>% select(-data)
N_iris%>% mutate(amean=map_dbl(data,mymean))%>% unnest(data)#unnest with new column and keeping the values of the calculation


#example LM

mymodel<- function(df){
  lm(formula = Sepal.Width~., data=df)
}
N_iris%>% mutate(model=map(data,mymodel))%>% pluck("model",1)

#only one data in the nested list
mymodel<- function(df){
  lm(formula = Sepal.Width~., data=df)$coefficients(1)
}
N_iris%>% mutate(model=map(data,mymodel))%>%select(-data)%>% unnest(model)
N_iris%>% mutate(model=map_dbl(data,mymodel))%>% unnest(model)%>%view()


#stas latex
stri_stats_latex(sentences[1:10])["words"] #no vectorized function
str_count(sentences[1:10]) #example of vectorized

sentences(1:10)%>%
    tibble(text=.)%>%
    group_by(text)%>%
    mutate(words=stri_stats_latex(text)["words"])

#purr
count_words<-function(x){stri_stats_latex(x)["words"]}
sentences(1:10)%>%
  tibble(text= .)%>%
  group_by(text)%>%
  mutate(words=map_int(text,count_words))


dfp %>% select(open_hours) %>% stri_stats_latex()



##two axis and visits
ggplot()+
  geom_col(data=dfdays,aes(x=Day, y=visits))

ggplot(dfdays,aes(x=Day, y=visits))+
  geom_point()+
  #stat_summary(fun.y = "sum", geom = "point", shape = 1, size = 4)+
  scale_y_continuous(
    
    # Features of the first axis
    name = "Sum",
    
    # Add a second axis and specify its features
    sec.axis = sec_axis( ~ .,
                         # breaks = seq(1, 80, by = 10),
                         name="Average")
  ) +
  theme(axis.text.y  = element_text(color = 'blue'),
        axis.title.y = element_text(color='blue'),
        axis.text.y.right =  element_text(color = 'red'),
        axis.title.y.right = element_text(color='red'))



## same graph two series
ggplot(rbind(dat1,dat2), aes(month(date, label=TRUE, abbr=TRUE), 
                             value, group=factor(year(date)), colour=factor(year(date)))) +
  geom_line() +
  geom_point() +
  labs(x="Month", colour="Year") +
  theme_classic()

# save pdf or other formart a ggplot image
ggsave("myplot.pdf", plot = p, width = 15, height = 8, units = "in")

#Limit x and y continous

ggplot() +
  geom_col(data = dffuera, aes(x = day, y = Diferencia)) +
  scale_y_continuous(breaks = seq(0, 0.06, by = 0.01),
                     labels = c("0%","1%","2%","3%","4%","5%","6%"),
                     limits = c(min(0), max(.06))
  )+
  scale_x_continuous( breaks = seq(0, 20, by = 1))+
  labs(title = "% Diferencia Fuera de Servicio 2022 vs 2023", y = "% ", x = "Dias") +
  theme(axis.text.x = element_text(angle = 0, vjust = 0.5, hjust = 1))+
  coord_flip()

#scale_x_dates
scale_x_date(date_labels = "%b-%y", breaks="1 month")


#autoplot get the best graph for the information 
autoplot(monthlyforescast) +
  labs(title = "Monthly Forecast",
       x = "Date",
       y = "Values") +
  theme_minimal()