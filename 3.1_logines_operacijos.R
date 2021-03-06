
#
#   Dalykas: STATISTIN�S DUOMEN� ANALIZ�S SISTEMA IR PROGRAMAVIMO KALBA R
#            Logini� s�lyg� u�ra�ymas ir specialios login�s funkcijos.
#
#  Autorius: Tomas Reka�ius
#
#   Sukurta: 2013-07-27 | 2013-08-20
#


# TURINYS -------------------------------

#
#   1. Logini� s�lyg� u�ra�ymas:
#      * palyginimo operatoriai
#      * funkcija all
#      * funkcija any
#
#   2. Specialios login�s funkcijos:
#      * funkcija exists
#      * funkcija is.vector
#      * funkcija is.numeric
#      * funkcija is.infinite
#      * funkcija is.na
#      * funkcija is.null
#


# PASTABOS ------------------------------

#
# Konspektas papildytas funkcija exists.
# 


# NUSTATYMAI ----------------------------

# Nustatoma lietuvi�ka lokal�. 
Sys.setlocale(locale = "Lithuanian")

# Nustatomas darbinis katalogas.
setwd("C:/Downloads")

# I�trinami visi seni kintamieji.
rm(list = ls())


# --------------------------------------- #
# LOGINI� S�LYG� U�RA�YMAS                #
# --------------------------------------- #

# Skai�i� arba simboli� vektoriaus elementams tikrinant kok� nors login� test�, 
# gaunamas to paties ilgio logini� reik�mi� vektorius. Jo elementas lygus TRUE, 
# jei s�lyga buvo tenkinama, ir lygus FALSE, jei s�lyga netenkinama.

# Palyginimo operatoriai:
#
#    == -- lygu
#    != -- nelygu
#     > -- daugiau
#     < -- ma�iau
#    >= -- daugiau arba lygu
#    <= -- ma�iau arba lygu


x <- c(4, 8, 6, 2, 3, 7, 0, 4, 2, 8)
y <- c(3, 9, 0, 1, 4, 5, 2, 7, 6, 8)

# Pavyzd�iui, patikrinsime, ar vektoriaus x reik�m�s yra teigiamos. Tam sudarome
# login� test�. Gauname tokio pat ilgio logini� reik�mi� vektori�.
x > 0

# Patikrinsime, ar vektoriaus x elementas didesnis u� atitinkam�  vektoriaus y 
# element�.
x > y

# Turint tok� login� vektori�, galima i�rinkti tam tikrus vektoriaus elementus,
# nustatyti reikiam� element� eil�s numerius, patikrinti kitas logines s�lygas.

# Pagrindiniai loginiai operatoriai yra �ie:
#
#     | -- loginis ARBA
#     & -- loginis IR
#     ! -- loginis NE


# Veiksmus galima atlikti ir su atskiromis login�mis konstantomis TRUE ir FALSE.
TRUE | FALSE

!TRUE

# Konstantas TRUE ir FALSE galima ra�yti sutrumpinta forma, atitinkamai T ir F.
a <- c(T, T, F, F)
b <- c(T, F, T, F)

# Kai operandai yra logini� reik�mi� vektoriai, tai login�s operacijos atliekamos 
# su atitinkamais t� vektori� elementais.

a | b   # loginis ARBA
a & b   # loginis IR
!a      # loginis NE

# Operatoriai ARBA ir IR turi ilg�j� form�, || ir &&. Nuo trumposios ji skiriasi
# tuo, kad login� operacija atliekama tik su pirm�j� loginio vektoriaus reik�me.
# �iuos operatorius galima naudoti tokiose situacijose, kur reikia, kad login�s 
# operacijos rezultatas b�t� viena reik�m�: arba TRUE, arba FALSE.

a || b
a && b


# Naudojant loginius operatorius atskiros login�s s�lygos gali b�ti apjungiamos
# ir taip u�ra�omos sud�tingesn�s s�lygos. Pavyzd�iui, patikrinsime ar vektoriaus 
# x element� reik�m�s patenka � interval� [2, 7].

