# utworzenie df zawierających dane z pomiarów w terenie ----
glebokosci = read.csv("sondowanie_glebokosci.csv", dec = ",", 
                      col.names = c("odl_od_brzegu", "nr_pionu", "glebokosc"), na.strings = "")
predkosci = read.csv("pomiar_predkosci.csv", dec = ",", na.strings = "",
                     col.names = c("nr_pionu", "odl_od_brzegu", "gl_w_pionie", "czas_pomiaru", 
                                   "l_obr_pow", "l_obr_0.8h", "l_obr_0.6h", "l_obr_0.4h", "l_obr_0.2h", 
                                  "l_obr_dno", "n_pow", "n_0.8h", "n_0.6h", "n_0.4h", "n_0.2h", "n_dno",
                                  "v_pow", "v_0.8h", "v_0.6h", "v_0.4h", "v_0.2h", "v_dno", "v_sr_pion"))
#wyznaczanie ilości pionów sondażowych i pomiarowych, also miarki liczby wierszy w tabelach
piony_sond = nrow(glebokosci)
piony_pomiar = nrow(predkosci)

#obliczenie średniej prędkości przepływu wody w pionach pomiarowych ----

#obliczenie liczby obrotów na sekundę n ----
#czas pomiaru col 4
#l_obr_pow col 5
#n_obr_pow col 11
#v_pow col 17
for (i in 0:5) {
  predkosci[,11+i] = predkosci[,5+i] / predkosci[,4]
}

#obliczenie prędkości przepływu w pionie pomiarowym ----
# deklaracja współczynników, USUNĄĆ JAK BĘDZIE ODCZYT OD UŻYTKOWNIKA
alfa1 = 0.014
alfa2 = 0.004
beta1 = 0.247
beta2 = 0.261
granica_min1 = 0 
granica_min2 = 7
granica_max1 = 71 
granica_max2 = 100

#sprawdzanie, czy liczba zmierzonych obrotów nie wychodzi poza zakres maksymalny młynka i ewentualne
#poinformowanie użytkownika, że obliczenia nie będą dokładne, bo pomiar wychodzi poza zakres przyrządu
licznik = 0
for (j in 0:5) {
  
  for (i in 1:piony_pomiar) {
    
    if (!is.na(predkosci[i,5+j]) && predkosci[i,5+j]>= max(c(granica_max1, granica_max2))) {
      licznik = licznik + 1
    }
  
  }
}
if (licznik !=0 ) {
  
  cat("Twoje dane zawierają wartości z poza zakresu pomiarowego młynka.\nLiczba pomiarów z poza zakresu:\n",licznik, 
      "\nWykonane obliczenia przepływu nie będą dokładne")
}

#sprawdzenie, jakie granice są większe, jakie wsp alfa i beta muszą być użyte do wartości 
#i obliczanie prędkości przepływu w punkcie


