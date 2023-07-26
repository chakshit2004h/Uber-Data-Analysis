install.packages("ggthemes")
install.packages("lubridate")
install.packages("tidyverse")
install.packages("DT")

library(ggplot2)
library(ggthemes)
library(lubridate)
library(dplyr)
library(tidyr)
library(tidyverse) # metapackage of all tidyverse packages
library(DT)
library(scales)


colors = c("#CC1011", "#665555", "#05a399", "#cfcaca", "#f5e840", "#0683c9", "#e075b0")
print(colors)

# Read the data for each month separately 
apr <- read.csv("C://Users//HP//Documents//python code//uber-raw-data-apr14.csv//uber-raw-data-apr14.csv")
may <- read.csv("C://Users//HP//Documents//python code//uber-raw-data-may14.csv//uber-raw-data-may14.csv")
june <- read.csv("C://Users//HP//Documents//python code//uber-raw-data-jun14.csv//uber-raw-data-jun14.csv")
july <- read.csv("C://Users//HP//Documents//python code//uber-raw-data-jul14.csv//uber-raw-data-jul14.csv")
aug <- read.csv("C://Users//HP//Documents//python code//uber-raw-data-aug14.csv//uber-raw-data-aug14.csv")
sept <- read.csv("C://Users//HP//Documents//python code//uber-raw-data-sep14.csv//uber-raw-data-sep14.csv")

# Combine the data together 
data <- rbind(apr, may, june, july, aug , sept)
cat("The dimensions of the data are:", dim(data))

print(head(data))

data$Date.Time <- as.POSIXct(data$Date.Time, format="%m/%d/%Y %H:%M:%S")
data$Time <- format(as.POSIXct(data$Date.Time, format = "%m/%d/%Y %H:%M:%S"), format="%H:%M:%S")
data$Date.Time <- ymd_hms(data$Date.Time)

# Create individual columns for month day and year
data$day <- factor(day(data$Date.Time))
data$month <- factor(month(data$Date.Time, label=TRUE))
data$year <- factor(year(data$Date.Time))
data$dayofweek <- factor(wday(data$Date.Time, label=TRUE))

# Add Time variables as well 
data$second = factor(second(hms(data$Time)))
data$minute = factor(minute(hms(data$Time)))
data$hour = factor(hour(hms(data$Time)))

# Look at the data
print(head(data))


