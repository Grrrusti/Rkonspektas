
#
#   Dalykas: STATISTIN�S DUOMEN� ANALIZ�S SISTEMA IR PROGRAMAVIMO KALBA R
#            Funkcijos reik�m�s skai�iavimas duomen� grup�se.
#
#  Autorius: Tomas Reka�ius
#
#   Sukurta: 2013-09-07 | 2013-09-10
#


# TURINYS -------------------------------

#
#   1. Funkcijos skai�iavimas pagal vektoriaus element� grupes:
#      * funkcija tapply
#      * funkcija split
#
#   2. Funkcijos skai�iavimas duomen� lentel�s grup�se:
#      * funkcija by
#      * funkcija aggregate 
#


# PASTABOS ------------------------------

#
# Pastab� dar n�ra.
# 


# NUSTATYMAI ----------------------------

# Nustatoma lietuvi�ka lokal�. 
Sys.setlocale(locale = "Lithuanian")

# Nustatomas darbinis katalogas.
setwd("C:/Downloads")

# I�trinami visi seni kintamieji.
rm(list = ls())


# --------------------------------------- #
# FUNKCIJA TAPPLY                         #
# --------------------------------------- #

# Atliekant duomen� analiz�, tam tikras skaitines charakteristikas kartais tenka
# skai�iuoti ne visam duomen� rinkiniui, bet atskiroms duomen� grup�ms. Tai gali
# b�ti atlyginim� vidurkis vyrams ir moterims arba pokalbi� telefonu laiko sumos
# kiekvienam m�nesiui atskirai, kai �inomos kiekvienos dienos pokalbi� trukm�s.

# Tuo atveju, kai t� pa�i� funkcij� reikia pritaikyti keliems vieno vektoriaus 
# pogrupiams, naudojama funkcija tapply. Jos parametrai:
# 
#        X -- duomen� vektorius,
#    INDEX -- duomenis grupuojantis vektorius,
#      FUN -- funkcijos pavadinimas arba jos i�rai�ka,
# simplify -- jei TRUE, rezultatas gr��inamas kaip vektorius.

# Parametrui INDEX priskiriamas vektorius turi tur�ti tiek pat element�, kiek ir
# duomen� vektorius X. Paprastai tai yra kelias diskre�ias reik�mes turintis 
# kategorinis kintamasis, kuris kiekvien� duomen� vektoriaus element� priskiria 
# tam tikrai grupei.

x <- c(962, 826, 798, 600, 834, 532, 407, 484, 856, 667, 417, 541, 103, 904, 523)
g <- c("B", "B", "A", "A", "B", "B", "B", "A", "B", "B", "B", "A", "A", "A", "B")

# Pvz., apskai�iuosime vektoriaus x vidurk� grup�se pagal vektoriaus g element� 
# reik�mes. Rezultatas yra s�lyginis x vidurkis atskirai grup�je A ir grup�je B.

tapply(x, g, mean)

# Kintamojo grupavimas gali b�ti atliekamas i� karto pagal kelis po�ymius. Tokiu
# atveju parametrui INDEX nurodomas grupavimo kintam�j� list tipo s�ra�as.

# Tarkime, kad pirmieji 8 kintamojo x stebini� yra i� grup�s I, lik� 7 i� gr. II.
# Sukursime tokias reik�mes turint� kintamaj�. 

p <- rep(c("I", "II"), c(8, 7))

# Apskai�iuosime vidurkius pagal kintamuosius p ir g. Rezultatas yra s�lyginiai
# vidurkiai grup�se I-A, I-B, II-A ir II-B.

tapply(x, list(p, g), mean)

# �sta�ius funkcij� length, galima su�inoti, kiek vektoriaus x element� patenka
# � kiekvien� i� grupi� I-A, I-B, II-A ir II-B.

tapply(x, list(p, g), length)

# � tapply �statomos funkcijos gali tur�ti savo parametrus. Pavyzd�iui, vidurkio
# skai�iavimui naudojama funkcija mean ir daugelis kit� funkcij� turi parametr� 
# na.rm, kuriam priskyrus reik�m� TRUE, praleistos duomen� reik�m�s ignoruojamos.

# Apskai�iuosime vektoriaus y, kuris turi praleist� reik�mi�, element� vidurk� 
# grup�se pagal kintamaj� g.

y <- c(962, NA, 798, 600, 834, 532, 407, 484, NA, 667, 417, 541, NA, 904, 523)

tapply(y, g, mean, na.rm = TRUE)


