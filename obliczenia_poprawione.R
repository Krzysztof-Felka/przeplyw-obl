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

#obliczenie liczby obrotów na sekundę ----
for (i in 1:piony_pomiar) {
  predkosci$n_pow = predkosci$l_obr_pow / predkosci$czas_pomiaru
  
}


