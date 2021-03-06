
#
#   Dalykas: STATISTIN�S DUOMEN� ANALIZ�S SISTEMA IR PROGRAMAVIMO KALBA R
#            Vektori� sudarymas ir pagrindin�s j� savyb�s.
#
#  Autorius: Tomas Reka�ius
#
#   Sukurta: 2012-09-03 | 2013-05-06
#


# TURINYS -------------------------------

# 
#   1. Vektori� sudarymas ir j� s�vyb�s:
#      * komanda vector
#      * standartiniai vektoriai
#      * komanda c
#      * komanda length 
#      * komanda mode 
#      * komanda names 
#      * komanda attributes 
#      * komanda attr 
#      * operatorius [
#
#   2. Aritmetin�s progresijos ir pasikartojan�ios sekos:
#      * operatorius :
#      * komanda seq
#      * komanda seq_len
#      * komanda seq_along
#      * komanda rep
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
# VEKTORI� SUDARYMAS                      #
# --------------------------------------- #

# Vektorius yra bazinis ir pats svarbiausias R duomen� formatas. Vektorius gali 
# b�ti sudarytas tik i� to paties tipo reik�mi�. Pagrindiniai tipai yra tokie:
#
# character -- kabut�se ra�omi raid�s, �od�iai, sakiniai ir kiti simboliai;
#   numeric -- realieji skai�iai;
#    double -- taip pat realieji skai�iai, nuo numeric nesiskiria;
#   integer -- sveikieji skai�iai u�ra�omi prira�ant L raid�, pvz., 1L;
#   complex -- a + bi  pavidalu u�ra�omi kompleksiniai skai�iai;
#   logical -- login�s reik�m�s, TRUE, FALSE ir praleistom reik�m�m �ym�ti NA.

# Kiekvienas R objektas turi tam tikrus atributus. Pagrindiniai vektoriaus
# atributai tai yra jo element� skai�ius -- ilgis, ir vektori� sudaran�i�
# reik�mi� tipas. Kitus galimus vektoriaus atributus aptarsime v�liau.

# Jei vektoriaus ilgis ir jo reik�mi� tipas yra �inomi, tok� vektori� galima
# sukurti naudojant funkcij� vector. Jos parametrai:
#
#   mode -- vektorius element� tipas,
# length -- vektoriaus element� skai�ius.


# Priklausomai nuo pasirinkto tipo, vektorius u�pildomas tam tikromis vienodomis
# reik�m�mis. �inoma, v�liau �ias reik�mes galima pakeisti.

vector(mode = "character", length = 10)
vector(mode = "numeric",   length = 10)
vector(mode = "logical",   length = 10)
vector(mode = "complex",   length = 10)

# Konkretaus tipo vektoriui sukurti naudojamos specialios komandos. Vienintelis 
# j� parametras yra vektoriaus ilgis. Pradin�s tokiu b�du sukurto vektoriaus 
# reik�m�s taip pat yra vienodos ir priklauso nuo pasirinkto vektoriaus tipo.

character(10)
numeric(10)
logical(10)


# NAUDINGA ------------------------------

# R turi kelet� standartini� konstant� ir da�nai naudojam� vektori�.

letters       # lotyni�ka ma��j� raid�i� ab�c�l�
LETTERS       # lotyni�ka did�i�j� raid�i� ab�c�l�
month.abb     # sutrumpinti m�nesi� pavadinimai
month.name    # pilni m�nesi� pavadinimai

pi            # skai�ius Pi

NA            # naudojama �ym�ti praleistoms reik�m�ms
NaN           # naudojama �ym�ti neapibr��tumams
Inf           # begalybei �ym�ti naudojama numeric tipo reik�m� 
NULL          # specialus tu��ias objektas


# R kalboje skaliarini� dyd�i� n�ra. Atskirai paimta viena bet kokio tipo reik�m� 
# suprantama kaip vektorius, kurio ilgis lygus vienetui. Labai da�nai vektoriai 
# sudaromi apjungiant kelias reik�mes ar kelis to paties tipo vektorius. Tokiam 
# apjungimui naudojama funkcija c.

a <- c(1, 4, 5, 2, 3)
a

b <- "Visas sakinys yra viena 'character' tipo reik�m�."
b

x <- c(1, 2, 3)
y <- c(4, 5, 6)
z <- c(7, 8, 9)
u <- c(x, y, z)
u

