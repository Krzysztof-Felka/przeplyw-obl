# funkcja rozpocznij będzie 

rozpocznij = function(){
  # tutaj wprowadzanie danych z młynka
  cat("Podaj dane młynka, współczynniki alfa i beta oraz granice zastosowań tych wartości.\n")
  
  alfa1 = as.numeric(readline("Podaj pierwszy współczynnik alfa: "))
  # sekcja sprawdza czy podana wartość jest numeryczna
  
  if (is.na(alfa1)){
    stop("Niepoprawna wartość, podaj wartość numeryczną.")
  }
  
  beta1 = as.numeric(readline("Podaj pierwszy współczynnik beta: "))
  
  if (is.na(beta1)){
    stop("Niepoprawna wartość, podaj wartość numeryczną.")
  }
  
  alfa2 = as.numeric(readline("Podaj drugi współczynnik alfa: "))
  
  if (is.na(alfa2)){
    stop("Niepoprawna wartość, podaj wartość numeryczną.")
  }
  beta2 = as.numeric(readline("Podaj drugi współczynnik beta: "))
  
  if (is.na(beta2)){
    stop("Niepoprawna wartość, podaj wartość numeryczną.")
  }
  
  # sekcja w której podaje się granice i sprawdza czy wartość jest numeryczna
  granica_min1 = as.numeric(readline("Podaj pierwszą granicę minimalną: "))
  if (is.na(granica_min1)){
    stop("Niepoprawna wartość, podaj wartość numeryczną.")
  }
  granica_max1 = as.numeric(readline("Podaj pierwszą granicę maksymalną: "))
  
  if (is.na(granica_max1)){
    stop("Niepoprawna wartość, podaj wartość numeryczną.")
  }
  granica_min2 = as.numeric(readline("Podaj drugą granicę minimalną: "))
  
  if (is.na(granica_min2)){
    stop("Niepoprawna wartość, podaj wartość numeryczną.")
  }
  granica_max2 = as.numeric(readline("Podaj drugą granicę maksymalną: "))
  
  if (is.na(granica_max2)){
    stop("Niepoprawna wartość, podaj wartość numeryczną.")
  }
 
  # wybór warunków brzegowych 
  cat("Warianty warunków brzegowych.\n")
  cat("1. woda przy brzegu nie płynie ze względu na silne zarastanie lub istnieje przekrój nieczynny (fi = 0.5)\n")
  cat("2. brzeg płaski i wyrównany (fi = 0.7)\n")
  cat("3. brzeg ma naturalny spadek, jest zbudowany z gliny, pisku lub żwiru (fi = 0.8)\n")
  cat("4. brzeg jest wyłożony deskami, betonem, ma duże nachylenie i jest wyrównany (fi = 0.9)\n")
  warunki_brzeg = as.numeric(readline("Wybierz (1, 2, 3 lub 4): "))
  if (warunki_brzeg == 1){
    fi = 0.5
  } else if (warunki_brzeg == 2){
    fi = 0.7
  } else if (warunki_brzeg == 3){
    fi = 0.8
  } else if (warunki_brzeg == 4){
    fi = 0.9
  } else {
    stop("Niepoprawna wartość, podaj 1, 2, 3, lub 4.")
  }
  #odpytanie o nazwy plików z danymi
  cat("Podaj nazwę pliku, utworzonego na podstawie 01sondowanie_glebokosci.csv w formacie 'nazwa_pliku.csv'")
  sondowanie_gl = readline("\nPamiętaj, że on powinien być zapisany w folderze 'Arkusze uzupełnione'")
  glebokosci = read.csv(paste0(c("Arkusze uzupelnione/", sondowanie_gl), collapse = ""), dec = ",", na.strings = "",
                        col.names = c("odl_od_brzegu", "nr_pionu", "glebokosc", "odl_miedzy_pionami",
                                      "gl_srednia", "powierzchnia", "suma_pow", "v_sr_pion",
                                      "v_sr_pole", "przepl_czastkowy") )
  
  cat("Podaj nazwę pliku, utworzonego na podstawie 01pomiar_predkosci.csv w formacie 'nazwa_pliku.csv'")
  pomiar_predk = readline("\nPamiętaj, że on powinien być zapisany w folderze 'Arkusze uzupełnione'")
  predkosci = read.csv( paste0(c("Arkusze uzupelnione/", pomiar_predk), collapse = ""), dec = ",", na.strings = "",
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
  #sprawdzanie, czy liczba zmierzonych obrotów nie wychodzi poza zakres maksymalny młynka i ewentualne
  #poinformowanie użytkownika, że obliczenia nie będą dokładne, bo pomiar wychodzi poza zakres przyrządu ----
  licznik = 0
  for (j in 0:5) {
    
    for (i in 1:piony_pomiar) {
      
      if (!is.na(predkosci[i,5+j]) && predkosci[i,5+j]>= max(c(granica_max1, granica_max2))) {
        licznik = licznik + 1
      }
      
    }
  }
  if (licznik !=0 ) {
    cat("\n")
    cat("Twoje dane zawierają wartości z poza zakresu pomiarowego młynka.\nLiczba pomiarów z poza zakresu: ",licznik, 
        "\nWykonane obliczenia przepływu nie będą dokładne")
  }
  
  #sprawdzenie, jakie wsp alfa i beta muszą być użyte do wartości 
  #i obliczanie prędkości przepływu w punkcie ----
  
  #zakładamy, że min i max 2 są większymi granicami
  for (j in 0:5) {
    
    for (i in 1:piony_pomiar) {
      
      if(!is.na(predkosci[i,5+j]) && predkosci[i,5+j] < granica_max1){
        predkosci[i,17+j] = alfa1 + predkosci[i,11+j] * beta1
      }
      else 
        predkosci[i,17+j] = alfa2 + predkosci[i,11+j] * beta2
      
    }
  }
  
  #obliczanie średniej prędkości w pionie ----
  
  for (i in 1:piony_pomiar) {
    if (predkosci[i, 3] < 0.2) {
      predkosci[i,23] = round( predkosci[i, 20], 2)
    }
    else if (predkosci[i, 3] >= 0.2 && predkosci[i, 3] <= 0.6){
      predkosci[i,23] = round( 0.25 * ( predkosci[i, 21] + 2 * predkosci[i,20] + predkosci[i,18]), 2)
    }
    else {
      predkosci[i,23] = round( 0.1 * ( predkosci[i,22] + 2 * predkosci[i, 21] + 3 * predkosci[i,20] + 
                                         3 * predkosci[i,18] + predkosci[i, 17]), 2)
    }
  }
  
  
  
  
  
  
  
  #obliczanie wartości z sondowania przekroju
  
  #oblicza odległość między pionami sondażowymi
  for (i in c(2:piony_sond)){
    glebokosci$odl_miedzy_pionami[[i]] = glebokosci$odl_od_brzegu[[i]] - glebokosci$odl_od_brzegu[[i-1]]
  }
  
  #oblicza średnią głębokość między pionami sondażowymi
  for (i in c(2:piony_sond)){
    (glebokosci$gl_srednia[[i]] = (glebokosci$glebokosc[[i]] + glebokosci$glebokosc[[i-1]])/2)
  }
  
  #oblicza odległość między pionami sondażowymi
  for (i in c(1:piony_sond)){
    glebokosci$powierzchnia[[i]] = glebokosci$odl_miedzy_pionami[[i]] * glebokosci$gl_srednia[[i]]
  }
  glebokosci$powierzchnia[[1]] = 0
  
  #oblicza powierzchnię pomiędzy pionami pomiarowymi
  piony = is.na(glebokosci$nr_pionu)
  piony[length(piony)] = F
  suma = 0
  
  for (i in c(1:piony_sond)){
    if (piony[i]){
      suma = suma + glebokosci$powierzchnia[[i]]
    }
    else {
      suma = suma + glebokosci$powierzchnia[[i]]
      glebokosci$suma_pow[[i]] = suma
      suma = 0
    }
  }
  
  #przepisuje średnią prędkość w pionie do df_głębokości
  licznik = 1
  for (i in c(1:nrow(glebokosci))){
    if (!is.na(glebokosci$nr_pionu[[i]])){
      glebokosci$v_sr_pion[[i]] = predkosci$v_sr_pion[[licznik]]
      licznik = licznik + 1
    }
  }
  #obliczanie średniej prędkości w przekroju
  
  fita = 0.7
  licznik = 1
  
  for (i in c(1:piony_sond)) {
    if (!is.na(glebokosci$suma_pow[[i]])){
      
      if (licznik == 1){
        glebokosci$v_sr_pole[[i]] = glebokosci$v_sr_pion[[i]] * fita
        v_prev = glebokosci$v_sr_pion[[i]]
        licznik = licznik + 1
      }
      else if (licznik != piony_pomiar + 1 ){
        glebokosci$v_sr_pole[[i]] = (v_prev + glebokosci$v_sr_pion[[i]]) / 2
        v_prev = glebokosci$v_sr_pion[[i]]
        licznik = licznik + 1
      }
      else if (licznik == piony_pomiar + 1){
        glebokosci$v_sr_pole[[piony_sond]] = v_prev * fita
      }
      
    }
    
  }
  
  #obliczanie przepływu w przekroju
  
  glebokosci$przepl_czastkowy = glebokosci$v_sr_pole * glebokosci$suma_pow
  
  cat("\n")
  #końcowe obliczanie wartości do wyświetlania
  #Przeplyw Q
  q = round(sum(glebokosci$przepl_czastkowy, na.rm = T), 2)
  cat("\nPrzepływ Q ", q, " m3/s")
  #powierzchnia przekroju F
  f = sum(glebokosci$suma_pow, na.rm = T)
  cat("\nPowierzchnia przekroju F ", f, " m2")
  #szerokość b
  b = glebokosci$odl_od_brzegu[[piony_sond]] - glebokosci$odl_od_brzegu[[1]]
  cat("\nSzerokość b ", b, " m")
  #głębokość średnia h_śr
  h_sr = round(f/b, 2)
  cat("\nŚrednia głębokość h_śr ", h_sr, " m")
  #głębokość maksymalna h_max
  h_max = max(glebokosci$glebokosc, na.rm = T)
  cat("\nMaksymalna głębokość h_max ", h_max, " m")
  #prędkość średnia v_sr
  v_sr = round(q/f, 2)
  cat("\nŚrednia prędkość v_śr ", v_sr, " m/s")
  #prędkość maksymalna v_max
  v_max = round(max(predkosci[,17:22], na.rm = T), 2)
  cat("\nMaksymalna prędkość v_max ", v_max, " m/s\n")
}

rozpocznij()
0.014
0.247
0.004
0.261
0
71
7
100
2
sondowanie_glebokosci.csv
pomiar_predkosci.csv
