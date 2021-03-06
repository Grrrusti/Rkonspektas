
#
#   Dalykas: STATISTIN�S DUOMEN� ANALIZ�S SISTEMA IR PROGRAMAVIMO KALBA R
#            S�lyg� tenkinan�i� element� paie�ka ir duomen� filtravimas.
#
#  Autorius: Tomas Reka�ius
#
#   Sukurta: 2013-07-27 | 2013-08-13
#


# TURINYS -------------------------------

#
#   1. S�lyg� tenkinan�i� element� paie�ka:
#      * funkcija which
#      * funkcijo which.min
#      * funkcijo which.max
#      * funkcija match
#
#   2. Pasikartojantys vektoriaus elementai:
#      * funkcija duplicated
#      * funkcija anyDuplicated
#      * funkcija unique
#
#   3. Praleistos reik�m�s duomenyse:
#      * proced�ra summary 
#      * funkcija is.na
#      * funkcija complete.cases
#      * funkcija na.exclude
#      * funkcija na.omit
#
#   4. Duomen� filtravimas:
#      * funkcija subset 
#


# PASTABOS ------------------------------

#
# Joki� pastab� n�ra.
# 


# NUSTATYMAI ----------------------------

# Nustatoma lietuvi�ka lokal�. 
Sys.setlocale(locale = "Lithuanian")

# Nustatomas darbinis katalogas.
setwd("C:/Downloads")

# I�trinami visi seni kintamieji.
rm(list = ls())


# --------------------------------------- #
# S�LYG� TENKINAN�I� ELEMENT� PAIE�KA     #
# --------------------------------------- #

# Funkcija which nustato, kuri� loginio vektoriaus element� reik�m�s lygios TRUE. 
# Jos parametrai:
#
#        x -- logini� reik�mi� vektorius arba matrica,
#  arr.ind -- jei x yra matrica, nurodo ar gr��inti ie�komos reik�m�s numer�.

# Jei x yra vektorius, tai rezultatas yra TRUE reik�mi� indeks� vektorius. Jeigu
# x yra logini� reik�mi� matrica, tai parametrui arr.ind nurod�ius reik�m� TRUE,
# gr��inama matrica su reik�m�s TRUE matricoje x eilu�i� ir stulpeli� indeksais.


# Pavyzd�iui, surasime tuos loginio vektoriaus elementus, kuri� reik�m� yra TRUE.
t <- c(FALSE, FALSE, TRUE, FALSE)

which(t)


# �i� funkcij� galima pritaikyti ir kitokio tipo vektoriaus tam tikras s�lygas 
# tenkinan�i� element� radimui. Pirmiausia sudarome login� test� ir patikriname, 
# kurie vektoriaus elementai j� tenkina. Tada gautas logini� reik�mi� vektorius 
# perduodamas funkcijai which, kuri nustato, kurie elementai yra TRUE.

x <- c(7, -2, 4, 24, 22, 26, 27, -2, 12, -9, -6, 0, 29, 16, -7, 6, 26, 1, 5, 12)
x

# Pavyzd�iui, surasime, kuris vektoriaus x elementas lygus 0. Sudarant login� 
# test� apie lygyb�, naudojamas == operatorius.
x == 0

# Login� s�lyg� galima �ra�yti tiesiai � funkcij� which. Gaunamas �i� s�lyg� 
# atitinkan�i� vektoriaus element� numeri� vektorius. Matome, kad vektorius x
# turi tik vien� nulin� element�.
which(x == 0)

# Tokiu b�du galima surasti ir kelias s�lygas tenkinan�ius vektoriaus elementus.
# Surasime tuos vektoriaus x elementus, kuri� reik�m�s yra i� intervalo [0, 10].
which(x >= 0 & x <= 10)


# Ie�komo elemento viet� matricoje galima nurodyti dvejopai: nurodant jo eil�s
# numer� vektoriuje, i� kurio element� ir buvo sudaryta matrica, arba nurodant 
# eilut�s ir stulpelio numer�. 

# I� vektoriaus x element� sudarysime 5x4 dyd�io matric�.
m <- matrix(x, ncol = 4)
m

# Vektoriuje x nulinis elementas yra 12-tas, tod�l ir matricoje jo indeksas 12.
which(x == 0)
which(m == 0)

