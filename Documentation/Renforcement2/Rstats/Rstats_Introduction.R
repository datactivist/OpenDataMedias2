# Mon premier script R
# Partie I: les bases


# Faire la somme de 20 et 365 et stocker dans une variable z
z = 20 + 365

calculer la longueur d'un vecteur :
length()

L'environnement de programmation propose de l'autocomplétion.
length

# 2 vecteur de taille 2 avec des chiffres qu'on va additionner et 
# mettre dans une variable vec
b = c(2, 3)
k = c(12, 5)
vec = k + b # Par defaut, R fait la somme element par element

# Creer une matrice de taille 4x2 (4 lignes et 2 colonnes)
## a:b sequence de a a b avec a < b
## exemple 1:4 ca va donner c(1, 2, 3, 4)
## aussi utiliser seq (equivalent a range en python) seq(3) == c(1, 2, 3)
a = matrix(1:8, ncol = 2)
a

# Une matrice 2x3 avec des chaines de caracteres
v = c("age", "poids", "nom", "fonction", "structure", "adresse")
m = matrix(v, nrow = 2, ncol = 3)
m

# selectionner des elements dans un vecteur et un matrice
m[2, 2] # element en ligne 2 et colonne 2
m[2, 1] # element en ligne 2 et colonne 1
x = 1:8
x[1] # premier element
v[6]


# Mini quizz
# Etape1: Faire un vecteur de taille 3 qui contient des chiffres
# Etape2: selectionner l'element 2 et appeler le y
# Etape3: Rajouter 20 a y et stocker dans z
v = c(4, 7, 5)
y = v[2]
z = y + 20
z

# Liste
l = list(1, "B", 10)
l

# creer une liste de 4 elements
# a c'est l'element 1 et il contient un vecteur numerique de taille 5
# b c'est une matrice de taile 2x2 de chaine de caractere
# c contient l'element 1, 4 du vecteur a
# d contient l'element en ligne 2 et colonne 1 de la matrice b
# afficher l'element d
a = c(5, 3, 2, 4, 1)
v = c("k", "r", "u", "s")
b = matrix(v, nrow = 2)
c = c(a[1], a[4]) ## alternatif
c = a[c(1, 4)]
d = b[2, 1]
f = list(a, b, c, d)
f

# Mon second script R
# Manipulation data.frame
pays = c("Madagascar", "Cote d'Ivoire", "Cameroun", 
         "Mauritanie", "France", "Cameroun", "Guinee", 
         "Togo", "Guinee", "Mali")
pop = c(24, 24, 24, 4, 67, 24, 12, 7, 12, 16)
demo = data.frame(pays, pop)
View(demo) ## voir la table avec Rstudio

# Choix des colonnes
demo$pays
demo$pop

# La ligne 2
demo[2, ]
demo[8, 1] ## index colonne
demo[8, "pays"] ## nom de colonne
names(demo)

## Quizz: Population Mauritanie
demo[4, 2]
