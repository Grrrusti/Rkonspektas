
#
#   Dalykas: STATISTIN�S DUOMEN� ANALIZ�S SISTEMA IR PROGRAMAVIMO KALBA R
#            Grafiko antra�t�s ir kitas papildomas tekstas.
#
#  Autorius: Tomas Reka�ius
#
#   Sukurta: 2014-06-10 | 2014-06-29
#


# TURINYS -------------------------------

#
#   1. Grafiko antra�t�s formavimo funkcijos:
#      * funkcija title
#      * funkcija expression
#      * funkcija substitute
#
#   2. Papildomo teksto ant grafiko u�d�jimas:
#      * funkcija text
#      * funkcija mtext
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
# DIAGRAMOS ANTRA��I� FORMAVIMAS          #
# --------------------------------------- #

# Funkcija plot ir kitos auk�to lygio grafin�s funkcijos turi standartinius a�i�
# ir pagrindin�s grafiko antra�t�s nustatymo parametrus: xlab, ylab ir main. Bet
# kartais a�i� ir viso grafiko antra��i� formavimui gali b�ti naudojama speciali 
# funkcija title. Pagrindiniai jos parametrai yra tokie:
#
#       main -- pagrindin�s antra�t�s tekstas,
#        sub -- pagalbin�s antra�t�s tekstas,
#       xlab -- a�ies Ox antra��s pavadinimas,
#       ylab -- a�ies Oy antra��s pavadinimas.

# Pavyzd�iui, naudojant funkcij� curve nubrai�ysime funkcijos y = sin(x) grafik�. 
# Matome, kad grafike yra abiej� a�i� antra�t�s, ta�iau n�ra pagrindin�s grafiko 
# antra�t�s. 

curve(sin, -pi, pi)

# Diagramos antra�t� ant jau sudaryto grafiko u�dedame naudojant funkcij� title.

title(main = "Funkcijos y = sin(x) grafikas")


# Lygiai taip pat ant jau sudaryto grafiko u�dedamos a�i� antra�t�s. Pavyzd�iui,
# brai�ant funkcijos grafik�, u�drausime a�ies Oy antra�t�, o v�liau j� u�d�sime 
# naudojant funkcij� title ir jos parametr� ylab.

curve(sin, -pi, pi, ylab = "")
title(main = "Funkcijos y = sin(x) grafikas")
title(ylab = "y = sin(x)")


# Jei d�l koki� nors prie�as�i� visas grafiko antra�tes reikia u�drausti, tokiam
# tikslui naudojamas loginis parametras ann. Ant tokio grafiko antra�t� u�dedame
# naudojant funkcij� title.

curve(sin, -pi, pi, ann = FALSE)
title(main = "Funkcijos y = sin(x) grafikas", xlab = "x", ylab = "f(x)")


# Funkcija title da�niausiai naudojama tokiais atvejais, kai antra�t�s yra labai
# ilgos, turi speciali� matematini� simboli� ar priklauso nuo ka�koki� papildom� 
# duomen�. Kartais antra�t� tenka sudaryti i� keli� atskir� dali�. I�nagrin�sime 
# kelet� tipini� situacij�.


# Antra�t�s tekste gali b�ti �vairi� matematini� simboli�. Tai graiki�kos raid�s, 
# indeksai, laipsniai, �aknies, sumos, integralo ir kiti special�s simboliai. J�
# u�ra�ymo sintaks� �iek tiek primena LaTeX taisykles:
 
?plotmath

# Tokio u�ra�ymo b�do galimybi� demonstracija:

demo(plotmath)

# Norint � antra�t�s tekst� �ra�yti matematinius simbolius, reikia kad funkcijos
# title parametrui b�t� priskirta R i�rai�ka. Tam naudojama funkcija expression.
# Pavyzd�iui, nubrai�ysime funkcijos y = sin(x) grafik�, bet antra�t�se vietoje 
# argumento x �ra�ysime alpha.

curve(sin, -pi, pi, xlab = "", ylab = "")
title(xlab = expression(alpha), ylab = expression(sin ~ alpha))

# Ant to paties grafiko u�d�sime bendr� antra�t�. �iuo atveju antra�t� susideda 
# i� teksto ir viduryje esan�ios formul�s. Tokiu b�du gauname tris dalis: �odis,
# formul� ir v�l �odis. �ias tris dalis � i�rai�k� sujungsime naudojant funkcij� 
# paste. �ia simbolis ~ nurodo tarp� tarp �od�i�, o == rei�kia formul�je esan�i�
# lygyb�.

curve(sin, -pi, pi, xlab = expression(alpha), ylab = expression(sin ~ alpha))
title(main = expression(paste("Funkcijos ", y == sin ~ alpha, " grafikas")))