# Vektoriaus ilgiui (jo element� skai�iui) surasti naudojama komanda length.
length(a)
length(b)

# Vektoriaus element� tipui nustatyti naudojama komanda mode. 
mode(a)
mode(b)

# Taip galima patikrinti ir vienos atskirai paimtos reik�m�s tip�.
mode(NA)
mode(NaN)
mode(TRUE)
mode("T")
mode(T)
mode("pi")
mode(pi)
mode(0+0i)

# NULL yra specifinis -- tu��ias objektas, tod�l jis turi special� tip�.
length(NULL)
mode(NULL)


# Vektoriaus elementai gali tur�ti vardus. Juos galima nurodyti vektoriaus
# sudarymo metu arba vard� vektori� galima priskirti jau turimam vektoriui.

d <- c(sausis = 31, vasaris = 28, kovas = 31, balandis = 30)
d

# Vektoriaus element� vardai taip pat sudaro vektori�, o j� ilgiai sutampa.
names(d)
mode(names(d))

length(d)
length(names(d))

# Ta pati komanda names naudojama pakeisti arba sudaryti nauj� vard� vektori�.
# Tarkime, kad turime vektori�, kurio elementai neturi vard�, t.y. jo vard� 
# vektorius yra tu��ias, tod�l komanda names gr��ina reik�m� NULL.

a
names(a)

# Vard� vektoriui suteikiame reik�m� -- vektori� su element� pavadinimais.
names(a) <- c("pirmas", "antras", "tre�ias", "ketvirtas", "penktas")

# Vektoriaus element� reik�m�s nepasikeit�, ta�iau dabar jis be ilgio ir
# reik�mi� tipo turi dar vien� atribut� -- vardus.
a
names(a)


# U�DUOTIS ------------------------------ 

# 1. Patikrinkite teigin�, kad vektoriaus d ir jo vard� vektoriaus ilgiai sutampa.
# 2. Apskai�iuokite, kokio ilgio yra vektorius LETTERS.
# 3. Apskai�iuokite vektoriaus u ilg� ir nustatykite jo tip�.


# Vektoriaus ar kito R objekto atributams parodyti naudojama komanda attributes. 

# Anks�iau sudarytas vektorius a turi vienintel� pakei�iam� atribut� -- vardus.
attributes(a)

# Vektorius b tokio atributo neturi, tod�l funkcija gr��ina tu��i� objekt� NULL.
attributes(b)


# Vektoriaus ar kito objekto atributams sukurti ir pakeisti yra keletas b�d�. 
# Vieno kurio nors atributo reik�m�s priskyrimui naudojama komanda attr.

# Vektoriaus vardai yra jo atributas, tod�l j� taip pat galima pakeisti su attr.
attr(a, "names") <- c("I", "II", "III", "IV", "V")

# Vektoriaus atributas gali b�ti ir bet kokia papildoma informacija apie vektori�.
attr(a, "versija") <- "0.9"
attr(a, "data")    <- "2013-05-06"

attributes(a)
a

# Kartais reikia panaikinti tik vektoriaus element� vardus. Pats papras�iausias 
# b�das tai padaryti -- vard� vektoriui priskirti NULL reik�m�.

names(a) <- NULL
names(a)
a

# Analogi�ku b�du galima panaikinti ir visus vektoriaus atributus ir karto.
attributes(a) <- NULL
attributes(a)
a


# U�DUOTIS ------------------------------ 

# 1. Sugalvokite b�d�, kaip vektoriaus vardus panaikinti naudojant komand� attr?


# Bet kur� vektoriaus element� galima pasiekti lau�tiniuose skliaustuose nurod�ius 
# jo eil�s numer�. Pvz., i�renkame tre�i� vektoriaus d element�.
d[3]

# Galima i�skirti kelis vektoriaus elementus i� karto. Tokiu atveju reikia sudaryti 
# i�renkam� element� indeks� aib� -- sukurti j� numeri� vektori�.
i <- c(3, 4)
d[i]

# I�renkam� element� tvarka neb�tinai turi sutapti su j� tvarka tame vektoriuje.
i <- c(4, 1)
d[i]


# U�DUOTIS ------------------------------ 

# 1. Naudodami indeks� vektori�, vektoriaus d elementus i�rikiuokite  prie�inga tvarka.
# 2. Sudarykite tok� indeks� vektori�, kur� naudojant pirmasis vektoriaus d elementas 
#    b�t� i�renkamas tris kartus.


