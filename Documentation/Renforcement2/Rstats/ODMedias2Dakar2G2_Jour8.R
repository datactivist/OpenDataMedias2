############################################################
# Ecoles Burkina ---------- précemment dans Open Data Médias 2
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
ecole2 %>%
  filter(annee == "2012-2013") %>% 
  group_by(Profession) %>% 
  summarise(Total = sum(effectifs)) -> test

# Je fais mon graph en mettant 'Profession' en x et 'Total' en y
ggplot(data = test) +
  geom_col(mapping = aes(x = Profession, y = Total))

####################################################
# Et maintenant, un nouvel épisode de la formation #
####################################################

glimpse(ecole2)

# Le geom geom_col prend deux variables discrètes. Par exemple :
ggplot(data = ecole2) +
  geom_point(mapping = aes(x = Garçons, y = Filles))

ecole %>% 
  # Je filtre pour ne garder qu'une année
  filter(annee == "2012-2013") %>% 
  # Je group_by Etablissement pour que chaque observation = 1 école
  group_by(Etablissement) %>% 
  # Je summarise pour avoir une variable TotalGarcons et une TotalFilles
  summarise(TotalGarcons = sum(Garçons), TotalFilles = sum(Filles)) -> test2

# Je regarde le résultat avec glimpse()
glimpse(test2)

ggplot(data = test2) +
  geom_point(mapping = aes(x = TotalGarcons,
                           y = TotalFilles, color = prioritaire)) +
  facet_grid(Regions ~ annee)

# Une façon plus rapide d'aller de la BDD au graph :
ecole %>% 
  filter(annee == "2012-2013") %>% 
  group_by(Etablissement) %>% 
  summarise(TotalGarcons = sum(Garçons), TotalFilles = sum(Filles)) %>%
  # Je peux appeler ggplot() après un pipe pour économiser une variable
  ggplot() +
  geom_point(mapping = aes(x = TotalGarcons, y = TotalFilles))

View(ecole)

ecole %>% 
  filter(annee == "2012-2013") %>% 
  group_by(Etablissement, Milieu, Statut) %>% 
  summarise(TotalGarcons = sum(Garçons), TotalFilles = sum(Filles)) %>%
  # Je peux appeler ggplot() après un pipe pour économiser une variable
  ggplot() +
  geom_point(mapping = aes(x = TotalGarcons,
                           y = TotalFilles, color = Statut)) +
  facet_wrap( ~ Milieu)


ecole %>% 
  filter(annee == "2012-2013") %>% 
  group_by(Etablissement, Milieu, Statut) %>% 
  summarise(Total = sum(Garçons+Filles)) %>%
  # Je peux appeler ggplot() après un pipe pour économiser une variable
  ggplot() +
  geom_histogram(mapping = aes(Total))