# Nubrai�ysime dar vien� grafik�, kurio antra�t�se bus keli special�s simboliai. 
# Tai bus nat�rali�j� skai�i� sumos diagrama. Jos antra�t�se panaudosime apatin� 
# indeks� ir sumos �enkl�.

plot(cumsum(1:100), type = "h", ann = F)
title(xlab = "n", ylab = expression(S[n]))
title(main = expression(paste("Sumos ", S[n] == sum(k, k==1, n), " grafikas")))


# Kita da�nai pasitaikanti situacija, kada grafiko antra�t�je reikia �ra�yti tam
# tikro kintamojo reik�m�. Pavyzd�iui, tai gali b�ti kreiv�s parametr� reik�m�s,
# grafiko eil�s numeris ir pan. Tokiu atveju naudojama funkcija substitute, kuri 
# i�rai�koje esan�iam kintamajam priskiria tam tikr� reik�m�. Pagrindiniai f-jos
# parametrai tokie:
#
#       expr -- R i�rai�ka,
#        env -- i�rai�koje esan�i� kintam�j� reik�mi� s�ra�as.

# Pavyzd�iui, nubrai�ysime funkcijos y = sin(kx) grafik� ir u�d�sime antra�t� su
# konkre�ia parametro k reik�me.

k <- 5
curve(sin(k*x), -pi, pi, xlab = "x", ylab = "y")
title(substitute(paste("Funkcijos ", y == sin(m*x), " grafikas"), list(m = k)))

# Naudojant funkcij� substitute, galima perduoti keli� parametr� reik�mes. Pvz.,
# nubrai�ysime ties�s y = b_0 + b_1*x grafik�, o ties�s lygt� su toki� parametr� 
# reik�m�mis u�ra�ysime antra�t�je. �iuo atveju reik�s perduoti parametr� b_0 ir 
# b_1 reik�mes.

b.0 <- 5.12
b.1 <- 0.53

curve(b.0 + b.1*x, 0, 10, ann = F, asp = 1)

title(xlab = "x", ylab = expression(y == beta[0] + beta[1]*x))
title(substitute(paste("Ties� ", y == a + b*x), list(a = b.0, b = b.1)))


# Nubrai�ysime chi-kvadrat skirstinio tankio funkcijos grafik� ir u�ra�ysime jam
# antra�t�, kurioje �ra�omas skirstinio parametro -- laisv�s laipsni� skai�ius k.

k <- 5
curve(dchisq(x, df = k), 0, 20, xlab = "x", ylab = "p(x)")

# Kadangi antra�t�s tekstas gana ilgas, j� galima i�skaidyti � atskiras dalis ir,
# naudojant funkcij� paste, � vientis� sakin� sud�ti funkcijos substitute viduje. 
# Tokiu atveju teksto dalys taip pat yra kintamieji, tod�l jiems reik�mes reikia 
# priskirti.

t.1 <- " skirstinio su "
t.2 <- " laisv�s l. tankio funkcijos grafikas"
title(main = substitute(paste(chi^2, a, b, c), list(a = t.1, b = k, c = t.2)))


# NAUDINGA ------------------------------

# Grafiko brai�ymo funkcijas galima �d�ti � cikl�. Jei toki� funkcij� parametrai
# priklauso nuo ciklo kintamojo, gauname laikei besikei�iant� grafik�, animacij�.
# Tam, kad b�t� galima sekti funkcij� parametr� reik�mes arba tam tikras duomen� 
# statistikas, jas galima nurodyti grafiko antra�t�je.

# Pavyzd�iui, nubrai�ysime funkcijos y = sin(x) grafik�, kuriame vienas po kito
# u�dedami sinusoid� sudarantys ta�kai. Antra�t�je nurodysime k-ojo ta�ko numer�.

n <- 1000
x <- seq(-2*pi, 2*pi, length.out = n)
y <- sin(x)

for (i in 1:n) {
  plot(x, y, type = "p", pch = ".", col = x <= x[i])
  title(main = substitute(k == nr, list(nr = i)))
}


# �ia matome, kad kiekvienos iteracijos metu brai�omas tas pats grafikas, ta�iau
# dalis ta�k� yra baltos spalvos, ir tod�l j� nesimato. Taip gaunamas animacijos
# efektas. Nubrai�ysime dar vien� animuot� grafik�. �ia pavaizduosime normaliojo 
# d�snio su besikei�ian�iu vidurkiu, ta�iau pastovia dispersija tankio funkcijos 
# grafik�. Antra�t�je u�ra�ysime skirstinio parametro, t. y. vidurkio reik�m�.

