##including the library needed
library(tidyverse)
library(skimr)
library(janitor)
library(dplyr)
library(readxl)
library(ggplot2)
## now reading the excel file into the R studio
anz_data_excel <- read_excel("new_data_anz.xlsx")
## To make the data ready for plotting 
anz_data_new <- anz_data_excel%>% 
  select(month,amount) %>% 
  group_by(month) %>% 
  summarise(avg_amount=mean(amount))
anz_data_new_2 <-anz_data_new %>%  slice(-c(4))
## plotting of graphs for Location/month Vs avg amount 
ggplot(data=anz_data_new)  + geom_point(mapping=aes(x=amount,y=long_lat))+ labs(title="Location Vs Transaction amount" , caption="Data by ANZ")+ theme(axis.text.y =element_text(angle=45))
ggplot(data=anz_data_new_2) +geom_point(mapping = aes(x=month,y=avg_amount),size=5.5 , color="Red") + labs(title="Month Vs Avg Amount" , caption ="DATA BY ANZ") + theme(axis.text.x =element_text(angle=45))

##new plot
anz_data_1 <- anz_data_excel %>% 
  select(txn_description,amount) %>% 
  group_by(txn_description) %>% 
  summarise(avg_amount=mean(amount))
anz_data_2 <- anz_data_1 %>%  slice(-c(7))

## now plotting the graph
ggplot(data=anz_data_2) +geom_point(mapping = aes(x=avg_amount,y=txn_description), size=5.5 ,color="red") + labs(title="Type of transaction Vs Avg Amount" , caption ="DATA BY ANZ") + theme(axis.text.x =element_text(angle=45))