x >= 2 & x <= 7 


# Norint patikrinti, ar bent viena loginio vektoriaus elemento reik�m� yra TRUE, 
# naudojama funkcija any.

any(a)

# Norint patikrinti, ar visi loginio vektoriaus elementai lyg�s TRUE, naudojama
# funkcija all.

all(a)


# NAUDINGA ------------------------------

# Atliekant statistin� duomen� analiz�, kartais reikia patikrinti, ar vektoriaus 
# elementai tenkina tam tikras s�lygas. Naudojant palyginimo operatorius >=, <=,
# >, < ir == sudaromas loginis testas ir gaunamas logini� reik�mi� vektorius. Jo
# reik�mi� patikrinimui galima panaudoti funkcijas any ir all.

# Pavyzd�iui, patikrinsime, ar visos vektoriaus x reik�m�s yra teigiamos. 
# Kadangi login� s�lyga nesud�tinga, j� galima �kelti tiesiai � funkcij� all.
all(x > 0)

# Pavyzd�iui, patikrinsime, ar bent vienas vektoriaus x elementas lygus 0.
any(x == 0)

# Patikrinsime, ar bent vienas vektoriaus x elementas didesnis u� atitinkam� 
# vektoriaus y element�.
any(x > y)

# Konstantos FALSE ir TRUE atitinka skai�ius 0 ir 1, ir tod�l loginius vektorius 
# galima sumuoti. Tokiu b�du surandame TRUE reik�m� turin�i� element� skai�i�.
# Pavyzd�iui, apskai�iuosime, kiek vektoriaus x element� didesni u� atitinkamus
# vektoriaus y elementus.

sum(x > y)


# U�DUOTIS ------------------------------ 

# 1. U�ra�ykite komand�, kuri patikrint�, ar vis� loginio vektoriaus a element� 
#    reik�m�s yra FALSE.
# 2. U�ra�ykite komand�, kuri patikrint�, ar bent vienas vektoriaus x elementas
#    nelygus nuliui.
# 3. Patikrinkite, ar visi vektoriaus x elementai yra i� vektoriaus y element�
#    aib�s. Komand� galima u�ra�yti dviem b�dais: su f-ja is.element ir su %in%.


# --------------------------------------- #
# SPECIALIOS LOGIN�S FUNKCIJOS            #
# --------------------------------------- #

# R turi kelet� speciali� funkcij�, kurios skirtos tam tikroms �vairi� objekt� 
# s�vyb�ms patikrinti. Tokio tipo funkcij� rezultatas yra reik�m� TRUE ar FALSE.

# Kartais reikia patikrinti, ar egzistuoja konkretus kintamasis arba funkcija.
# Tam naudojama funkcija exists. Jos parametrai:
#
#              x -- ie�komo objekto vardas,
#           mode -- kintamojo tipas: "numeric", "function" ir pan.

# Ie�komo objekto vardas ra�omas kabut�se. Pagal nutyl�jim� parametro mode 
# reik�m� yra "any", tod�l ie�komi bet kokie tok� vard� turintys objektai.

exists("x")
exists("x", mode = "function")


# Viena grup� funkcij� patikrina, kokio tipo yra pats objektas:
#
#      is.vector -- ar vektorius,
#      is.matrix -- ar matrica,
#        is.list -- ar s�ra�as,
#  is.data.frame -- ar duomen� lentel�.

is.vector(x)
is.matrix(x)


# Vektoriaus arba matricos elementai paprastai yra sveikieji, realieji skai�iai, 
# simboliai ar login�s reik�m�s. Konkre�iam vektoriaus element� tipui nustatyti 
# naudojamos �ios funkcijos:
#
#     is.numeric -- ar elementai yra skai�iai,
#      is.double -- ar realieji skai�iai,
#     is.integer -- ar sveikieji skai�iai,
#   is.character -- ar simboliai,
#     is.logical -- ar login�s reik�m�s.

