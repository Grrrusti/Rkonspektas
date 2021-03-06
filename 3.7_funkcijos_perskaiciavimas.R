
#
#   Dalykas: STATISTIN�S DUOMEN� ANALIZ�S SISTEMA IR PROGRAMAVIMO KALBA R
#            Funkcijos perskai�iavimas kei�iant ir nekei�iant parametr�.
#
#  Autorius: Tomas Reka�ius
#
#   Sukurta: 2013-08-29 | 2013-09-07
#


# TURINYS -------------------------------

#
#   1. Ciklas per funkcijos parametr� vektori�:
#      * funkcija mapply
#
#   2. Funkcij� ir kit� i�rai�k� pakartojimas:
#      * funkcija replicate
#


# PASTABOS ------------------------------

#
# Pastab� n�ra.
# 


# NUSTATYMAI ----------------------------

# Nustatoma lietuvi�ka lokal�. 
Sys.setlocale(locale = "Lithuanian")

# Nustatomas darbinis katalogas.
setwd("C:/Downloads")

# I�trinami visi seni kintamieji.
rm(list = ls())


# --------------------------------------- #
# FUNKCIJA MAPPLY                         #
# --------------------------------------- #

# Funkcijos apply, lapply arba sapply perb�ga per duomen� rinkinio elementus ir 
# kaip argumentus juos perduoda kitai funkcijai. Tas duomen� rinkinys gali b�ti
# ir funkcijos kokio nors vieno parametro reik�mi� vektorius. Tokiu b�du galima
# reguliuoti funkcijos veikim�.

# Pavyzd�iui, u�ra�ysime funkcij�, kuri kiekvien� vektoriaus element� pakartoja 
# po k kart�. �ia parametras k yra sveikasis skai�ius, kurio reik�m� kinta nuo 1 
# iki m = 4.

m <- 4
w <- c("A", "B", "C")

sapply(1:m, function(k) rep(w, each = k))


# Tuo atveju, kai funkcijai reikia perduoti i� karto keli� parametr� reik�mes, 
# naudojama funkcija mapply. Jos parametrai:
#
#      FUN -- funkcijos pavadinimas arba i�rai�ka,
#      ... -- funkcijai perduodami parametrai,
# MoreArgs -- nekintan�i� funkcijos parametr� s�ra�as.

# Pavyzd�iui, naudodami standartin� funkcij� seq, interval� [0, 1] padalinsime � 
# 10, 50 ir 100 vienod� dali�. Ta�k�, kuri� reikia interval� padalinti � k lygi�
# dali�, yra k + 1, o j� skai�i� nusako funkcijos seq parametras length.out. �ia
# parametr� from ir to reik�m�s fiksuotos, nes dalinamas tas pats intervalas. 

mapply(seq, from = 0, to = 1, length.out = c(11, 51, 101))

# Nekintan�ius funkcijos parametrus ar jai reikalingus duomenis galima perduoti
# per parametr� MoreArgs. Pavyzd�iui, perra�ysime t� pa�i� funkcij� taip, kad
# fiksuoti parametrai from ir to b�t� perduodami atskiru s�ra�u.

mapply(seq, length.out = c(11, 51, 101), MoreArgs = list(from = 0, to = 1))

# �iuo atveju kei�iasi tik vieno parametro reik�m�, tod�l funkcija mapply n�ra
# pilnai i�naudojama. Pvz., t� pat� rezultat� galima gauti naudojant sapply.

sapply(c(11, 51, 101), function(k) seq(0, 1, length.out = k))


# U�ra�ysime paprast� funkcij�, kuri i� ilgos simboli� sekos i�karpo trumpesnes
# sekas. �ios f-jos argumentai yra trumpesni� sek� prad�ios ir pabaigos indeks�
# vektoriai. Kadangi funkcijos duomenys - ilgoji seka - nesikei�ia, j� �ra�ome �
# fiksuot� parametr� s�ra�� MoreArgs. Galutinis rezultatas yra keli� trumpesni� 
# sek� s�ra�as.

s <- c("G", "C", "T", "T", "T", "T", "C", "A", "T", "T", "C", "T", "G", "A", "C")

