library("tidyverse")
library("skimr")
library("viridis")
library("scales")

data <- read_csv('Data/adult.data.txt', col_names = c("Age", "Workclass",
                                                      "fnlwgt","education", 
                                                      "educational_num", 
                                                      "marital_status", 
                                                      "occupation", 
                                                      "relationship", "race", 
                                                      "sex", "capital_gain",
                                                      "capital_loss", 
                                                      "hours_per_week", 
                                                      "native_country",
                                                      "income"))
head(data)

view(data)
data %>% filter(income==">50k") %>% count 

data %>% filter(income == "<=50k") %>% count

#EDA
#Workclass
ggplot(data, aes(x=Workclass, fill=income)) +
  geom_bar(position = "fill") +
  coord_flip()

#education
ggplot(data, aes(x=education, fill=income)) +
  geom_bar(position = "fill") +
  coord_flip()

#marital_status
ggplot(data, aes(x=marital_status, fill=income)) +
  geom_bar(position = "fill") +
  coord_flip()

#occupation
ggplot(data, aes(x=occupation, fill=income)) +
  geom_bar(position = "fill") +
  coord_flip()

#relationship
ggplot(data, aes(x=relationship, fill=income)) +
  geom_bar(position = "fill") +
  coord_flip()

#race
ggplot(data, aes(x=race, fill=income)) +
  geom_bar(position = "fill") +
  coord_flip()

#sex 
ggplot(data, aes(x=sex, fill=income)) +
  geom_bar(position = "fill") 

#native_country
income_by_country <- data %>% 
  group_by(native_country, income) %>% 
  summarise(count = n())

ggplot(income_by_country, aes(x=native_country, fill=count)) +
  geom_bar() +
  coord_flip()

ggplot(data, aes(sex)) + geom_bar()
gender_income <- data %>% group_by(sex) %>% count(income) 
ggplot(gender_income, aes(sex,n)) + geom_boxplot()

data %>%
  mutate(native_country = fct_lump_min(native_country, 100)) %>%
  group_by(native_country) %>%
  summarise(n = sum(income==">50K")/n())

# statistical
# Age
ggplot(data, aes(x=Age)) + 
  geom_histogram() 
#fnlwgt
ggplot(data, aes(x=fnlwgt)) + 
  geom_histogram() #might be useful to scale xlog10
#educational_num
ggplot(data, aes(x=educational_num)) +
  geom_histogram()
#capital_gain
ggplot(data, aes(x=capital_gain)) + 
  geom_histogram() 
#capital_loss
ggplot(data, aes(x=capital_loss)) +
  geom_histogram()
#hours_per_week 
ggplot(data, aes(x=hours_per_week)) +
  geom_histogram()
