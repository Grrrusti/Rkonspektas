
#
#   Dalykas: STATISTIN�S DUOMEN� ANALIZ�S SISTEMA IR PROGRAMAVIMO KALBA R
#            Funkcij� u�ra�ymas.
#
#  Autorius: Tomas Reka�ius
#
#   Sukurta: 2013-08-16 | 2013-09-01
#


# TURINYS -------------------------------

#
#   1. I�rai�kos ir i�rai�k� blokai:
#      * skliaustai {}
#
#   2. Nauj� funkcij� u�ra�ymas:
#      * komanda function
#      * komanda return
#      * funkcija source
#      * funkcija body 
#
#   3. S�lyg� funkcijose tikrinimas:
#      * komanda stop
#      * komanda stopifnot
#      * komanda message
#      * komanda warning
#


# PASTABOS ------------------------------

#
# Sugalvoti u�davini� apie atskirus duomen� analiz�s etapus.
# 


# NUSTATYMAI ----------------------------

# Nustatoma lietuvi�ka lokal�. 
Sys.setlocale(locale = "Lithuanian")

# Nustatomas darbinis katalogas.
setwd("C:/Downloads")

# I�trinami visi seni kintamieji.
rm(list = ls())


# --------------------------------------- #
# I�RAI�KOS IR I�RAI�K� BLOKAI            #
# --------------------------------------- #

# R programavimo kalboje objektui sukurti naudojami veiksmai vadinami i�rai�ka.
# I�rai�kos susideda i� aritmetini� (+, *, ^) arba logini� (!, &, |) operatori�
# ir kit� objekt�: konstant�, kintam�j�, funkcij� ir j� rezultat�. Pateiksime 
# kelet� i�rai�k� su standartin�mis R konstantomis ir funkcijomis:

!TRUE

56 + 67

sin(3*pi/2)

exp(pi * 1i)

cat("Skai�ius pi:", pi, "\n")

# Sud�tingi skai�iavimai paprastai i�skaidomi � kelet� etap� -- vienos i�rai�kos 
# rezultatas priskiriamas kintamajam, kuris v�liau naudojamas kitoje i�rai�koje.
# Pvz., sukursime sveik�j� skai�i� vektori� ir apskai�iuosime jo element� sum�.

v <- 1:10
s <- sum(v)
s

# Kelet� i� eil�s einan�i� i�rai�k� riestiniais skliaustais {} galima apjungti � 
# blok�. Tok� blok� galima interpretuoti kaip dar vien� i�rai�k�, kurios reik�m�
# yra paskutin�s bloko viduje esan�ios i�rai�kos rezultatas.

# Pavyzd�iui, u�ra�ysime i�rai�k� blok�, kuriame sukuriamas sveik�j� skai�i� nuo
# 1 iki 10 vektorius, o tada suskai�iuojama to vektoriaus element� suma. Kadangi
# gauta reik�m� niekam nepriskiriama, ji kaip bloko reik�m� i�vedama � konsol�.

{
  v <- 1:10
  sum(v)
}

# Kintamajam priskirta paskutin�s i�rai�kos reik�m� tuo pa�iu yra ir viso bloko
# reik�m�. � konsol� ji nei�vedama, ta�iau j� galima naudoti kitose i�rai�kose. 

{
  v <- 1:10
  s <- sum(v)
}

# Kaip ir bet kurios i�rai�kos reik�m�, bloko gr��inam� reik�m� galima priskirti 
# kintamajam.

b <- {
  v <- 1:10
  s <- sum(v)
}

# Matome, kad bloko reik�m� sutampa su paskutin�s i�rai�kos reik�me.
b

# Bloko viduje sukuriami tarpiniai kintamieji yra savaranki�ki objektai, kuriuos
# galima naudoti kituose skai�iavimuose. Pavyzd�iui, i�vesime � konsol� tarpin� 
# bloko kintam�j� v.

v     # pirmos i�rai�kos rezultatas 
s     # antros i�rai�kos rezultatas


# NAUDINGA ------------------------------

# R programavimo kalboje naudojami dviej� r��i� skliaustai: ( ) ir { }. Grie�tai
# kalbant, R skliaustai traktuojami kaip funkcijos. I�rai�ka (x) yra ekvivalenti 
# funkcijai f(x) = x. Kadangi funkcijos reik�m� automati�kai i�vedama � konsol�,
# tai skliaustuose �ra�ytos i�rai�kos reik�m� taip pat i�vedama � konsol�.

