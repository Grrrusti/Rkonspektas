
#
#   Dalykas: STATISTIN�S DUOMEN� ANALIZ�S SISTEMA IR PROGRAMAVIMO KALBA R
#            �vair�s kintam�j� i� teksto nuskaitymo b�dai.
#
#  Autorius: Tomas Reka�ius
#
#   Sukurta: 2013-07-08 | 2013-07-12
#


# TURINYS -------------------------------

#
#   1. Duomen� �vedimas i� klaviat�ros:
#      * komanda c
#      * proced�ra scan
#
#   2. Duomen� importavimas kopijuojant:
#      * komanda clipboard
#      * proced�ra readClipboard
#
#   3. Duomen� nuskaitymas i� teksto:
#      * parametras text
#      * funkcija textConnection
#


# PASTABOS ------------------------------

#
# Kol kas pastab� n�ra.
# 


# NUSTATYMAI ----------------------------

# Nustatoma lietuvi�ka lokal�. 
Sys.setlocale(locale = "Lithuanian")

# Nustatomas darbinis katalogas.
setwd("C:/Downloads")

# I�trinami visi seni kintamieji.
rm(list = ls())


# --------------------------------------- #
# DUOMEN� �VEDIMAS I� KLAVIAT�ROS         #
# --------------------------------------- #

# Tiesiai i� klaviat�ros �vedami nedideli duomen� rinkiniai. Paprastai tai yra
# kelet� element� turintis vektorius, kuris sudaromas naudojant komanda c.

x <- c(2, 3, 5, 7, 11, 13, 17, 19)


# Toks b�das paprastas ir labai da�nai naudojamas, ta�iau d�l �vairi� prie�as�i� 
# netinka dideliems duomen� masyvams. Kartais pasitaiko situacija, kai vektoriaus 
# reik�m�s �vedamos tiesiai i� klaviat�ros. Tada galima panaudoti proced�r� scan. 

x <- scan() 

# Vektori� sudarantys elementai ra�omi konsol�je ir �vedami paspaud�iant klavi�� 
# Enter. � vien� eilut� galima sura�yti kelis tarpu atskirtus elementus. Reik�mi� 
# �vedimas nutraukiamas klavi�� Enter paspaudus du kartus i� eil�s. 

x


# Pa�iu papras�iausiu atveju taip galima �vesti tik i� skai�i� sudaryt� vektori�. 
# Norint �vesti kitokio tipo reik�mes, riboti j� skai�i� ar pan., reikia pakeisti 
# tam tikrus proced�ros scan parametrus. Kai kurie i� j�:
#
#    what -- vektoriaus reik�mi� tipas: numeric(), character() ir kiti,
#     sep -- vektoriaus elementus atskiriantis simbolis, pagal nutyl�jim� tarpas,
#       n -- maksimalus vektoriaus element� skai�ius.

# Pavyzd�iui, simbolini� reik�mi� �vedimui i� klaviat�ros, parametro what reik�m�
# pakei�iame � character(). Jei vektoriaus reik�mes sudaro atskiri simboliai arba 
# �od�iai, �vedin�jant juos galima ra�yti be kabu�i�.

x <- scan(what = character())
x


# U�DUOTIS ------------------------------ 

# 1. Naudodami proced�r� scan, u�ra�ykite komand�, kuri i� klaviat�ros nuskaityt� 
#    simboli� eilut� R-E-S-P-U-B-L-I-K-A. Turite gauti vektori� i� 10 raid�i�.
# 2. Anks�iau u�ra�yt� komand� pakeiskite taip, kad b�t� nuskaitomos tik pirmos
#    trys simboli� eilut�s raid�s.


# --------------------------------------- #
# DUOMEN� IMPORTAVIMAS KOPIJUOJANT        #
# --------------------------------------- #

# Nedidel� vektori� ar duomen� lentel� galima importuoti copy-paste metodu. Tam
# galima panaudoti proced�r� scan. Vektoriaus sudarymo veiksm� seka yra tokia:
# 
#  -- i� teksto nukopijuojame skai�ius ar kitas reik�mes,
#  -- nuskaitymo i� klaviat�ros re�imu paleid�iame proced�ra scan,
#  -- tiesiai � konsol� �keliame nukopijuotas vektoriaus reik�mes.

# Vektoriaus elementai gali b�ti sura�yti neb�tinai vienoje eilut�je ar viename 
# stulpelyje. Pavyzd�iui, sukursime skai�i� vektori�. Pa�ym�kite �emiau esan�ius 
# skai�ius ir su klavi�� kombinacija Ctrl + C nukopijuokite juos. 

# ---
1 2 3
4 5 6
7 8 9
# ---

# Kadangi visi vektoriaus elementai yra skai�iai, papildom� parametr� proced�rai
# nurodyti nereikia.
x <- scan()