# Vektoriaus x elementai yra skai�iai, o vektoriaus a - login�s reik�m�s, tod�l 
# atitinkamos funkcijos gr��ina reik�m� TRUE.

is.numeric(x)
is.logical(a)

is.character(T)
is.character("T")

is.integer(1)
is.integer(1L)


# Atliekant skai�iavimus, rezultatas ne visada yra apibr��tas. Tipin� situacija 
# - skai�iaus dalyba i� nulio. Tokiems atvejams pa�ym�ti naudojamos specialios 
# konstantos: Inf - begalyb� (Infinity) ir NaN - ne skai�ius (Not a Number).

1/0           # neapibr��tumas, skai�iaus dalyba i� nulio
Inf - Inf     # neapibr��tumas, begalyb� minus begalyb�

# Neapibr��tumams nustatyti naudojamos �ios funkcijos:
#
#      is.finite -- ar reik�m� baigtin�,
#    is.infinite -- ar reik�m� begalyb�,
#         is.nan -- ar reik�m� yra NaN.

# Jei funkcijos argumentas yra vektorius arba matrica, tai patikrinami visi t� 
# objekt� sudarantys elementai. Kadangi vektoriaus x elementai yra baigtiniai, 
# funkcijos is.finite rezultatas vektorius, kurio visos reik�m�s yra TRUE.

is.finite(x)

# Sudarysime nauj� vektori� d, kurio elementai gaunami skai�i� 1 padalinus i� 
# vektoriaus x element� reik�mi�.

d <- 1/x

# Patikrinsime, ar gauto vektoriaus d elementai turi apibr��tas reik�mes.

is.infinite(d)
is.nan(d)

# Naudojant anks�iau pamin�t� login� funkcij� all, galima nesunkiai patikrinti, 
# ar visi vektoriaus elementai yra apibr��ti.

all(is.finite(d))


# D�l �vairi� prie�as�i� realiuose duomenyse kartais b�na praleist� reik�mi�. 
# Joms �ym�ti naudojama speciali konstanta NA. 

z <- c(19, 16, NA, 14, 16, 11, 17, NA, 13, 15)
z

# Atitinkamai yra funkcija, kuri patikrina, kurie vektoriaus arba kito objekto 
# elementai yra praleistos reik�m�s:
# 
#          is.na -- ar praleista reik�m�.

# Funkcijos reik�m� lygi TRUE, kai vektoriaus ar kito objekto elemento reik�m� 
# lygi NA. Praleista reik�me laikoma ir konstanta NaN, ta�iau begalyb� - ne.

is.na(NA)
is.na(NaN)
is.na(Inf)

# Jei funkcijos is.na argumentas yra vektorius, matrica ar duomen� lentel�, tai
# patikrinamas kiekvienas elementas. Rezultatas yra tokio pat dyd�io objektas,
# kurio element� reik�m�s yra TRUE, jei tikrinamo elemento reik�m� NA arba NaN, 
# ir FALSE - kitais atvejais.

# Kadangi vektorius x praleist� reik�mi� neturi, funkcijos is.na rezultatas yra 
# tokio pat ilgio vektorius, kurio visos reik�m�s yra FALSE.
is.na(x)

# Vektorius z turi dvi praleistas reik�mes, t� rodo gautos f-jos reik�m�s TRUE.
is.na(z)

# Kadangi konstantos FALSE ir TRUE atitinka skai�ius 0 ir 1, loginius vektorius 
# galima sumuoti. Tokiu b�du surandame TRUE reik�m� turin�i� element� skai�i�.
# Pavyzd�iui, apskai�iuosime, kiek praleist� reik�mi� turi vektorius z.
sum(is.na(z))

# Naudojant anks�iau pamin�tas logines funkcijas any arba all, galima nesunkiai 
# patikrinti, ar vektorius turi bent vien� praleist� reik�m�. Pvz., vektorius x 
# praleist� reik�mi� neturi, tod�l funkcijos any reik�m� yra FALSE.