a <- c(1, 5, 8)
b <- c(7, 10, 15)

mapply(function(seka, i, j) seka[i:j], i = a, j = b, MoreArgs = list(seka = s))

# Jei tokia funkcija skirta visada tos pa�ios sekos karpymui, jos vard� galima 
# �ra�yti tiesiai � funkcij� ir tokiu b�du atsisakyti vieno parametro.

mapply(function(i, j) s[i:j], i = a, j = b)


# NAUDINGA ------------------------------

# Funkcija mapply da�nai naudojama atsitiktini� dyd�i� su skirtingais skirstinio
# parametrais generavimui. Pavyzd�iui, normalusis ats. dydis turi du parametrus: 
# vidurk� ir standartin� nuokryp�. Tokio dyd�io generavimui naudojama funkcija
# rnorm, kuri turi tris parametrus: imties t�r� n, vidurk� mean ir std. nuokryp� 
# sd. Sugeneruosime tris normaliasias imtis, kurios skiriasi abiem parametrais. 

vid <- c(A = 9, B = 5, C = 1)    # ats. dyd�io vidurki� vektorius
std <- c(a = 1, b = 2, c = 3)    # standartini� nuokrypi� vektorius

# U�ra�ome funkcij�, kuri turi du parametrus - vidurkio ir nuokrypi� vektorius.
# Imties t�ris �ra�ytas tiesiai � funkcij�. Galutinis rezultatas yra matrica su
# sugeneruotomis imtimis stulpeliuose, kuri� priskirsim kintamajam.

rnd <- mapply(function(m, s) rnorm(20, mean = m, sd = s), m = vid, s = std)
rnd

# Kaip ir kitose funkcijose, jei parametrai ra�omi nustatyta tvarka, j� vard� 
# galima nera�yti visai. Taip funkcijos i�rai�ka tampa trumpesn� ir ai�kesn�.

rnd <- mapply(function(m, s) rnorm(20, m, s), vid, std)
rnd


# �i� funkcij� galima supaprastinti, generavimo funkcijai parametrus perduodant
# tiesiogiai.

rnd <- mapply(rnorm, n = 20, mean = vid, sd = std)
rnd

# Nera�ant parametr� vard�, gaunama labai kompakti�ka i�rai�ka!

rnd <- mapply(rnorm, 20, vid, std)
rnd


# Gautas atsitiktini� dyd�i� imtis galima perduoti �vairioms kitoms funkcijoms.
# Pvz., apskai�iuosime im�i� vidurkius ir nubrai�ysime j� sklaidos grafikus.

apply(rnd, 2, mean)
boxplot(rnd)


# U�DUOTIS ------------------------------ 

# 1. Derini� skai�iui apskai�iuoti naudojama R funkcija choose. Naudodami mapply, 
#    u�ra�ykite funkcij� i� karto keletos derini� skai�iaus radimui, kai dyd�iai
#    n ir k yra kelet� reik�mi� turintys vektoriai. Pavyzd�iui, tegu n = (5, 10), 
#    o k = (2, 3). �iuo atveju reikia gauti derini� skai�i� i� 5 po 2 ir derini�
#    skai�i� i� 10 po 3.
# 2. Siekiant eliminuoti i�siskirian�i� stebini� �tak�, vietoje vidurkio kartais
#    skai�iuojamas nukirstas vidurkis (truncated mean). Tai vidurkis skai�iuotas
#    im�iai, i� kurios atmesta k*100% did�iausi� ir ma�iausi� reik�mi�. Vidurkio
#    funkcija mean turi tam skirt� parametr� trim, reik�m� i� intervalo [0, 0.5]. 
#    Naudojant mapply, u�ra�ykite funkcij�, kuri apskai�iuot� 0.10, 0.15, 0.20 
#    lygio "nukirstus" vidurkius. Toki� pa�i� funkcij� u�ra�ykite su f-ja sapply.
# 3. Naudodami funkcij� mapply, sugeneruokite tris tolygiai intervaluose [0, 1], 
#    [0, 5] ir [-1, 1] pasiskirs�iusi� dyd�i� imtis po 100 element� kiekvienoje. 
#    Tolyg� pasiskirstym� turin�io ats. dyd�io generavimui naudojama standartin� 
#    funkcija runif.