# Vektoriaus elementus galima i�rinkti sudarius to paties ilgio logini� reik�mi� 
# vektori�, kur TRUE rei�kia, jog reik�m� reikia i�rinkti, o FALSE -- nei�rinkti.
# Pvz., i� vektoriaus d i�rinksime pirm� ir tre�i� narius.

i <- c(TRUE, FALSE, TRUE, FALSE)
i
d[i]

# Toks indeks� vektorius labai da�nai gaunamas tikrinant koki� nors s�lyg�.
# Pvz., i� vektoriaus d i�skirsim tuos elementus, kuri� reik�m� didesn� u� 30.

i <- d > 30
i
d[i]

# Jei vektoriaus elementai turi vardus, tai konkret� vektoriaus element� galima
# i�rinkti nurod�ius jo vard�.

i <- "vasaris"
d[i]

i <- c("kovas", "balandis")
d[i]


# U�DUOTIS ------------------------------ 

# 1. I� vektoriaus d i�skirkite tuos elementus, kuri� reik�m� tiksliai lygi 30.
# 2. Sudarykite tok� vard� vektori�, kad vektoriaus d elementus i�vest� j� vard� 
#    ab�c�l�s tvarka.


# NAUDINGA ------------------------------

# Programuojant su R, kai kurios tipin�s konstrukcijos u�ra�omos labai kompakti�kai. 
# Pvz., jei vektoriaus element� i�rinkimas yra vienkartinis ir niekur nepasikartoja, 
# tai tok� indeks�, j� vektori� ar login� s�lyg� galima �kelti tiesiai � lau�tinius 
# skliaustus -- bus trumpiau.

d[c(4, 1)]
d[d > 30]
d["vasaris"]

# Jei veiksm� su vektoriais rezultatas yra vektorius, i� kurio reikia dar kart� 
# i�rinkti tam tikr� element�, tok� veiksm� galima padaryti dar kart� naudojant 
# i�rinkimo operatori� [ ir nesukuriant tarpinio vektoriaus. Pvz., i� vektoriaus 
# d i�rinksime antr�j� m�nes�, kurio dien� skai�ius didesnis u� 30.

d[d > 30][2]

# Komandos names rezultatas yra vektoriaus element� vard� vektorius (�inoma, jei  
# jis egzistuoja). Tokio vektoriaus element� galima i�rinkti kaip i� bet kurio 
# kito vektoriaus. Pvz., i�rinksime pirmojo vektoriaus d elemento vard�.

names(d)[1]


# U�DUOTIS ------------------------------ 

# 1. U�ra�ykite komand�, kuri bet kokio ilgio vektoriui i�rinkt� paskutin� to 
#    vektoriaus vard� vektoriaus element�.


# --------------------------------------- #
# ARITMETIN�S IR PASIKARTOJAN�IOS SEKOS   #
# --------------------------------------- #

# Tarkime, kad mums reikalingas vis� nat�rini� skai�i� nuo 1 iki 10 vektorius.
s <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
s

# Sveik�j� skai�i� aritmetin� progresij� su �ingsniu 1 arba -1 galima u�ra�yti
# labai kompakti�kai. Tam reikia per dvita�k� nurodyti pirm� ir paskutin� sekos 
# narius.

1:10  # sekoje de�imt sveik�j� skai�i� nuo 1 iki 10

-5:5  # skai�iai sekoje gali b�ti neigiami

10:1  # skai�i� seka gali b�ti ir ma��janti


# Sud�tingesn�ms aritmetin�ms progresijoms sudaryti skirta proced�ra seq. 
# Jos parametrai:
#
#       from -- pirmojo generuojamos sekos nario reik�m�,
#         to -- paskutinio generuojamos sekos nario reik�m�,
#         by -- generuojamos sekos �ingsnis,
# length.out -- visos sekos element� skai�ius,
# along.with -- vektorius, kurio element� skai�ius bus sekos ilgis.


# Pvz., t� pa�i� skai�i� sek� nuo 1 iki 10 galima u�ra�yti taip:
s <- seq(from = 1, to = 10, by = 1)
s

# Jei parametrai nurodomi nustatyta tvarka, j� vard� galima visai nera�yti. 
s <- seq(1, 10, 1)
s

# Pagal nutyl�jim� sekos �ingsnis lygus 1, tod�l ir parametro by galima nera�yti.
s <- seq(1, 10)
s

