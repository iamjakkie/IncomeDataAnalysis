library("tidyverse")

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


data %>% filter(income==">50k") %>% count 

data %>% filter(income == "<=50k") %>% count

ggplot(data, aes(sex)) + geom_bar()
gender_income <- data %>% group_by(sex) %>% count(income) 
ggplot(gender_income, aes(sex,n)) + geom_boxplot()