# �i� savyb� galima i�naudoti. Pvz., priskyrimo operacij� �ra�ius � skliaustus, 
# gauta reik�m� i�vedama � konsol� net nenurod�ius kintamojo, kuriam �i reik�m� 
# priskiriama, vardo.

(a <- 2 + 2)

# Paprasti skliaustai naudojami aritmetin�ms ar login�ms operacijoms apskliausti, 
# juose nurodomi vis� funkcij� argumentai. Ta�iau () skliaustuose galima �ra�yti 
# tik vien� i�rai�k�.

# Riestiniai {} skliaustai naudojami keletos i�rai�k� apjungimui. Paprastai tai 
# reikalinga konstrukcijoje if-else, ciklo funkcijose for, while arba repeat ir 
# u�ra�ant funkcijas. Skliaustuose {} �ra�ytos i�rai�kos rezultatas i�vedamas �
# konsol� tik tada, jei jis nepriskiriamas kintamajam. 

# Tu�ti riestiniai skliaustai prilygsta NULL objektui.

a <- {}
a

# Lau�tiniai skliaustai [ ar [[ naudojami kaip operatoriai vektoriaus, matricos 
# arba s�ra�o element� indeksams u�ra�yti. Pvz., i� did�i�j� raid�i� vektoriaus 
# i�skirsime 18-t� jo element�.

LETTERS[18]


# --------------------------------------- #
# FUNKCIJOS U�RA�YMAS                     #
# --------------------------------------- #

# R turi visas pagrindines matematines funkcijas bei daug standartini� funkcij� 
# skirt� statistinei duomen� analizei ir kitiems skai�iavimams. Da�nai duomenis
# tenka pertvarkyti, vien� po kito atlikti kelis veiksmus arba pritaikyti kelias
# skirtingas funkcijas. Tokiais atvejais kelias i�rai�kas galima u�ra�yti kaip  
# funkcij�. Bendras funkcijos pavidalas yra toks:
#
#   funkcijos.vardas <- function(arg1, arg2, ...) {
#     
#   }

# Funkcijos vardas yra kintamasis, kuriam priskirta pati funkcija. Bet kuri R 
# funkcija yra "function" tipo objektas. Tai rei�kia, kad kintamajam priskirta 
# reik�m� gali b�ti funkcija, o funkcijos reik�m� kaip argumentas gali b�ti 
# perduota kitai funkcijai. Taip galima i�vengti tarpini� kintam�j� ir u�ra�yti 
# labai kompakti�kas komandas. R yra funkcinio programavimo kalba, ir tod�l toks
# programavimo stilius yra labai nat�ralus.

# Funkcija gali tur�ti vien� ar daugiau argument�, arba netur�ti visai. Reik�m�s 
# argumentams priskiriamos naudojant = �enkl�. Pagrindin� funkcijos dal� sudaro 
# viena arba kelios riestiniuose skliaustuose � blok� apjungtos i�rai�kos.

# Pavyzd�iui, u�ra�ysime paprast� funkcij�, kuri apskai�iuot� sveik�j� skai�i� 
# nuo m iki n suma. Skai�iai m ir n bus �ios funkcijos argumentai. Funkcija turi 
# dvi i�rai�kas: pirmoji sukuria sveik�j� skai�i� vektori�, antroji suranda �io 
# vektoriaus element� sum�.

seq.suma <- function(m, n) {

    v <- m:n
    sum(v)
}

# Galima �sitikinti, kad nauja funkcija yra "function" tipo objektas. 
class(seq.suma)

# Jei nurodomi funkcijos argument� pavadinimai, reik�mes jiems priskirti galima 
# bet kokia tvarka.
seq.suma(m = 1, n = 10)
seq.suma(n = 10, m = 1)

# Jei argumentai sura�omi nustatyta tvarka, j� pavadinimus galima praleisti.
seq.suma(1, 10)

# Funkcijos argumentai gali tur�ti numatytas reik�mes. Pvz., sumavimo funkcij� 
# pakeisime taip, kad, nurod�ius tik vien� argument�, b�t� sumuojami sveikieji 
# skai�iai nuo 1 iki n. �ia argumentas m tur�s numatyt� reik�m� lygi� 1.

seq.suma <- function(n, m = 1) {

    v <- m:n
    sum(v)
}

