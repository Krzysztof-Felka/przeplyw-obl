df_predkosci = data.frame(nr = c("I", "II", "III", "IV", "V"),
                        odl_od_brzegu = c(3, 6, 8, 10, 13),
                        gleb_calk = c(0.55, 1.50, 1.50, 1.60, 1.55))


df_glebokosci = data.frame(odl_od_brzegu_lew = c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15),
                           nr_pionu = c(0, 0, "I", 0, 0, "II", 0, "III", 0, "IV", 0, 0, "V", 0, 0),
                            glebokosc = c(0.0, 0.32, 0.55, 1.20, 1.45, 1.50, 1.45, 1.50, 1.45, 1.60, 1.53, 1.77, 1.55, 1.20, 0.0))
df_predkosci

df_glebokosci

df_glebokosci$odl_miedzy_pionami = c(rep(0,15))
#oblicza odległość między pionami sondażowymi
for (i in c(2:15)){
  df_glebokosci$odl_miedzy_pionami[[i]] = df_glebokosci$odl_od_brzegu_lew[[i]] - df_glebokosci$odl_od_brzegu_lew[[i-1]]
}

df_glebokosci$gl_srednia = c(rep(0,15))
#oblicza średnią głębokość między pionami sondażowymi
for (i in c(2:15)){
  (df_glebokosci$gl_srednia[[i]] = (df_glebokosci$glebokosc[[i]] + df_glebokosci$glebokosc[[i-1]])/2)
}

#gleb_srednia = round(c(((df_glebokosci$glebokosc[[1]] + df_glebokosci$glebokosc[[2]])/2), 
#                ((df_glebokosci$glebokosc[[2]] + df_glebokosci$glebokosc[[3]])/2),
#                 ((df_glebokosci$glebokosc[[3]] + df_glebokosci$glebokosc[[4]])/2),
#                 ((df_glebokosci$glebokosc[[4]] + df_glebokosci$glebokosc[[5]])/2),
#                 ((df_glebokosci$glebokosc[[5]] + df_glebokosci$glebokosc[[6]])/2),
#                 ((df_glebokosci$glebokosc[[6]] + df_glebokosci$glebokosc[[7]])/2),
#                 ((df_glebokosci$glebokosc[[7]] + df_glebokosci$glebokosc[[8]])/2),
#                 ((df_glebokosci$glebokosc[[8]] + df_glebokosci$glebokosc[[9]])/2),
#                 ((df_glebokosci$glebokosc[[9]] + df_glebokosci$glebokosc[[10]])/2),
#                 ((df_glebokosci$glebokosc[[10]] + df_glebokosci$glebokosc[[11]])/2),
#                 ((df_glebokosci$glebokosc[[11]] + df_glebokosci$glebokosc[[12]])/2),
#                 ((df_glebokosci$glebokosc[[12]] + df_glebokosci$glebokosc[[13]])/2),
#                 ((df_glebokosci$glebokosc[[13]] + df_glebokosci$glebokosc[[14]])/2),
#                 ((df_glebokosci$glebokosc[[14]] + df_glebokosci$glebokosc[[15]])/2)), 2)

#gleb_srednia