any(is.na(x))
any(is.na(z))


# Jei funkcijos is.na argumentas yra s�ra�as, tai reik�m� TRUE gr��inama tiems
# s�ra�o elementams, kuri� reik�m� yra NA. Jei s�ra�o elementas yra vien i� NA
# reik�mi� sudarytas vektorius, funkcija is.na gr��ins reik�m� TRUE.

l <- list(a = c(1, 2), b = c(1, NA), c = c(NA, NA), d = NA)
l

is.na(l)


# R turi tu��i� objekt� �ymin�i� konstant� NULL. J� kaip reik�m� priskyrus bet
# kokiam vektoriui, matricai ar kitam objektui, tas objektas tampa NULL objektu.

# Pavyzd�iui, vektoriaus elementai gali tur�ti praleist� reik�m� NA, bet negali 
# �gyti NULL reik�m�s.

c(1, 2, NULL, 4)

# Pavyzd�iui, priskirdami reik�m� NULL, panaikinsime paskutin� s�ra�o l element�.
l[4] <- NULL
l

# NULL objektui nustatyti naudojama speciali login� funkcija:
#
#        is.null -- ar objektas yra NULL.


# N� vieno elemento neturintis vektorius n�ra NULL objektas! Pvz., tok� vektori� 
# pagal nutyl�jim� sukuria funkcija vector arba f-jos numeric, character ir t.t.
v <- vector()
v

# Galima �sitikinti, kad gauto vektoriaus ilgis lygus nuliui.
length(v)

# Toks vektorius neturi joki� atribut� (pavyzd�iui, element� vard�, eilu�i� ar 
# stulpeli� pavadinim�, dimensijos ir t.t.), tod�l funkcija attributes gr��ina 
# tu��i� objekt� NULL.
attributes(v)

# Ta�iau pats vektorius n�ra NULL objektas.
is.null(v)


# NAUDINGA ------------------------------

# Logini� operacij� su praleistomis reik�m�mis rezultatas taip pat yra praleista
# reik�m�. Pavyzd�iui, palyginsime ar vektoriaus z element� reik�m�s didesn�s u� 
# atitinkam� vektoriaus x element� reik�mes.

z > x

# Matome, kad visi z elementai didesni u� x elementus, bet d�l keletos praleist� 
# reik�mi� funkcijos all rezultatas taip pat yra praleista reik�m�.

all(z > x)

# D�l praleist� reik�mi� neveikia ir kitos da�nai naudojamos funkcijos! Pvz., 
# negalima rasti vektoriaus element� sumos, ma�iausios ar did�iausios reik�m�s.

sum(z)
min(z)
max(z)

# Tokios funkcijos turi papildomus parametrus, kurie nustato, kaip interpretuoti 
# praleistas reik�mes ir k� su jomis daryti atliekant veiksmus. Pavyzd�iui, f-ja 
# sum turi parametr� na.rm, kuriam priskyrus reik�m� TRUE, sumuojant praleistos 
# reik�m�s bus ignoruojamos.

sum(z, na.rm = TRUE)


# U�DUOTIS ------------------------------ 

# 1. U�ra�ykite login� s�lyg�, kuri patikrint�, kurie vektoriaus x elementai
#    nepatenka � interval� [2, 7].
# 2. U�ra�ykite komand�, kuri i� vektoriaus z i�rinkt� tik tuos elementus, kurie
#    n�ra praleistos reik�m�s.
# 3. U�ra�ykite komand�, kuri vektoriaus z elementams su praleistomis reik�m�mis
#    priskirt� reik�m� 0.
# 4. U�ra�ykite komand�, kuri patikrint�, ar vektorius d turi bent vien� begalin�
#    element�.
# 5. Sugalvokite b�d� kaip vektoriui v priskirti element� vardus, kad jo atribut�
#    vektorius jau neb�t� NULL objektas.
