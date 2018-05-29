prenoms <- c("Tobias","Fofana","Natacha","Nino","Salim","Tidiani","Alexandre","Gaston","Alain","Thomas")
age <- c(35,32,29,22,32,35,32,31,36,38)

dftest <- data.frame(prenoms,age)

# La fonction View() permet d'ouvrir une structure de données dans un onglet
View(dftest)

# Appeler des valeurs ou vecteurs par index
dftest[2,1]
dftest[2,]
dftest[,1]

# Appeler par le nom des variables
dftest$prenoms
dftest$age

age1 <- dftest$age

# Appeler le nom des variables
names(dftest)[1]

names(dftest)[1] <- "Prénoms"
names(dftest)
names(dftest)[2] <- "Âge"
names(dftest)

names(dftest) <- c("prenoms","age")
names(dftest)

library(dplyr)

filter(dftest, age >= 32)
typeof(dftest$age)

select(dftest,age)

mutate(dftest,PlusDe30 = (age > 30))

# Petits outils d'analyse
summary(dftest)
glimpse(dftest)

table(dftest$age)

library(ggplot2)

mpg
table(mpg$manufacturer)

View(mpg)

table(mpg$class)
filter(mpg, year > 2000)

filter(mpg, cyl >= 6)

table(mpg$trans)


names(mpg)

mpg %>% filter(manufacturer == "dodge") %>% 
  select(c(year,trans,class))

mpg %>% filter(cyl > 6) %>% 
  select(c(manufacturer,model,year,trans))



############################################################
# Ecoles Burkina
############################################################

library(tidyverse)

ecoles <- read_csv("ODMédias 2 Dakar Burkina Ecoles.csv",
                   col_names = FALSE, skip = 1,
                   locale = locale(encoding = 'latin1'))

ecoles
headers <- c("Regions","Provinces","Departements","Etablissement","annee",
             "prioritaire","Type","Statut","Milieu","Profession","Garçons","Filles")

names(ecoles) <- headers
ecoles

ecoles %>% mutate(effectifs = Garçons+Filles)-> ecoles2
ecoles2$effectifs

names(ecoles)

ecoles2 %>% group_by(Departements,Statut) %>% 
  summarise(total = sum(effectifs))

View(ecoles2)

ecoles2 %>% filter(annee == "2012-2013") %>% 
  group_by(Profession) %>% 
  summarise(Total = sum(effectifs)) -> test

 
ggplot(data = test) +
  geom_col(mapping = aes(x = Profession, y = Total))

############################################################
# Ecoles Burkina ---------- version simplifiée
############################################################
library(tidyverse)
# Je charge mes librairies
library(dplyr)
library(ggplot2)

# Je charge ma BDD
ecole <- read_csv("ODMédias 2 Dakar Burkina Ecoles.csv", skip = 1,
                  col_names = FALSE, locale = locale(encoding = 'latin1'))

headers <- c("Regions","Provinces","Departements","Etablissement","annee",
             "prioritaire","Type","Statut","Milieu","Profession",
             "Garçons","Filles")

names(ecole) <- headers

# Je rajoute une variable 'effectifs' et je stocke dans une nouvelle BDD
ecole %>% mutate(effectifs = Garçons+Filles)-> ecole2

# Je filtre pour garder une seule année
ecole2 %>% filter(annee == "2012-2013") %>% 
  group_by(Profession) %>% 
  summarise(Total = sum(effectifs)) -> test

# Je fais mon graph en mettant 'Profession' en x et 'Total' en y
ggplot(data = test) +
  geom_col(mapping = aes(x = Profession, y = Total))