#odl_miedzy_punkt = c((df_glebokosci$odl_od_brzegu_lew[[2]] - df_glebokosci$odl_od_brzegu_lew[[1]]),
#                     (df_glebokosci$odl_od_brzegu_lew[[3]] - df_glebokosci$odl_od_brzegu_lew[[2]]),
#                     (df_glebokosci$odl_od_brzegu_lew[[4]] - df_glebokosci$odl_od_brzegu_lew[[3]]),
#                     (df_glebokosci$odl_od_brzegu_lew[[5]] - df_glebokosci$odl_od_brzegu_lew[[4]]),
#                     (df_glebokosci$odl_od_brzegu_lew[[6]] - df_glebokosci$odl_od_brzegu_lew[[5]]),
#                     (df_glebokosci$odl_od_brzegu_lew[[7]] - df_glebokosci$odl_od_brzegu_lew[[6]]),
#                     (df_glebokosci$odl_od_brzegu_lew[[8]] - df_glebokosci$odl_od_brzegu_lew[[7]]),
#                     (df_glebokosci$odl_od_brzegu_lew[[9]] - df_glebokosci$odl_od_brzegu_lew[[8]]),
#                     (df_glebokosci$odl_od_brzegu_lew[[10]] - df_glebokosci$odl_od_brzegu_lew[[9]]),
#                     (df_glebokosci$odl_od_brzegu_lew[[11]] - df_glebokosci$odl_od_brzegu_lew[[10]]),
#                     (df_glebokosci$odl_od_brzegu_lew[[12]] - df_glebokosci$odl_od_brzegu_lew[[11]]),
#                     (df_glebokosci$odl_od_brzegu_lew[[13]] - df_glebokosci$odl_od_brzegu_lew[[12]]),
#                     (df_glebokosci$odl_od_brzegu_lew[[14]] - df_glebokosci$odl_od_brzegu_lew[[13]]),
#                     (df_glebokosci$odl_od_brzegu_lew[[15]] - df_glebokosci$odl_od_brzegu_lew[[14]]))

#odl_miedzy_punkt

df_glebokosci$powierzchnia = c(rep(0,15))
#oblicza odległość między pionami sondażowymi
for (i in c(1:15)){
  df_glebokosci$powierzchnia[[i]] = df_glebokosci$odl_miedzy_pionami[[i]] * df_glebokosci$gl_srednia[[i]]
}
copy = df_glebokosci
for (i in c(1:15)) {
  if (copy$nr_pionu[[i]] == '0'){
    copy$nr_pionu[[i]] = NA
  }
}

<<<<<<< HEAD

=======
#oblicza powierzchnię pomiędzy pionami pomiarowymi
piony = is.na(copy$nr_pionu)
piony[length(piony)] = F
df_glebokosci$suma_pow = c(rep(NA,15))
suma = 0

for (i in c(1:15)){
  if (piony[i] == T){
    suma = suma + df_glebokosci$powierzchnia[[i]]
    print(piony[i])
    print(suma)
  }
  else {
    suma = suma + df_glebokosci$powierzchnia[[i]]
    print(piony[i])
    print(suma)
    df_glebokosci$suma_pow[[i]] = suma
    suma = 0
  }
}

#przepisuje średnią prędkość w pionie do df_głębokości
df_glebokosci$v_sr_pion = c(rep(NA,15))
licznik = 1
for (i in c(1:nrow(df_glebokosci))){
  if (!is.na(df_glebokosci$nr_pionu[[i]])){
    df_glebokosci$v_sr_pion[[i]] = df_predkosci$v_sr_pion[[licznik]]
    licznik = licznik + 1
  }
}

#obliczanie średniej prędkości w przekroju

fita = 0.7
df_glebokosci$v_sr_pole = c(rep(NA,15))
licznik = 1

for (i in c(1:piony_sondowania)) {
  if (!is.na(df_glebokosci$suma_pow[[i]])){
    
    if (licznik == 1){
      df_glebokosci$v_sr_pole[[i]] = df_glebokosci$v_sr_pion[[i]] * fita
      v_prev = df_glebokosci$v_sr_pion[[i]]
      licznik = licznik + 1
    }
    else if (licznik != piony_pomiarowe + 1 ){
      df_glebokosci$v_sr_pole[[i]] = (v_prev + df_glebokosci$v_sr_pion[[i]]) / 2
      v_prev = df_glebokosci$v_sr_pion[[i]]
      licznik = licznik + 1
    }
    else if (licznik == piony_pomiarowe + 1){
      df_glebokosci$v_sr_pole[[piony_sondowania]] = v_prev * fita
    }
    
  }
  
}

#obliczanie przepływu w przekroju

df_glebokosci$przepl_czastkowy = c(rep(NA, piony_pomiarowe))
df_glebokosci$przepl_czastkowy = df_glebokosci$v_sr_pole * df_glebokosci$suma_pow

q = sum(df_glebokosci$przepl_czastkowy, na.rm = T)

