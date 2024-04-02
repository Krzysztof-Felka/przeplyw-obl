df_predkosci = data.frame(nr_pionu = c("I","II","III","IV","v"), odl_od_brzegu_lew = c(3, 6, 8, 10, 13),
                          gl_w_pionie = c(0.55, 1.50, 1.50, 1.60, 1.55), czas_pomiaru = c (rep(50, 5)),
                          l_pow = c(0, 78, 82, 102, 52), l_08h = c(58, 74, 78, 104, 48),l_06h = c(0, 0, 0, 0, 0),
                          l_04h = c(52, 84, 84, 78, 26), l_02h = c(34, 68, 76, 72, 25), 
                          l_dno = c(0, 60, 44, 46, 24), n_pow = c(rep(0,5)), n_08h = c(rep(0,5)), 
                          n_06h = c(rep(0,5)), n_04h = c(rep(0,5)), n_02h = c(rep(0,5)), n_dno = c(rep(0,5)),
                          v_pow = c(rep(0,5)), v_08h = c(rep(0,5)), v_06h = c(rep(0,5)), v_04h = c(rep(0,5)),
                          v_02h = c(rep(0,5)), v_dno = c(rep(0,5)), v_sr_pion = c(rep(0,5)))

df_predkosci$n_pow = df_predkosci$l_pow / df_predkosci$czas_pomiaru
df_predkosci[,12] = df_predkosci[,6]/df_predkosci[,4]
#str(df_predkosci) - żeby sprawdzić jakie w kolejności są kolumny, bo w widoku zmiennej to tak słabo czytelne
#l_pow jest 5
#n_pow jest 11
#v_pow jest 17
#v_sr_pion jest 23
#czas_pomiaru jest 4

#oblicza liczbę obrotów na sekundę w poszczególnych punktach
for (i in c(0:5)) {
  df_predkosci[,11+i] = df_predkosci[,5+i]/df_predkosci[,4]
}
#ATTENTION! NA RAZIE NIE UWZGLĘDNIA ZMIANY WSP TAROWANIA!!!
#dla 0 < n < 71 alfa = 0.014 beta = 0.247
#dla 7 < n < 100 alfa = 0.004 beta = 0.261
#ze względu na to, że nasz wzorzec z grubsza mieści się w jednym swoim zakresie, użyjemy jego.
#
#ATTENTION! ZAKRESY UŻYWANIA WSP TAROWANIA NAKŁADAJĄ SIĘ NA SIEBIE, TO TRZEBA ROZWIĄZAĆ!
#ogólnie te współczynniki nie powinny być użyte, ale nasz przykład wziął je, mimo że wartości n wychodziły
#poza zakres jednego, ale mieściły się w drugim

alfa = 0.014 
beta = 0.247

# oblicza prędkość w poszczególnych punktach
for (i in c(0:5)) {
  for (j in c(1:5)) {
    if (df_predkosci[j,5+i] != 0 )
    df_predkosci[j,17+i] = alfa + df_predkosci[j,11+i] * beta
  }
}

#oblicza średnią prędkość w pionie
#v_04 jest col 20

for (i in 1:5) {
  if (df_predkosci[i, 3] < 0.2) {
    df_predkosci[i,23] = df_predkosci[i, 20]
  }
  else if (df_predkosci[i, 3] >= 0.2 && df_predkosci[i, 3] <= 0.6){
    df_predkosci[i,23] = 0.25 * ( df_predkosci[i, 21] + 2 * df_predkosci[i,20] + df_predkosci[i,18])
  }
  else {
    df_predkosci[i,23] = 0.1 * ( df_predkosci[i,22] + 2 * df_predkosci[i, 21] + 3 * df_predkosci[i,20] + 3 * df_predkosci[i,18] + df_predkosci[i, 17])
  }
}