# --------------------------------------- #
# FUNKCIJA REPLICATE                      #
# --------------------------------------- #

# Atliekant tikimybin� modeliavim�, eksperiment� labai da�nai reikia pakartoti 
# daug kart�. Tokiais atvejais galima naudoti funkcij� replicate. Jos parametrai:
#
#        n -- pakartojim� skai�ius,
#     expr -- funkcija ar bet kokia kita i�rai�ka, kuri� reikia pakartoti,
# simplify -- loginis parametras nurodantis, kad rezultatas turi b�ti vektorius.

# Pavyzd�iui, sumodeliuosime n = 10 normali�j� im�i� po 50 element� kiekvienoje. 
# Tegul atsitiktinio dyd�io vidurkis lygus 20, o standartinis nuokrypis lygus 5.
# Rezultatas yra matrica, kurios stulpeliuose yra ats. dyd�i� imtys.

replicate(10, rnorm(50, mean = 20, sd = 5))

# Parametro simplify reik�m� pakeitus � FALSE, vietoje matricos gaunamas s�ra�as, 
# kurio elementai yra atsitiktini� dyd�i� imtys.

replicate(10, rnorm(50, 20, 5), simplify = F)

# Kaip visada, tok� s�ra�� galima perduoti kitoms skai�iavim� funkcijoms. Pvz.,
# apskai�iuosime toki� sugeneruot� im�i� vidurkius. Pirmu atveju naudosime f-j�
# apply ir skai�iuosime vidurkius stulpeliuose, antru atveju naudosime funkcij�
# sapply.

apply(replicate(10, rnorm(50, 20, 5)), 2, mean)

sapply(replicate(10, rnorm(50, 20, 5), simplify = F), mean)


# Pavyzd�iui, sumodeliuosime monetos m�tymo eksperiment�, kur moneta metama 1000
# kart�. Atliksime 10 toki� eksperiment� ir apskai�iuosime, kiek vienos serijos
# metu atsivert� herb� ir skai�i�.

# Vienos monetos m�tymo eksperiment� galima u�ra�yti naudojant funkcij� sample.
sample(c("H", "S"), 1000, replace = TRUE)

# �i� i�rai�k� �sta�ius � funkcij� replicate, gaunama 1000 x 10 dyd�io matrica, 
# kurios stulpeliuose yra bandym� serijos.
replicate(10, sample(c("H", "S"), 1000, TRUE))

# Naudojant funkcij� apply, kiekvienam eksperiment� matricos stulpeliui sudaroma 
# herb� ir skai�i� da�ni� lentel�. Galima pasteb�ti, kad herb� ir skai�i� da�nis
# apytiksliai lygus, koks ir turi b�ti m�tant simetri�k� monet�.
apply(replicate(10, sample(c("H", "S"), 1000, TRUE)), 2, table)


# �inoma, funkcij� replicate naudojama ne tik atsitiktini� dyd�i� generavimui ar 
# tikimybiniam modeliavimui. Pavyzd�iui, sudarysime 10x10 dyd�io matric�, kurios 
# pirmos eilut�s elementai lyg�s 1, antros lyg�s 2 ir t.t. Visi tokios matricos 
# stulpeliai yra vienodi, tod�l reikia sugeneruoti 10 vienod� vektori�, kuri�
# elementai kinta nuo 1 iki 10. 

replicate(10, 1:10)


# U�DUOTIS ------------------------------ 

# 1. Naudojant f-jas replicate ir sample, sudarykite 10 atsitiktini� kod� s�ra��. 
#    Vienas kodas gaunamas i� vektoriaus LETTERS atsitiktine tvarka i�renkant po
#    tris raides ir, naudojant f-j� paste su parametru collapse = "", apjungiant
#    jas � vien� simboli� sek�.
# 2. Naudodami funkcij� replicate, sugeneruokite tris tolygiai intervale�[0, 10]
#    pasiskirs�iusio atsitiktinio dyd�io imtis po n = 100 element�. Sugalvokite, 
#    kaip tokias imtis gauti nenaudojant funkcijos replicate.