# Naudojant t� pa�i� funkcij� galima keisti sekos �ingsn� ar nari� skai�i�.
seq(1, 10, by = 0.5)                 # nurodome reikiam� sekos �ingsn� 
seq(1, 10, length.out = 19)          # nurodome bendr� sekos nari� skai�i�

# Jei reikia sukurti sek�, kurios ilgis lygus kito vektoriaus element� skai�iui,
# tada naudojamas parametras along.with, kuriam priskiriamas tas vektorius.

d
seq(along.with = d)

# Kit� parametr� reik�mes taip pat galima keisti, pvz., nurodyti sekos prad�i� 
# ar pabaig�, taip pat galima nurodyti sekos �ingsn�.

seq(from = 1, to = 10, along.with = d)
seq(from = 10, by = 2, along.with = d)
seq(to   = 10, by = 2, along.with = d)


# NAUDINGA ------------------------------

# Jei sekos generavimui naudojamas vien tik parametras length.out, vietoje komandos
# seq(length.out = x) galima naudoti komand� seq_len(x).

seq(length.out = 10)
seq_len(10)

# Jei sekos generavimui naudojamas vien tik parametras along.with, vietoje komandos
# seq(along.with = x) galima naudoti komand� seq_along(x).

seq(along.with = d)
seq_along(d)

# Parametro from interpretacija priklauso nuo to, kokia reik�m� jam suteikiama: jei 
# vienas skai�ius x, tai funkcijos seq(x) rezultatas bus kaip funkcijos seq_len(x), 
# jei vektorius x -- kaip funkcijos seq_along(x).

x <- 10
seq(x)

x <- c(F, F, T)
seq(x)


# U�DUOTIS ------------------------------ 

# 1. Su komand� seq sudarykite sek� i� ma�esni� nei 100 nelygini� nat�rini� skai�i�.
# 2. Su komand� seq sudarykite sek�, kuri atkarp� [0, 1] padalina � 10 lygi� dali�.
# 3. Antro u�davinio rezultat� gaukite funkcijoje seq nenaudojant parametro by.
# 4. Antro u�davinio rezultat� gaukite i� vis nenaudodami funkcijos seq.


# Pasikartojan�i� element� turin�ios sekos generavimui naudojama funkcija rep. 
# Jos parametrai:
#
#          x -- vektorius, kur� reikia pakartoti,
#      times -- viso vektoriaus pakartojim� skai�ius,
# length.out -- bendras sekos element� skai�ius,
#       each -- vektoriaus element� pakartojim� skai�ius.


# Sudarome vektori� (1, 2, 3), kurio elementus pakartosime �vairiais b�dais.
v <- 1:3
v

# Viso vektoriaus pakartojim� skai�i� nurodo parametras times. Tokiu atveju prie 
# vektoriaus galo prijungiamas toks pat vektorius ir tai pakartojama kelet� kart�.
rep(v, times = 3)

# Vektoriaus element� pakartojim� skai�ius gali b�ti individualus. Tokiu atveju 
# parametro times reik�m� bus tokio pat ilgio vektorius su pakartojim� reik�m�mis.
rep(v, times = c(1, 5, 1))

# Tuo atveju, jei visi vektoriaus elementai turi b�ti pakartoti vienod� skai�i�
# kart�, papras�iau t� skai�i� nurodyti parametrui each -- komanda bus ai�kesn�.
rep(v, times = c(2, 2, 2))
rep(v, each = 2)

# Sugeneruotos sekos ilgis neb�tinai turi b�ti vektoriaus x ilgio kartotinis, jos 
# ilg� galima apriboti per parametr� length.out. Pvz, vektori� v kartojame, kol 
# visos sekos ilgis bus lygus 10.
rep(v, length.out = 10)

# Gali b�ti nurodomi i� karto keli argumentai, ta�iau svarbu �inoti, kad parametras 
# each turi didesn� prioritet� prie� parametr� times.
rep(v, each = 2, times = 2)

# Pakartojamas vektorius gali b�ti bet kokio tipo. Jis gali tur�ti ir vien� reik�m�.
rep(1, times = 5)

# Jei parametrai u�ra�omi ta pa�ia tvarka, j� pavadinim� galima nera�yti.
rep(1, 5)


# U�DUOTIS ------------------------------ 

# 1. Komandos rep(1, 5) rezultat� gaukite panaudodami funkcij� seq.
# 2. U�ra�ykite rep komand�, kuri i� vektoriaus v sudaryt� sek� 1, 2, 2, 3, 3, 3.