# Dabar u�tenka nurodyti tik vien� argument� n, kurio vardo galima ir nera�yti.
seq.suma(10)

# Jei reikia, numatyt� argumento reik�m� galima pakeisti.
seq.suma(n = 10, m = 5) 

# Funkcija gr��ina paskutin�s jos i�rai�kos reik�m�. Jei �i reik�m� priskiriama
# kintamajam, papildomai reikia nurodyti, kurio kintamojo reik�m� gr��inti. Tam 
# naudojama komanda return. Pvz., vektoriaus element� sum� priskyrus kintamajam 
# s, reikia nurodyti, kad funkcija gr��ina t� kintam�j�.

seq.suma <- function(m, n) {

    v <- m:n
    s <- sum(v)

    return(s)
}

# Funkcija gali gr��inti bet kok� objekt�. Pavyzd�iui, pakeisime funkcij� taip,
# kad jos rezultatas b�t� s�ra�as i� trij� element�: pirmas ir paskutinis sekos
# nariai ir sekos suma.

seq.suma <- function(m, n) {

    v <- m:n
    s <- sum(v)

    return(list(pirmas = m, paskutinis = n, suma = s))
}

seq.suma(1, 10)

# Atsisakius tarpini� kintam�j�, funkcijos viduje lieka tik viena i�rai�ka, tad
# riestini� skliaust� galima ir nebera�yti. Tokiu b�du funkcij� u�ra�ome labai 
# kompakti�kai.

seq.suma <- function(m, n) sum(m:n)

# Kaip ir kiti R objektai, funkcijos reik�m� gali b�ti priskirta kintamajam arba 
# kaip argumentas perduota dar kitai funkcijai. Pvz., sumavimo funkcij� �d�sime 
# � proced�r� cat, kuri i� funkcijos argument� ir jos rezultato suformuos sakin� 
# ir i�ves j� � konsol�.
m = 10
n = 99

cat("Skai�i� nuo", m, "iki", n, "suma lygi", seq.suma(m, n), "\n")


# NAUDINGA ------------------------------

# Didel�s apimties, �vairias pagalbines ar keliose skirtingose programose da�nai 
# naudojamas funkcijas galima �ra�yti � atskir� tekstin� fail�. D�l to programos 
# tekstas pasidaro kompakti�kesnis, lengviau skaitomas. Labai svarbu ir tai, kad 
# pakoregavus funkcij�, visose j� naudojan�iose programose bus naudojama ta pati
# jos versija. Funkcijos ar visos programos kodo nuskaitymui i� tekstinio failo 
# naudojama proced�ra source.

# Pavyzd�iui, i� internete patalpinto failo importuosime funkcij� visi.dalikliai, 
# kuri suranda visus nat�rinio skai�iaus daliklius.

adresas <- "http://fmf.vgtu.lt/~trekasius/Rkonspektas/funkcijos/divisors.R"
source(file = adresas)

# Funkcijos vardas be argument� i�veda vis� funkcijos kod� � konsol�. Tokiu b�du 
# galima pamatyti ne�inomos funkcijos argumentus ir viduje esan�ias i�rai�kas.
visi.dalikliai

# Ne�inomos funkcijos viduje esan�ias i�rai�kas � konsol� i�veda funkcija body.
body(visi.dalikliai)

# Vienintelis �ios funkcijos argumentas yra nat�rinis skai�ius, o jos rezultatas 
# yra vis� to skai�iaus dalikli� vektorius.
visi.dalikliai(666)


# U�DUOTIS ------------------------------ 

# 1. U�ra�ykite funkcij� Fibona�io skai�i� sekos sudarymui. Pirmas ir antras jos 
#    nariai lyg�s 1, o kiekvienas sekantis narys lygus dviej� paskutini� sumai. 
#    �ios funkcijos argumentas yra sekos nari� skai�ius n, n > 0, o rezultatas
#    yra n element� turintis vektorius.
# 2. U�ra�ykite funkcij� sveikojo skai�iaus i� dvejetain�s skai�iavimo sistemos 
#    pervedimui � de�imtain�. Funkcijos argumentas -- vektorius, kurio element�
#    reik�m�s 0 arba 1. Pavyzd�iui, jei argumentas yra vektorius c(1, 1, 0, 1),
#    rezultatas yra 13, jeigu argumentas c(1, 1, 1), tai rezultatas turi b�ti 7.
# 3. Tegu s yra n element� turintis simboli� arba skai�i� vektorius. U�ra�ykite 
#    funkcij�, kuri surast� visas slenkan�ias k element� dyd�io sekas. Pvz., jei
#    s = c("A", "B", "C", "D"), o k = 3, tai funkcijos rezultatas yra vektoriai
#    c("A", "B", "C") ir c("B", "C", "D"). Gautas i-asis vektorius priskiriamas
#    i-ajam s�ra�o elementui ir galutinis rezultatas yra toki� vektori� s�ra�as.
 