# � funkcij� tapply galima �ra�yti standartin�s funkcijos vard� arba, jei tokios
# funkcijos n�ra, u�ra�yti reikalingos funkcijos i�rai�k�. Pvz., apskai�iuosime
# skirtum� tarp did�iausios ir ma�iausios vektoriaus x reik�m�s grup�se. Pirm�j�
# funkcijos variant� u�ra�ysime naudojant tradicines funkcijas min ir max.

tapply(x, g, function(v) max(v) - min(v))

# Tok� pat rezultat� galima gauti sudarant ma�iausios ir did�iausios vektoriaus
# reik�m�s radimo ir gretim� vektoriaus element� skirtumo funkcij� superpozicij�.
# Toks funkcijos u�ra�ymo b�das atitinka funkcinio programavimo su R stili�.

tapply(x, g, function(v) diff(range(v)))


# Naudojant funkcij� tapply, galima ne tik skai�iuoti s�lygines charakteristikas,
# bet ir atlikti gana sud�tingus veiksmus skirtingose duomen� grup�se. Pvz., tai 
# gali b�ti tos pa�ios statistin�s hipotez�s tikrinimas grup�se, pana�i� grafik� 
# naudojant duomenis i� skirting� grupi� brai�ymas ir pan. Priklausomai nuo to, 
# kokie veiksmai grup�se atliekami, rezultatas kartais gali b�ti gana sud�tingas
# objektas: s�ra�as, da�ni� lentel�, grafikai ir t.t.

# Pavyzd�iui, sudarysime kintamojo p reik�mi� da�ni� lentel� A ir B grup�se.

tapply(p, g, table)


# Nors funkcijos tapply argumentai X ir INDEX yra vektoriai, ta�iau �i funkcija
# da�nai pritaikoma duomen� lentel�s vieno kintamojo charakteristik� ska�iavimui
# grup�se pagal kito kintamojo reik�mes.