# Elemento viet� matricoje patogiau nustatyti u�ra�ant jo eilut�s ir stulpelio
# numer�. Tam reikia pakeisti parametro arr.ind reik�m� � TRUE.
which(m == 0, arr.ind = TRUE)


# Kartais tenka surasti ma�iausio ar did�iausio vektoriaus elemento numer�. Tam 
# naudojamos specialios funkcijos which.min ir which.max.
which.min(x)
which.max(x)


# Jei reikia patikrinti, ar tam tikra reik�m� yra vektoriuje (aib�je), naudojama 
# funkcija match. Jos parametrai:
#
#        x -- ie�koma reik�m� arba j� vektorius,
#    table -- vektorius, kuriame ie�koma reik�m� x.

# Funkcijos match rezultatas yra pirmojo reik�m� x atitinkan�io elemento numeris.
# Jei ie�komos reik�m�s vektoriuje n�ra, gr��inama reik�m� NA.

# Pavyzd�iui, patikrinsime, ar vektoriuje x yra elementas, kurio reik�m� lygi 1.
match(x = 1, x)

# Jei vektorius turi kelis tuos pa�ius elementus, f-ja match gr��ina tik pirmojo
# i� j� eil�s numer�.
match(x = -2, x)


# NAUDINGA ------------------------------

# Funkcijos which rezultatas yra tam tikr� s�lyg� tenkinan�i� vektoriaus element� 
# numeriai. Juos galima panaudoti ie�kom� element� i�skyrimui � atskir� vektori�.

# Pavyzd�iui, surasime visus teigiamus vektoriaus x elementus.
i <- which(x > 0)
i 

# Vienas i� b�d� i�skirti reikiamus vektoriaus elementus -- nurodyti j� numerius.
x[i]

# Tai atvejais, kai i� vektoriaus reikia i�skirti tam tikr� s�lyg� tenkinan�ius
# elementus, j� numeri� nustatym� naudojant funkcij� which galima praleisti, ir 
# login� s�lyg� �ra�yti tiesiogiai. Taip yra ir papras�iau, ir grei�iau.

x[x > 0]


# U�DUOTIS ------------------------------ 

# 1. Naudojant funkcij� which, suraskite numerius t� vektoriaus x element�, kurie 
#    lyg�s 6 arba -6.
# 2. U�ra�ykite komand�, kuri surast� nelygini� vien�enkli� vektoriaus x element�
#    numerius.
# 3. Sugalvokite b�d�, kaip, nenaudojant funkcijos which.min, surasti ma�iausio
#    vektoriaus elemento numer�.
# 4. Sugalvokite b�d�, kaip, naudojant funkcij� which.min, surasti did�iausi�
#    vektoriaus element�.


# --------------------------------------- #
# PASIKARTOJANTYS VEKTORIAUS ELEMENTAI    #
# --------------------------------------- #

# Pasikartojan�i� vektoriaus element� nustatymui naudojama funkcija duplicated.
# Jos rezultatas yra tokio pat ilgio loginis vektorius, kur reik�m� TRUE ra�oma
# tada, kai elementas pasikartoja. Vis� kit� element� reik�m�s lygios FALSE.

s <- c("s", "u", "s", "i", "s", "u", "k", "o")

# Pavyzd�iui, nustatysime, kurios raid�s �odyje kartojasi.
duplicated(s)

# Funkcija anyDuplicated patikrina, ar bent vienas elementas pasikartoja. Jos
# rezultatas yra pirmojo pasikartojimo vektoriuje numeris.
anyDuplicated(s)

# Vektoriaus element� aibei gauti naudojama funkcija unique. Jos rezultatas
# yra pradinis vektorius, i� kurio pa�alinami besidubliuojantys elementai.
unique(s)


# U�DUOTIS ------------------------------ 

# 1. Sugalvokite komand�, kuri � atskir� vektori� i�rinkt� bent vien� kart� 
#    pasikartojan�ius vektoriaus s elementus.
# 2. U�ra�ykite komand�, kuri i�rinkt� tuos vektoriaus s elementus, kurie
#    neturi pasikartojim�, t.y reikia gauti vektori� c("i", "k", "o").


# --------------------------------------- #
# PRALEISTOS REIK�M�S DUOMENYSE           #
# --------------------------------------- #

# D�l �vairi� prie�as�i� realiuose duomenyse kartais b�na praleist� reik�mi�. 
# Standarti�kai joms �ym�ti naudojama speciali konstanta NA. 