# --------------------------------------- #
# KOREKTI�K� FUNKCIJ� RA�YMAS             #
# --------------------------------------- #

# Funkcijos turi b�ti u�ra�ytos taip, kad suveikt� korekti�kai ir nekorekti�kose
# situacijose. Tas labai svarbu dirbant su realiais duomenimis, kuriuose kartais
# b�na praleist� reik�mi�. Kadangi veiksm� su NA reik�m�mis rezultatas taip pat 
# yra NA reik�m�, negalima atlikti tam tikr� skai�iavim�. Kartais skai�iavimus
# tenka nutraukti nes duomenys netenkina tam tikr� specifini� s�lyg�, pvz., per
# ma�a imtis, per daug i�siskirian�i� stebini� ir t.t. 

# Nekorekti�kos situacijos atveju i�rai�kos vykdymas nutraukiamas naudojant f-j�
# stop. Paprastai �i funkcija naudojama kartu su s�lygos konstrukcija if-else.

# Pavyzd�iui, u�ra�ysime funkcij� f(x) = 1/x. Prie� atliekant skai�iavimus, bus
# patikrinama, ar x nelygus 0. Jei taip, skai�iavimai nutraukiami.

fx.a <- function (x) {
  if (x == 0) stop("x negali b�ti lygus 0.")

  y <- 1/x
  return(y)
}

fx.a(5)
fx.a(0)


# Prie� atliekant skai�iavimus kartais tenka patikrinti, ar f-jos argumentai yra 
# tam tikro tipo. Pavyzd�iui, u�ra�ysime funkcij�, kurios argumentas gali b�ti 
# tik vektorius (bet kokio tipo), prie�ingu atveju skai�iavimai neatliekami.

fx.b <- function (x) {
  if (!is.vector(x)) stop("x n�ra vektorius.")

  y <- length(x)
  names(y) <- "Element� skai�ius"
  return(y)
}

fx.b(100:150)
fx.b(letters)


# Kartais funkcijos darbas turi b�ti nutraukiamas jei netenkinama bent viena i�
# keletos logini� s�lyg�. �i� s�lyg� patikrinimui galima naudoti kelet� funkcij� 
# if, ta�iau papras�iau naudoti tam skirt� funkcij� stopifnot. Jos parametrai:
#
#    stopifnot(s�lyga1, s�lyga2, ...)

# Jei vis� logini� s�lyg� reik�m� yra TRUE, funkcija gr��ina NULL reik�m�. Jeigu
# bent vienos s�lygos reik�m� n�ra TRUE, suvykdoma funkcija stop, ir � konsol� 
# i�vedamas prane�imas apie pirm� ne TRUE reik�m� turin�i� s�lyg� (jei toki� yra
# ne viena).

# Pavyzd�iui, u�ra�ysime funkcij�, kurios argumentas turi b�ti ne ma�iau kaip 10
# reik�mi� turintis skaitinis vektorius be praleist� reik�mi�.

fx.s <- function(x) {

  stopifnot(is.vector(x), is.numeric(x), length(x) >= 10, all(!is.na(x)))

  y <- mean(x)
  names(y) <- "Vidurkis"
  return(y)
}

x <- c(10.5, 14.2, 3.1)
y <- c(10.7, 10.4, 9.9, NA, 7, 13.8, 9.6, 9.1, 7.9, 9.4)
z <- c(11.5, 13.3, 8.2, 10, 9, 12.8, 8.6, 8.1, 7.9, 9.2)

fx.s(x)
fx.s(y)
fx.s(z)

# Kartais reikia, kad funkcija tam tikrais skai�iavimo etapais i�vest� prane�im�
# apie atliekamus veiksmus. Tam naudojama funkcija message. Jos parametrai:
#
#        ... -- vienas ar keli kintamieji, kuri� reik�m� yra tekstas,
#   appendLF -- TRUE, nurodo, kad kitas prane�imas bus naujoje eilut�je.