d <- read.table(header = TRUE, text = "
   lytis  �gis svoris grup�
  vyras   175     76     B
  vyras   180     NA     B
moteris   170     67     A
moteris   167     64     B
  vyras   178     80     A
moteris   172     59    NA
  vyras   184     NA     A
moteris   171     68     B
moteris   177     70     A
  vyras   185     84     B
")

# Pavyzd�iui, apskai�iuosime duomen� lentel�je d u�ra�yto �gio vidurk� atskirai 
# vyrams ir moterims. Funkcijai perduodame � atskirus vektorius i�skirtus lyties 
# ir �gio kintamuosius. Tai galima atlikti keliais skirtingais b�dais.

tapply(d[, 2], d[, 1], mean)

tapply(d[, "�gis"], d[, "lytis"], mean)

tapply(d$�gis, d$lytis, mean)


# Jei funkcijai perduodamas lentel�s kintamojo vardas labai ilgas, kartais visa
# funkcija �keliama � with konstrukcij�, kur nurodome, i� kokios aplinkos imami
# kintam�j� vardai. �iuo atveju kaip aplink� nurodome duomen� lentel�s vard�, o 
# funkcijai perduodame tos lentel�s kintam�j� vardus. Kai lentel�s vardas labai
# ilgas, toks u�ra�ymo b�das gaunasi gerokai ai�kesnis ir trumpesnis.

with(data = d, tapply(�gis, lytis, mean))


# NAUDINGA ------------------------------

# Funkcija tapply duomen� vektori� suskaido � kelias grupes ir kiekvienai i� j� 
# pritaiko t� pa�i� funkcij�. Tuo pa�iu j� galima panaudoti duomen� sudalijimui 
# � atskiras dalis pagal ka�kok� grupuojant� kintam�j�.

# Nenurod�ius parametro FUN, tapply rezultatas yra duomen� vektoriaus X element�
# pogrupi�, � kuriuos jie patenka, numeri� vektorius.

tapply(x, g)

# Parametrui FUN nurod�ius i�skyrimo operatori� [, duomen� vektorius suskaidomas
# ir sudaromas toki� atskirt� grupi� s�ra�as.

tapply(x, g, "[")

# Paprastai tokiam duomen� i�skyrimui � atskiras dalis pagal ka�kok� grupuojant�
# kintam�j� naudojama speciali funkcija split.

split(x, g)

# Kadangi funkcijos split rezultatas yra s�ra�as, veiksmams su s�ra�o elementais
# atlikti naudojamos funkcijos sapply ir lapply. Pvz., apskai�iuosime vektoriaus
# x vidurkius grup�se pagal kintam�j� g.

sapply(split(x, g), mean)


# Toks vektoriaus suskaidymas � grupes gali b�ti atliekamas ne tik skai�iuojant 
# s�lygines charakteristikas, bet ir pertvarkant duomenis. Pavyzd�iu, naudojant
# i�skyrimo operatori�, i� kiekvienos vektoriaus x grup�s i�skirsime pirm�j� jo
# element�.

tapply(x, g, "[", 1)


# Kartais grupavimo kintamasis gali b�ti gaunamas i� pradinio duomen� vektoriaus 
# u�ra�ant jam koki� nors login� s�lyg�. Pvz., � dvi atskiras grupes atskirsime 
# lyginius ir nelyginius vektoriaus x elementus.

tapply(x, x %% 2 == 0, "[")

# Toki� pat s�lyg� galima perkelti ir � funkcij� split.

split(x, x %% 2 == 0)


# U�DUOTIS ------------------------------ 

# 1. Naudojant f-j� tapply, apskai�iuokite vektoriaus x element� sum� suskaidant
#    x � pogrupius pagal vektoriaus p element� reik�mes.
# 2. Naudojant f-j� tapply, raskite ma�iausi� ir did�iausi� vektoriaus x reik�m�
#    grup�se pagal kintamaj� p.
# 3. Apskai�iuokite duomen� lentel�s kintamojo "svoris" vidurk� atskirai vyr� ir
#    moter� grup�se. Atsi�velkite � tai, kad kintamasis turi praleist� reik�mi�.
# 4. Naudojant f-j� tapply, i� vektoriaus x element� suskirstytus grup�mis pagal 
#    kintam�j� g, sudarykite matricas, kurios tur�t� po vien� stulpel�.
# 5. Naudojant tapply, i� kiekvienos, pagal vektori� g suskirstyt�, vektoriaus x
#    element� grup�s i�skirkite po pirmuosius du elementus.
# 6. Naudojant tapply, u�ra�ykite funkcij�, kuri apskai�iuot�, kiek vektoriaus y
#    element� turi praleistas reik�mes ir kiek neturi. Kaip tok� pat� rezultat�
#    gauti nenaudojant funkcijos tapply?


# --------------------------------------- #
# FUNKCIJA BY                             #
# --------------------------------------- #

# Funkcija tapply naudojama kit� funkcij� skai�iavimui kaip duomenis naudojant �
# grupes i�skaidytus vektoriaus elementus. Analogi�ka funkcija duomen� lentel�ms
# arba matricoms yra by. Jos parametrai:
# 
#          data -- duomen� lentel� arba matrica,
#       INDICES -- duomenis grupuojantis faktorius arba j� s�ra�as,
#           FUN -- funkcijos pavadinimas arba i�rai�ka,
#      simplify -- jei TRUE, rezultatas gr��inamas kaip vektorius.

# Duomen� lentel�s eilut�s pagal vieno ar keletos kategorini� kintam�j� reik�mes
# suskirstomos � grupes. Taip gaunamos kelios ma�esn�s duomen� lentel�s, ir tada 
# kiekviena i� j� perduodama argumento FUN funkcijai. Jei grupavimas atliekamas
# pagal kelis kintamuosius, jie parametrui INDICES perduodami apjungti � s�ra��.

# Pa�iu papras�iausiu atveju funkcija by naudojama lygiai taip pat kaip ir f-ja
# tapply, skiriasi tik rezultat� i�vedimo forma. Pvz., apskai�iuosime vektoriaus 
# x vidurk� grup�se pagal vektoriaus g element� reik�mes. 

by(x, g, mean)

# Skai�iavimus grup�se galima atlikti su vienu duomen� lentel�s kintamuoju. Pvz., 
# apskai�iuosime lentel�s d kintamojo �gis vidurk� atskirai vyrams ir moterims.
# �ia kintamasis �gis vidurkio skai�iavimo funkcijai perduodamas kaip vektorius. 

by(d[, 2], d[, 1],  mean)    # nurodome stulpeli� numerius
by(d$�gis, d$lytis, mean)    # nurodome kintam�j� vardus

# Vis� i�rai�k� �d�jus � funkcij� with, lentel�s kintam�j� vardus galima naudoti 
# tiesiogiai. Tokiu b�du u�ra�yta i�rai�ka lengviau skaitoma ir suprantama.

with(d, by(�gis, lytis, mean))


# Naudojant by, funkcijai galima perduoti daugiau nei vien� kintam�j� turin�i� 
# duomen� lentel�. Pvz., apskai�iuosime kintam�j� �gis ir svoris koreliacijos 
# koeficient� atskirai vyr� ir moter� grup�se.

# Kaip ir anks�iau, vis� by i�rai�k� �d�sime � with konstrukcij�. Funkcijai cor
# perduodamus kintamuosius �gis ir svoris apjungiame � duomen� lentel� naudodami 
# komand� cbind. Kadangi �i lentel� turi praleist� reik�mi�, papildomai nurodome 
# funkcijos cor parametr� use = "complete.obs", tod�l stebiniai su praleistomis 
# reik�m�mis nebus naudojami.

with(d, by(cbind(�gis, svoris), lytis, cor, use = "complete.obs"))

# Jei eilut�s su praleistomis reik�m�mis b�t� panaikinamos i� anksto, funkcijai
# nereik�t� nurodyti parametro apie praleistas reik�mes. Tam galima naudoti f-j�
# na.omit, kurios rezultatas yra duomen� lentel� be NA reik�mi� turin�i� eilu�i�.

with(na.omit(d), by(cbind(�gis, svoris), lytis, cor))

# Ta�iau tokiu b�du visai be reikalo i�metama ir 6-ta eilut�, kurioje NA reik�m� 
# turi koreliacijos skai�iavime nenaudojamas kintamasis grup�. D�l to, eilutes
# su NA reik�m�mis reikia i�mesti neatsi�velgiant � ketvirtame stulpelyje esant�
# kintam�j� grup�.

with(na.omit(d[, -4]), by(cbind(�gis, svoris), lytis, cor))

# Vietoj kintam�j� vard� nurodant stulpeli� numerius, ta pati i�rai�ka u�ra�oma 
# �iek tiek trumpiau.

by(d[, 2:3], d[, 1], cor, use = "complete.obs")


# Da�nai papras�iau funkcijai kaip duomenis perduoti visus lentel�s kintamuosius.
# U�ra�ysime funkcij�, kuri apskai�iuoja ne koreliacij� matric�, bet tik dviej�
# konkre�i� lentel�s kintam�j� koreliacijos koeficientus grup�se pagal lyt�. �ia
# reikiami kintamieji i� f-jai perduotos lentel�s i�renkami jau funkcijos viduje.

by(d, d$lytis, function(x) cor(x$�gis, x$svoris, use = "complete.obs"))


# U�DUOTIS ------------------------------ 

# 1. Nagrin�kime duomen� lentel� d. Naudodami funkcij� by ir t.test, padalinkite
#    duomenis pagal kintam�j� grup� � dvi dalis bei patikrinkite hipotezes, kad 
#    �gio vidurkis grup�je lygus 180 cm.
# 2. Duomen� lentel�je airquality yra �vairi� oro parametr� Niujorke matavimai.
#    Apskai�iuokite, kiek praleist� ozono matavim� yra kiekvien� m�nes�. T� pat�
#    rezultat� gaukite naudodami funkcijas by arba tapply.
# 3. Nagrin�kime duomen� lentel� airquality. Sudarykite ozono priklausomyb�s nuo
#    temperat�ros paprastosios tiesin�s regresijos model� ir, naudojant funkcij� 
#    by, �vertinkite �i� modelio parametrus kiekvienam m�nesiui atskirai.


# --------------------------------------- #
# FUNKCIJA AGGREGATE                      #
# --------------------------------------- #

# Kaip ir funkcija by, funkcija aggregate duomen� lentel� pagal vieno ar keletos
# kategorini� kintam�j� reik�mes suskirsto � grupes. Pagrindinis skirtumas toks,
# kad skai�iavimams perduodama ne duomen� lentel�, ta�iau j� sudaran�i� kitam�j�
# rinkinys. D�l to funkcija aggregate da�niausiai naudojama atskir� kintam�j� t� 
# pa�i� skaitini� charakteristik� skai�iavimui ir �iuo po�i�riu labiau pana�i � 
# funkcij� tapply. Jos parametrai:
# 
#             x -- duomen� lentel�, matrica arba vektorius,
#            by -- s�ra�as su duomenis grupuojan�i� faktori� vardais,
#           FUN -- funkcijos pavadinimas arba i�rai�ka.

# Reikia atkreipti d�mes�, kad �ios funkcijos parametrui by visada nurodomas tik
# grupuojan�i� kintam�j� list tipo s�ra�as (net jei toks kintamasis yra vienas).

# Pavyzd�iui, apskai�iuosime vektoriaus x vidurkius grup�se pagal kintam�j� g.

aggregate(x, list(g), mean)


# Grupavimo kintamasis gali b�ti neb�tinai vienas. Pvz., apskai�iuosime �gio ir 
# svorio i� lentel�s d vidurkius pagal lyt� ir stebini� grup�. Kadangi lentel� 
# turi praleist� reik�mi�, papildomai nurodome funkcijos mean parametr� na.rm.
# Rezultatas yra atskirai kiekvieno kintamojo vidurki� grup�se lentel�.

aggregate(d[, 2:3], list(d[, 1], d[, 4]), mean, na.rm = TRUE)

# T� pa�i� i�rai�k� �kelsime � funkcij� with ir perra�ysime tiesiogiai naudodami 
# lentel�s kintam�j� vardus.

with(d, aggregate(cbind(�gis, svoris), list(lytis, grup�), mean, na.rm = TRUE))


# Funkcija aggregate leid�ia duomen� suskaidym� u�ra�yti formule. �iuo atveju
# skiriasi jos parametrai:
#
#   formula -- duomen� suskaidymo formul�,
#      data -- duomen� lentel�s vardas,
#       FUN -- funkcijos vardas arba jos i�rai�ka,
#    subset -- i�rai�ka, kuri i� duomen� lentel�s i�renka tam tikras eilutes,
# na.action -- pagal nutyl�jim� na.omit - nurodo, kad NA reik�mes pa�alinti.


# Galimi tokie formul�s u�ra�ymo variantai:
#
#           y ~ A -- y suskaidomas � grupes pagal kintamojo A reik�mes,
#       y ~ A + B -- y suskaidomas pagal kintam�j� A ir B reik�mes,
# cbind(y, x) ~ A -- y ir x suskaidomi pagal kintamojo A reik�mes,
#           . ~ A -- visi lentel�s kintamieji suskaidomi pagal A reik�mes,
#           y ~ . -- y suskaidomas pagal visus likusius lentel�s kintamuosius.


# Dar kart� apskai�iuosime vektoriaus x vidurkius grup�se pagal vektori� g. ��
# kart� suskirstym� u�ra�ysime formule. Kadangi vektoriai ne i� duomen� lentel�s,
# parametro data nurodyti nereikia.

aggregate(x ~ g, FUN = mean)

# Apskai�iuosime kintamojo �gis i� duomen� lentel�s d vidurk� atskirai vyrams ir 
# moterims. Nurod�ius duomen� lentel�s vard�, formul�je galima tiesiogiai ra�yti 
# kintam�j� vardus.

aggregate(�gis ~ lytis, data = d, FUN = mean)

# Apskai�iuosime �gio ir svorio i� lentel�s d vidurk� grup�se pagal kategorinius 
# kintamuosius lyt� ir grup�. Kair�je formul�s pus�je esan�ius kintamuosius 
# reikia apjungti � vien� lentel�. Tam naudojama komanda cbind.

aggregate(cbind(�gis, svoris) ~ lytis + grup�, data = d, FUN = mean)

# Kadangi abu kintamieji lytis ir grup� yra kategoriniai, o kit� kintam�j� n�ra,
# juos galima pakeisti ta�ku. �ia reikia suprasti, kad �gis ir svoris grupuojami
# pagal visus likusius lentel�s d kintamuosius.

aggregate(cbind(�gis, svoris) ~ ., data = d, FUN = mean)

# T� pat� galima padaryti ir su kit� dviej� kintam�j� pora. Toks u�ra�ymo b�das 
# patogus, jei suskaidym� reikia atlikti daugeliui kintam�j� i� karto, nes �iuo 
# atveju nereikia ra�yti j� vis� vard�.

aggregate(. ~ lytis + grup�, data = d, FUN = mean)


# Jei reikia, funkcija aggregate leid�ia grupuoti tik tam tikras logines s�lygas 
# tenkinan�ias eilutes. Tokiu atveju parametrui subset nurodome login� i�rai�k�.
# Pavyzd�iui, apskai�iuosime �gio vidurkius ma�iau nei 80 kg sveriantiems vyrams 
# ir moterims. �iuo atveju parametrui subset nurodome s�lyg� svoris < 80.

aggregate(�gis ~ lytis, data = d, subset = svoris < 80, FUN = mean)


# U�DUOTIS ------------------------------ 

# 1. Lentel�je chickwts yra eksperimento, kurio metu vi��iukams buvo duodami tam
#    tikri maisto priedai ir matuojamas j� svoris, rezultatai: kintamasis weight
#    ir feed. Apskai�iuokite vi��iuk� svorio vidurkius grup�se pagal tai, kokius 
#    maisto priedus jie gavo. U�ra�ykite funkcijos aggregate versij� grupavimui 
#    naudojant formul�. Kaip tok� pat� rezultat� gauti naudojant tapply arba by?
# 2. Duomen� lentel�je airquality yra �vairi� oro parametr� Niujorke matavimai.
#    Apskai�iuokite vidutin� kiekvieno m�nesio oro temperat�r� naudojant f-jas
#    aggregate ir tapply.