m <- seq(20, 80, by = 0.05)

for (i in m) {
  curve(dnorm(x, mean = i, sd = 5), 0, 100, ylim = c(0, 0.1), ylab = "p(x)")
  abline(v = i, col = "red")
  title(main = substitute(paste("Vidurkis ", mu == v), list(v = i)), adj = 0)
}


# U�DUOTIS ------------------------------ 

# 1. Nubrai�ykite f-jos y = x^3 - 10*x^2 - 10*x + 10 grafik� intervale [-10, 20]. 
#    Grafiko antra�t�je u�ra�ykite matematin� �ios funkcijos formul�, o a�ies Oy
#    u�ra�� pakeiskite � y.
# 2. Nubrai�ykite trupmen� 1/2^k sumos, kai k - sveikieji skai�iai nuo 0 iki 10,
#    grafik�. Grafiko antra�t�je u�ra�ykite sumos matematin� i�rai�k�.
# 3. Sudarykite program�, kuri pasirinktame ta�ke (x, y) nubrai�yt� R spindulio 
#    apskritim�. Grafiko antra�t�je turi b�ti nurodytos centro koordinat�s ir R
#    reik�m�.
# 4. Sudarykite program�, kuri nubrai�yt� normaliojo pasiskirstymo su pasirinktu
#    vidurkiu ir dispersija tankio funkcijos grafik�. Abiej� parametr� reik�m�s 
#    turi b�ti automati�kai u�ra�omos grafiko antra�t�je.
# 5. Sudarykite animuot� grafik�, kuriame pavaizduokite, kaip nuosekliai ta�kas 
#    po ta�ko nubrai�omas apskritimas. Grafiko antra�t�je nurodykite ta�ko eil�s
#    numer�. Apskritim� sudaran�i� ta�k� skai�i� n galima pasirinkti laisvai.
# 6. Sudarykite animuot� grafik�, kuriame pavaizduota, kaip kei�iasi chi-kvadrat
#    skirstinio tankio funkcija, kai laisv�s laipsni� skai�ius k kinta nuo 1 iki
#    100. Grafiko antra�t�je turi b�ti rodoma besikei�ianti k reik�m�.


# --------------------------------------- #
# PAPILDOMO TEKSTO ANT GRAFIKO U�D�JIMAS  #
# --------------------------------------- #

# Teksto ant grafiko u�d�jimui ta�kuose (x, y) naudojama cpeciali funkcija text. 
# Pagrindiniai jos parametrai tokie:
#
#          x -- ta�ko, kuriame u�dedamas tekstas, abscis�,
#          y -- ta�ko, kuriame u�dedamas tekstas, ordinat�,
#     labels -- ta�kuose (x, y) u�dedamas tekst� vektorius,
#        pos -- ta�ko pus�, kurioje atidedamas tekstas, 1, 2 3 arba 4,
#     offset -- u�dedamo teksto post�mis nuo ta�ko (x, y),
#        cex -- u�dedamo teksto dydis,
#        col -- u�dedamo teksto spalva,
#       font -- �rifto tipas,
#        srt -- kampas, kuriuo pasukamas tekstas.

# I� prad�i� nubrai�ysime paprast� keletos ta�k� sklaidos diagram�. Kintamasis x 
# yra planetos pusiaujo skersmuo kilometrais, o y --- vidutinis tankis gramais � 
# kubin� centimetr�.

x <- c(5.427, 5.24, 5.5153, 3.934)
y <- c(4879.4, 12103.7, 12756.274, 6804.9)
t <- c("Merkurijus", "Venera", "�em�", "Marsas")

plot(x, y, xlim = c(3, 6), ylim = c(4000, 14000), pch = 19, ann = FALSE)

title(xlab = expression(paste("Tankis, ", g/cm^3)))
title(ylab = "Pusiaujo skersmuo, km")


# Tarkime, kad tuos ta�kus plok�tumoje reikia tam tikru b�du identifikuoti. Pats
# papras�iausias b�das juos atskirti -- pagal eil�s numer�, kur� u�ra�ysime prie
# kiekvieno ta�ko. Pasinaudosime funkcija text. Jei funkcijai text nurodome vien
# tik ta�k� (x, y) koordinates, pagal nutyl�jim� ant ta�k� u�ra�omas j� numeris.

plot(x, y, xlim = c(3, 6), ylim = c(4000, 14000), pch = 19, ann = FALSE)
text(x, y)

# Tam, kad tekstas b�t� u�dedamas �alia ta�ko (x, y), naudojamas parametras pos. 
# Jei jam priskiriama reik�m� 1, tekstas u�dedamas �emiau ta�ko, jei 2 - kair�je 
# pus�je ir t.t.