# Pavyzd�iui, anks�iau u�ra�yt� funkcij� papildysime informaciniais prane�imais 
# apie s�lyg� duomenims tikrinim� ir skai�iavim� etapo prad�i�.

fx.m <- function(x) {

  message("Tikrinamos s�lygos ... ", appendLF = FALSE)
  stopifnot(is.vector(x), is.numeric(x), length(x) >= 10, all(!is.na(x)))
  message("atlikta.")

  message("Atliekami skai�iavimai.")
  y <- mean(x)
  names(y) <- "Vidurkis"

  return(y)
}

fx.m(x)
fx.m(y)
fx.m(z)

# Ne visi prane�imai turi vienod� svarb�. �vairiems persp�jimams naudojama f-j�
# warning. Jos parametrai:
#
#        ... -- vienas ar keli kintamieji, kuri� reik�m� yra tekstas,
#      call. -- TRUE, prane�ime nurodoma i�rai�ka, kurioje �vyko klaida,
# immediate. -- FALSE, nurodo, kad prane�imas b�t� i�vedamas i� karto.

# Pavyzd�iui, funkcij� perra�ysime taip, kad skai�iavimai d�l praleist� reik�mi� 
# duomenyse nebus nutraukiami. S�lyga d�l praleist� reik�mi� tikrinama atskirai,
# ir, jei toki� reik�mi� yra, skai�iavimai atliekami, bet i�vedamas persp�jimas.

fx.w <- function(x) {

  stopifnot(is.vector(x), is.numeric(x), length(x) >= 10)
  if (any(is.na(x))) warning("Duomenyse yra praleist� reik�mi�.", call. = FALSE)

  y <- mean(x, na.rm = TRUE)
  names(y) <- "Vidurkis"

  return(y)
}

fx.w(x)
fx.w(y)
fx.w(z)


# NAUDINGA ------------------------------

# Tarkime, kad kintamasis n turi b�ti sveik�j� skai�i� 1, 2, 3, 4 ir 5 vektorius. 
# Tok� vektori� galima u�ra�yti keliais skirtingais b�dais, ta�iau ne visi i� j�
# yra tinkami.

n.1 <- c(1.0, 2.0, 3.0, 4.0, 5.0)
is.integer(n.1)

n.2 <- c(1, 2, 3, 4, 5)
is.integer(n.2)

n.3 <- c(1L, 2L, 3L, 4L, 5L)
is.integer(n.3)

n.4 <- seq(from = 1, to = 5, by = 1)
is.integer(n.4)

n.5 <- seq(from = 1, to = 5)
is.integer(n.5)

n.6 <- 1:5
is.integer(n.6)

# Galima parodyti, kad funkcijai, kurios argumentas turi b�ti sveikasis skai�ius,
# tinka ne visi i� �i� vektori�.

fx.n <- function(x) {
  stopifnot(is.integer(x))

  message("Duomenys tinkami!")
}

fx.n(n.2)
fx.n(n.6)

# I� �i� pavyzd�i� ai�ku, kad i� esm�s geri duomenys gali b�ti atmesti vien tik 
# d�l netinkamo kintamojo tipo. Norint u�tikrinti, kad skai�iavimuose naudojami
# reikiamo tipo kintamieji, kartais funkcijos argumentai i� anksto konvertuojami.
# Tam naudojamos funkcijos as.numeric, as.character, as.vector, as.matrix ir t.t.

fx.k <- function(x) {
  x <- as.integer(x)

  message("Duomenys tinkami!")
}

fx.k(n.2)
fx.k(n.6)


# U�DUOTIS ------------------------------ 

# 1. U�ra�ykite funkcij�, kuri apskai�iuoja skai�i� vektoriaus element� sandaug�. 
#    Naudojant funkcij� stop, nutraukite skai�iavimus, jei bent vienas elementas
#    lygus nuliui.
# 2. Naudodami f-j� stopifnot, u�ra�ykite i�rai�k�, kuri patikrina ar kintamasis 
#    x yra neneigiam� skai�i� vektorius.
# 3. Naudodami funkcij� stopifnot, patikrinkite, ar funkcijos argumentas yra 3x3
#    dyd�io skai�i� matrica be praleist� reik�mi�.