y <- c(7, -2, 4, NA, 22, 26, 27, -2, 12, -9, NA, 0, 29, 16, -7, 6, 26, 1, 5, 12)


d <- read.table(header = TRUE, text = "
   lytis  �gis svoris grup�
  vyras   175     76     B
  vyras   180     NA     B
moteris   170     67     A
moteris   167     64     B
  vyras   178     80     A
moteris    NA     59    NA
  vyras   184     NA     A
moteris   171     68     B
moteris   177     70     A
  vyras   185     84     B
")


# Proced�ra summary parodo pagrindines duomen� charakteristikas ir suskai�iuoja 
# praleistas reik�mes. Vektoriui surandamas bendras praleist� reik�mi� skai�ius, 
# o duomen� lentelei - j� skai�ius kiekvienam kintamajam atskirai.

y
d

summary(y)
summary(d)


# Praleist� reik�mi� vektoriuje nustatymui naudojama funkcija is.na. Rezultatas 
# yra loginis vektorius, kurio element� reik�m� yra TRUE, jei tikrinamo elemento 
# reik�m� NA arba NaN, ir FALSE - kitais atvejais.
is.na(y)

# Jei praleist� reik�mi� ie�koma matricoje arba duomen� lentel�je, tai funkcijos 
# rezultatas yra tokio pat dyd�io logini� reik�mi� matrica.
is.na(d)


# Atliekant duomen� analiz�, reikia �inoti, kurie duomen� lentel�s �ra�ai neturi
# praleist� reik�mi�. Tam naudojama funkcija complete.cases. Jos rezultatas yra 
# loginis vektorius, kurio reik�m� lygi TRUE, jei duomen� lentel�s eilut�je n�ra
# praleist� reik�mi�, ir FALSE - jei eilut�je yra bent viena praleista reik�m�.

complete.cases(d)


# Funkcijos all ir any patikrina, ar vis� loginio vektoriaus element� reik�m�s 
# yra TRUE, ir ar bent vieno elemento reik�m� yra TRUE. Naudojant �ias funkcijas, 
# galima patikrinti, ar vektorius turi praleist� reik�mi�.

all(is.na(y))   # ar vis� vektoriaus element� reik�m�s praleistos
any(is.na(y))   # ar bent vieno vektoriaus elemento reik�m� praleista

# Analogi�kai galima patikrinti, ar visos duomen� lentel�s eilut�s u�pildytos, 
# ar yra bent viena eilut�, kuri neturi praleist� reik�mi�.

all(complete.cases(d))
any(complete.cases(d))


# Naudojant anks�iau apra�yt� funkcij� which, galima nustatyti, kurie vektoriaus 
# elementai yra praleistos reik�m�s.

which(is.na(y))

# Lygiai taip pat, galima nustatyti, kurios duomen� lentel�s eilut�s turi bent 
# vien� praleist� reik�m�.

which(!complete.cases(d))


# Atliekant statistin� duomen� analiz�, praleistos reik�m�s i� duomen� turi b�ti
# pa�alintos. Sukuriame login� indeks�, kur TRUE reik�m� nurodo, kad t� element�
# reikia pasirinkti.

i <- !is.na(y)
y[i]

# I� duomen� lentel�s, paprastai, reikia pa�alinti tas eilutes, kuriose yra bent
# viena praleista reik�m�. Sudarome login� indeks�, kur TRUE reik�m� nurodo, kad
# t� eilut� reikia pasirinkti.

i <- complete.cases(d)
d[i, ]


# Nepiln� stebini� pa�alinimui galima naudoti funkcijas na.exclude arba na.omit.

na.omit(d)


# U�DUOTIS ------------------------------ 

# 1. U�ra�ykite komand�, kuri apskai�iuot� element� su praleistomis reik�m�mis
#    skai�i� vektoriuje y. 
# 2. U�ra�ykite komand�, kuri apskai�iuot� eilu�i� su praleistomis reik�m�mis
#    skai�i� duomen� lentel�je d. Kiek i� viso yra praleist� reik�mi� lentel�je?
# 3. Sukurkite duomen� lentel�, kurioje b�t� tik tie stebiniai (eilut�s), kurios
#    turi bent vien� praleist� reik�m�.


# --------------------------------------- #
# DUOMEN� FILTRAVIMAS                     #
# --------------------------------------- #

# Duomen� filtravimu vadinamas tam tikras s�lygas atitinkan�i� vektoriaus arba
# duomen� lentel�s element� i�rinkimas. Pavyzd�iui, duomen� lentel�s eilu�i�, 
# kurios neturi praleist� reik�mi� i�rinkimas, taip pat yra duomen� filtravimas.

# Da�nai duomen� analizei reikalinga tik tam tikra dalis vis� turim� duomen�.
# Pvz., i� duomen� lentel�s i�rinksime tik vyr� stebinius. Papras�iausiu atveju 
# reikiam� eilu�i� numerius galima sura�yti rankiniu b�du, ir tokiu b�du gaut� 
# indeks� vektori� naudojame konkre�i� eilu�i� i�rinkimui.

d

i <- c(1, 2, 5, 7, 10)
i

d[i, ]

# Tais atvejais, kai vektorius ar duomen� lentel� yra didel�, reikiam� element� 
# i�rinkim� reikia atlikti automati�kai. U�ra�ysime s�lyg�, kuri tikrina, kuri� 
# kintamojo "lytis" element� reik�m� yra "vyras". Gauname login� vektori�, kur 
# TRUE rei�kia, kad s�lyga tenkinama, o FALSE - kad netenkinama.

i <- d$lytis == "vyras"
i 

d[i, ]

# Da�nai tenka i�rinkti stebinius, kurie tenkina ne vien� s�lyg�. Pavyzd�iui, i�
# lentel�s d i�rinksime auk�tesnius nei 180 cm vyrus.

i <- d$lytis == "vyras" & d$�gis > 180

d[i, ]


# Svarbu atsiminti, kad bet koks loginis testas su NA reik�me, duoda NA, tod�l 
# duomenyse, kuriuose yra praleist� reik�mi�, papildomai reikia tikrinti ar 
# reik�m� yra nepraleista. Pavyzd�iui, i� duomen� lentel�s i�rinksime B grup�s
# stebinius.

i <- d$grup� == "B" & !is.na(d$grup�)     # 1 b�das, s�lyga kartu su NA testu
i                                         #
d.1 <- d[i, ]                             #
d.1

i <- which(d$grup� == "B")                # 2 b�das, trumpesn� komanda
i                                         #
d.2 <- d[i, ]                             #
d.2

# Galima �sitikinti, kad abiem b�dais gauti duomen� rinkiniai sutampa.
identical(d.1, d.2)


# Duomen� filtravimui naudojama proced�ra subset. Jos parametrai:
#
#        x -- vektorius, matrica ar duomen� lentel�,
#   subset -- login� s�lyga,
#   select -- paliekam� kintam�j� (stulpeli�) s�ra�as.

# Naudojant �i� proced�r�, loginiai veiksmai su konstanta NA duoda reik�m� FALSE. 
# Pavyzd�iui, i� lentel�s d i�rinksime tik B grup�s stebinius.
subset(d, grup� == "B")

# Kadangi naujai sudarytame duomen� rinkinyje kintamasis "grup�" turi vienintel�
# reik�m� "B", jis nebereikalingas, tod�l j� galima i�mesti.
subset(d, grup� == "B", selec = -grup�)

# Galima nurodyti ir kelis kintamuosius, kuriuos reikia palikti arba i�mesti.
subset(d, grup� == "B", selec = c(lytis, �gis))

# I� eil�s einan�i� kintam�j� aib� galima nurodyti per dvita�k� u�ra�ant pirmojo 
# ir paskutinio kintamojo vardus.
subset(d, grup� == "B", selec = lytis:�gis)


# U�DUOTIS ------------------------------ 

# 1. U�ra�ykite komand�, kuri surast�, kuriose duomen� lentel�s d eilut�se yra
#    daugiau nei 80 kg sveriantys vyrai. Turite gauti eilu�i� numeri� vektori�.
#    Naudojant �� indeks� vektori� sudarykite nauj� duomen� lentel�.
# 2. U�ra�ykite komand�, kuri apskai�iuot�, kiek grup�je B yra moter�. Turite
#    gauti vien� skai�i�.
# 3. I� duomen� lentel�s d i�rinkite B grup�s moter� stebinius. U�ra�ykite dvi
#    tokios komandos versijas: naudojant proced�r� subset ir nenaudojant jos.
# 4. I� duomen� lentel�s mtcars i�rinkite tas ma�inas, kuri� variklis turi 4 
#    cilindrus (kintamasis "cyl").