plot(x, y, xlim = c(3, 6), ylim = c(4000, 14000), pch = 19, ann = FALSE)
text(x, y, pos = 2)

# Da�niausiai ta�k� numeriai patys savaime nieko nerei�kia, tod�l vien tik pagal 
# stebinio numer� negalima pasakyti kuo vienas ta�kas skiriasi nuo kito. Tokiais
# atvejais ta�kams galima priskirti kok� nors kit� po�ym�. �iuo atveju naudosime
# nauj� kintam�j� -- planetos pavadinim� vektori� t.

plot(x, y, xlim = c(3, 6), ylim = c(4000, 14000), pch = 19, ann = FALSE)
text(x, y, pos = 2, labels = t)

# Toje pa�ioje pozicijoje galima u�d�ti kelis skirtingus tekstus. Tam, kad nauj�
# u�dedam� tekst� b�t� galima pastumti � �on�, naudojamas parametras offset.

text(x, y, pos = 2, offset = -1)

# �inoma, neb�tina prisiri�ti prie duomen� ta�k�. Tekst� galima u�d�ti ir kitoje
# grafiko vietoje. Pvz., ant sklaidos grafiko ta�ke (4, 10000) u�ra�ysime tekst�.

plot(x, y, xlim = c(3, 6), ylim = c(4000, 14000), pch = 19, ann = FALSE)
text(4, 10000, labels = "Planet� i�sid�stymas pagal skersmen� ir tank�")


# Parametrais galima reguliuoti u�dedamo teksto dyd�, spalv�, �rifto tip� ir pan.
# Pvz., ta�k� numerius padidinsime, naudosime pastorint� �rift� ir kiekvienam i�
# j� suteiksime vis kit� spalv�.

plot(x, y, xlim = c(3, 6), ylim = c(4000, 14000), pch = 19, ann = FALSE)
text(x, y, pos = 1, cex = 3, font = 2, col = 1:4)

# Jei tekst� reikia pasukti tam tikru kampu, naudojamas grafinis parametras srt.

plot(x, y, xlim = c(3, 6), ylim = c(4000, 14000), pch = 19, ann = FALSE)
text(x, y, pos = 1, srt = 45)


# Grafikas paprastai turi pagrindin� antra�� ir a�i� antra�tes. Teksto u�ra�ymui 
# grafiko para�t�se naudojama funkcija mtext. Jos parametrai:
#
#       text -- tekstas arba i�rai�ka,
#       side -- ta�ko pus�, kurioje atidedamas tekstas, 1, 2 3 arba 4,
#       line -- para�t�s eilut�s, kurioje u�ra�omas tekstas numeris, 
#         at -- koordinat�, ties kuria para�t�je atidedamas tekstas,
#        adj -- skai�ius i� [0, 1], nurodo, pagal kuri� pus� lygiuoti tekst�,
#        cex -- u�dedamo teksto dydis,
#        col -- u�dedamo teksto spalva,
#       font -- �rifto tipas.

# Dar kart� nubrai�ysim planet� i�sid�stymo grafik�, kuriame ta�kas proporcingas
# planetos dyd�iui. Suformuosime grafiko a�is bei para�t�se u�ra�ysime papildom�
# informacij�.

plot(x, y, xlim = c(3, 6), ylim = c(4000, 14000), ann = F, fra = F, cex = y/2000)

title(main = "�em�s tipo planet� i�sid�stymas pagal tank� ir diametr�")
title(xlab = expression(paste("Tankis, ", g/cm^3)))
title(ylab = "Pusiaujo skersmuo, km")

text(x, y, labels = t, pos = 2, offset = 2)
text(x, y, labels = x, pos = 1, offset = 1.5, cex = 0.7)

# Grafiko para�t�se u�ra�ysime papildom� informacij�: de�in�je nurodytas duomen�
# �altinis, apa�ioje de�in�je u�ra�oma grafiko sudarymo data.

informacija <- "Duomenys apie planetas paimti i� wikipedijos"

mtext(text = informacija, side = 4, at = 4000, adj = 0.0, cex = 0.8, col = 8)
mtext(Sys.Date(), side = 1, line = 3, adj = 1, font = 11, cex = 0.8, col = 8)


# NAUDINGA ------------------------------

# Papildomi u�ra�ai prie ta�k� --- gana savoti�kas b�das plok�tumoje atvaizduoti 
# daugiama�ius duomenis. Pavyzd�iui, paimsime keturi� �ali� 2011-2013 m. nedarbo 
# ir infliacijos lygio duomenis. �ia tokie kintamieji: �alis, metai, nedarbas ir 
# infliacijos lygis.

