##including the library needed
library(tidyverse)
library(skimr)
library(janitor)
library(dplyr)
library(readxl)
library(ggplot2)


## now reading the excel file into the R studio

anz_data_excel <- read_excel("new_data_anz.xlsx")


##To make the data ready for plotting avg salary per age and gender
anz_data_new_excel_pay <- read_excel("bigquery_result_pay_data.xlsx")
anz_data_pay_1 <- anz_data_new_excel_pay %>% 
  select(age,gender,avg_pay) %>% 
  group_by(age,gender) %>% 
View(anz_data_pay_1)

ggplot(anz_data_pay_1,aes(x=gender ,y=avg_pay),fill=gender) +  geom_col(position = "dodge") + facet_wrap(~age)

## to make the data ready for plotting the sales/pos variations for  specific gender and age (purchasing behaviour)
anz_data_new_excel_sales <- read_excel("bigquery_result_sales_data.xlsx")
anz_data_sales_1 <- anz_data_new_excel_sales %>% 
  select(age,gender,avg_sales) %>% 
  group_by(age,gender)
View(anz_data_sales_1)
ggplot(anz_data_sales_1,aes(x=gender ,y=avg_sales),fill=gender) +  geom_col(position = "dodge") + facet_wrap(~age)



## to make the data ready for plotting the balance for specific gender and age

anz_data_balance_1 <- anz_data_excel %>% 
  select(balance,age,gender) %>% 
  group_by(age,gender) %>% 
  summarise(avg_balance=mean(balance))
View(anz_data_balance_2)
ggplot(anz_data_balance_2,aes(x=gender ,y=avg_balance),fill=gender) +  geom_col(position = "dodge") + facet_wrap(~age)