# Su klavi�� kombinacij� Ctrl + V nukopijuotus skai�ius �kelkite tiesiai � konsol�.
# Rezultatas yra vektorius i� 9 element�.
x


# Nukopijuotas tekstas gali b�ti interpretuojamas kaip specialaus tipo failas,
# kurio vardas yra "clipboard". J� galima nurodyti bet kuriai duomen� nuskaitymo 
# proced�rai, kuri gali nuskaityti duomenis i� failo pvz., scan arba read.table.

# Pavyzd�iui, t� pat� skai�i� vektori� galima gauti naudojant toki� komand�.
x <- scan(file = "clipboard")
x


# Tokiu b�du galima nuskaityti ir nedideles duomen� lenteles. Nukopijuokite �i�
# lentel� su dviem kintamaisiais X ir Y.

# ---
X    Y
15,2 Vyras
41,5 Vyras
32,7 Moteris
28,1 Vyras
19,9 Moteris
# ---

# Kadangi pirmoje duomen� eilut�je sura�yti kintam�j� vardai, o trupmenin� dalis
# skiriama kableliu, t� reikia papildomai nurodyti proced�rai.
d <- read.table(file = "clipboard", header = TRUE, dec = ",")
d


# NAUDINGA ------------------------------

# Nukopijuoto teksto nuskaitymui eilut�mis skirta proced�ra readClipboard. Jos 
# rezultatas visada yra character tipo vektorius, kuris turi tiek element�, kiek 
# eilu�i� buvo nuskaityta.

# ---
1 2 3
4 5 6
7 8 9
# ---

# Pavyzd�iui, trys skai�i� eilut�s nuskaitytos su �ia proced�ra bus apjungtos �
# vektori� i� trij� element�: "1 2 3", "4 6 5" ir "7 8 9". D�l tos prie�asties
# �i proced�ra tinka tik tekstiniams duomenims nuskaityti.

x <- readClipboard()
x


# U�DUOTIS ------------------------------ 

# 1. Naudodami proced�r� scan ir komand� "clipboard", kopijavimo metodu sukurkite 
#    vektori� i� 3 �od�i� JUODA PILKA BALTA. Kaip reik�t� sura�yti tuos �od�ius,
#    kad tok� pat vektori� b�t� galima gauti su proced�ra readClipboard?
# 2. Koks b�t� rezultatas, jei lentel�s importavimo komandoje neb�t� nurodyta, 
#    kad kablelis skiria trupmenin� dal�?


# --------------------------------------- #
# DUOMEN� NUSKAITYMAS I� TEKSTO           #
# --------------------------------------- #

# Duomen� i� tekstinio failo nuskaitymui skirtos proced�ros gali b�ti panaudotos
# character tipo vektori� nuskaitymui. Tai rei�kia, kad nedidelius vektorius ar 
# duomen� lenteles galima u�ra�yti kaip paprast� tekst� tiesiai programos tekste, 
# o v�liau juos nuskaityti. Proced�rai scan arba read.table vektori�, kur� reikia
# nuskaityti, nurodome per parametr� text.

# Pavyzd�iui, nuskaitysime skai�i� vektori�, kuris u�ra�ytas kaip simboli� seka.
v <- "1 2 3"

# Vektoriaus nuskaitymui naudojame �prast� proced�r� scan su parametru text.
x <- scan(text = v)
x

# Jei nuskaitomas vektorius sudarytas ne i� skai�i�, proced�rai reikia nurodyti 
# element� tip�, �iuo atveju elementai yra character tipo.
v <- "a b c"

x <- scan(text = v, what = character())
x

# Duomen� lentel� u�ra�yti kaip vektori� galima panaudojant specialius simbolius: 
# \n rei�kia perk�lim� � kit� eilut�, \t rei�kia tabuliacijos �enkl�. Pavyzd�iui, 
# u�ra�ysime kaip vektori� toki� lentel�:
#
#   X  Y
#   11 12
#   21 22

l <- "X Y\n 11 12\n 21 22"

# Pirmoje �ios duomen� lentel�s eilut�je sura�yti stulpeli� pavadinimai, tod�l 
# parametro header reik�m� pakei�iame � TRUE.
d <- read.table(text = l, header = TRUE)
d

# Teksto eilute u�ra�yt� lentel� galima �ra�yti tiesiai � nuskaitymo komand�.
d <- read.table(text = "X Y\n 11 12\n 21 22", header = TRUE)
d


# Didesn� lentel� patogiau u�ra�yti taip, kaip ji atrodo, o ne viena eilute.
l <- "X  Y  Z
      11 12 13
      21 22 23
      31 32 33"

d <- read.table(text = l, header = TRUE)
d