t <- textConnection("
�alis    Metai  N     I
Lietuva  2011   15.3  4.1
Latvija  2011   16.2  4.4
Estija   2011   12.5  5.0
�vedija  2011   7.8   3.0
Lietuva  2012   13.2  3.1
Latvija  2012   15.0  2.3
Estija   2012   10.2  3.9
�vedija  2012   8.0   0.9
Lietuva  2013   11.5  1.5
Latvija  2013   11.6  0.4
Estija   2013   8.9   3.3
�vedija  2013   8.1   0.2")

d <- read.table(file = t, header = TRUE)
d

# Prad�ioje nubrai�ysime paprast� infliacijos ir nedarbo lygio sklaidos diagram�.

plot(d$N, d$I, xlim = c(6, 17), ylim = c(0, 6), ann = FALSE)
title(xlab = "Nedarbo lygis, %", ylab = "Infliacija, %")

# Kadangi ta�kai diagramoje niekaip neatskiriami, be papildom� paai�kinim� tokia
# diagrama nieko neparodo. Tod�l prie kiekvieno ta�ko prira�ysime, kuriai �aliai
# ir kuriems metams jis priklauso.

text(d$N, d$I, labels = d$�alis, pos = 3)
text(d$N, d$I, labels = d$Metai, pos = 1, cex = 0.5, col = d$Metai - 2010)

points(d$N, d$I, col = d$Metai - 2010, pch = 19)


# T� pat� grafik� galima perbrai�yti dar kitaip. Sujungsime linijomis tos pa�ios
# �alies skirting� met� ta�kus. Taip gausime j� jud�jimo laike trajektorij�. �ia
# sklaidos grafik� nubrai�ysime naudojant kintam�j� priklausomyb�s formul�. Toks
# u�ra�ymo b�das yra patogesnis, kai i� duomen� lentel�s reikia i�skirti atskir� 
# �ali� stebinius, tada galima pasinaudoti parametru subset.

plot(I ~ N, data = d, xlim = c(6, 17), ann = FALSE)
title(xlab = "Nedarbo lygis, %", ylab = "Infliacija, %")

text(I ~ N, data = d, labels = d$Metai, pos = 2, cex = .8, col = d$Metai - 2010)
points(I ~ N, data = d, col = d$Metai - 2010, pch = 19)

lines(I ~ N, data = d, subset = �alis == "Lietuva", type = "b", lty = 3)
lines(I ~ N, data = d, subset = �alis == "Latvija", type = "b", lty = 3)
lines(I ~ N, data = d, subset = �alis == "Estija",  type = "b", lty = 3)
lines(I ~ N, data = d, subset = �alis == "�vedija", type = "b", lty = 3)

text(I ~ N, data = d, subset = Metai == 2012, 
	labels = d$�alis, pos = 4, offset = 1, font = 2)


# U�DUOTIS ------------------------------ 

# 1. Nubrai�ykite parabol�s x^2 + 2x - 15 grafik�. Grafike �alia ta�k�, kuriuose
#    parabol� kerta Ox a��, u�d�kite tekst� su �akn� x_1 ir x_2 reik�m�mis. �ia
#    indeksams 1 ir 2 u�ra�yti naudokite expression.
# 2. Nubrai�ykite laiko eilut�s Nile grafik�. Ties did�iausia ir ma�iausia laiko
#    eilut�s reik�me u�d�kite tekstus su atitinkamo stebinio numeriu ir eilut�s 
#    reik�me.
# 3. Nubrai�ykite duomen� lentel�s airquality kintamojo Temp reik�mi� histogram�.
#    F-jos hist parametrui labels priskyrus reik�m� TRUE, da�ni� reik�mes galima 
#    u�ra�yti ant stulpeli� vir�aus. Sugalvokite, kaip, naudojant funkcij� text, 
#    tuos pa�ius da�nius b�t� galima u�ra�yti stulpelio viduryje.
# 4. Naudojant planet� skersmens ir tankio duomenis, sudarykite grafik�, kuriame
#    vietoje planetas atitinkan�i� ta�k� b�t� pavaizduotas planetos pavadinimas.
# 5. Naudojant infliacijos ir nedarbo lygio duomen� lentel� d, nubrai�ykite 2013 
#    met� infliacijos ir nedarbo lygio sklaidos diagram�. Greta ta�k� u�ra�ykite
#    �alies pavadinim�. Apatin�je grafiko para�t�je u�ra�ykite infliacijos lygio
#    vidurk�, kuris turi b�ti apskai�iuojamas automati�kai.
