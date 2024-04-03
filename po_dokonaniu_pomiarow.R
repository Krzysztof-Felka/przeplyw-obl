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
1
sondowanie_glebokosci.csv
pomiar_predkosci.csv