# Tokiu pavidalu u�ra�yt� lentel� taip pat galima �ra�yti � nuskaitymo komand�.
d <- read.table(header = TRUE, text = "
X  Y  Z
11 12 13
21 22 23
31 32 33
")

d


# U�DUOTIS ------------------------------ 

# 1. Naudodami proced�r� scan, nuskaitykite kaip simboli� vektori� u�ra�yt� dat� 
#    "2013-07-11". Rezultatas turi b�ti 3 elementus turintis skai�i� vektorius: 
#    metai, m�nuo ir diena.
# 2. Datos nuskaitymo komand� pakeiskite taip, kad b�t� nuskaitomas tik metus 
#    rei�kiantis skai�ius.
# 3. U�ra�ykite lentel�s "X Y\n 11 12\n 21 22" nuskaitymo komand�, kuri pakeist�
#    kintam�j� vardus � A ir B.


# R proced�ros gali nuskaityti duomenis i� labai �vairi� �altini� (connections). 
# Duomenims u�ra�yti naudojami tekstiniai failai -- tik vienas i� toki� �altini�.
# Kitas �altinis yra jau anks�iau naudotas clipboard. 

# Naudojant funkcij� textConnection teksto blok� galima paversti � dar vieno tipo 
# �altin�, su kuriuo tokios proced�ros kaip scan ar read.table elgiasi kaip su
# tekstiniu failu.

# Pavyzd�iui, nuskaitysime kaip simboli� eilut� u�ra�yt� skai�i� sek�.
v <- "1 2 3"

# I� prad�i� character tipo vektori� paver�iame � �altin�, o tada j� nuskaitome 
# kaip paprast� tekstin� fail�.
t <- textConnection(v)
x <- scan(file = t)
x

# Patogumo d�lei visas komandas galima apjungti � vien�.
x <- scan(textConnection("1 2 3"))
x

# Tokiu b�du kaip fail� galima nuskaityti ir tekste u�ra�yt� duomen� lentel�.

t <- textConnection("
X    Y
15,2 Vyras
41,5 Vyras
32,7 Moteris
28,1 Vyras
19,9 Moteris
")

d <- read.table(file = t, header = TRUE, dec = ",")
d


# NAUDINGA ------------------------------

# Viename duomen� lentel�s stulpelyje gali b�ti keli �od�iai ar skai�iai. Pvz.,
#
#    Valdovas             Metai
#    Vytautas Didysis     1350-1430
#    �ygimantas Augustas  1520-1572
#
# Nuskaitant i� failo toki� duomen� lentel�, �od�iai Vytautas ir Didysis b�t�
# skirtinguose stulpeliuose. Kadangi pirmoje eilut�je yra du stulpeli� vardai, 
# o stulpeli� yra trys, pirmame stulpelyje esantys �od�iai Vytautas ir �ygimantas 
# automati�kai pavirst� � eilu�i� pavadinimus ir lentel� b�t� nuskaitoma blogai.

adresas <- "http://fmf.vgtu.lt/~trekasius/Rkonspektas/duomenys/lent_5a.dat"
d <- read.table(file = adresas, header = TRUE)
d

# Kad to neatsitikt�, viename stulpelyje turin�ius b�ti �od�i� junginius galima 
# �traukti � kabutes.

adresas <- "http://fmf.vgtu.lt/~trekasius/Rkonspektas/duomenys/lent_5b.dat"
d <- read.table(file = adresas, header = TRUE)
d

# Universalus sprendimas -- stulpelius vien� nuo kito atskirti kabliata�kiu.
adresas <- "http://fmf.vgtu.lt/~trekasius/Rkonspektas/duomenys/lent_5c.csv"
d <- read.table(file = adresas, header = TRUE, sep = ";")
d

# T� pat� princip� galima taikyti ir nuskaitant duomenis i� teksto. Nuskaitysime
# t� pa�i� duomen� lentel� dviem skirtingais b�dais. Pirmas b�das -- sukuriant 
# tekstin� vektori�.

l <- "
Valdovas;           Metai
Vytautas Didysis;   1350-1430
�ygimantas Augustas;1520-1572
"

d <- read.table(text = l, header = TRUE, sep = ";")
d


# Antras b�das -- naudojant funkcij� textConnection

t <- textConnection("
Valdovas;           Metai
Vytautas Didysis;   1350-1430
�ygimantas Augustas;1520-1572
")

d <- read.table(file = t, header = TRUE, sep = ";")
d

# Vis� �i� teksto nuskaitymo komand� galima u�ra�yti viena eilute.
d <- read.table(file = textConnection(l), header = TRUE, sep = ";")
d


# U�DUOTIS ------------------------------ 

# 1. Naudodami funkcij� textConnection nuskaitykite logini� reik�mi� vektori� 
#    "F-T-T-T-F-T-F-F-F-T". U�ra�ykite �i� komand� viena eilute.
# 2. Naudodami funkcij� textConnection nuskaitykite �i� paprast� duomen� lentel� 
#    "X Y\n 11 12\n 21 22". U�ra�ykite �i� komand� viena eilute.
