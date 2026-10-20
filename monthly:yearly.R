#1. Years and months ranked by number of incidents
library(dplyr)
library(lubridate)
library(tidyverse)
mdy(fireballs$Date)
class(fireballs$Date)
arrange(fireballs, Date)
fireballs$Date2 <- mdy(fireballs$Date)
class(fireballs$Date2)
arrange(fireballs, Date2)
fireballs |>
  mutate(Year = year(Date2), Month = month(Date2)) |>
  count(Year, Month)
fireballs |>
  mutate(Year = year(Date2)) |>
  count(Year)
fireballs |> 
  mutate(Month = month(Date2)) |>
  count(Month)
# Month     n
#<dbl> <int>
#1     9
#2     8
#3     9
#4     8
#5     8
#6     3
#7     8
#8     6
#9     7
#10    10
#11     9
#12     7
library(ggplot2)
fireballs <- fireballs |>
  mutate(Year = year(Date2), Month = month(Date2, label = TRUE))
ggplot(data = fireballs, aes(x = Year)) + geom_bar()
ggplot(data = fireballs, aes(x = Month)) + geom_bar()
