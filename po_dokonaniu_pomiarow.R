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
  # wybór rodzaju stanu przepływu
  cat("Podaj stan przepływu.\n")
  cat("1. Przepływ swobodny.\n")
  cat("2. Koryto zarastające/z pokrywą lodową.\n")
  przeplyw = as.numeric(readline("Wybierz (1 lub 2) : "))
  if (przeplyw == 1){
    
  } else if (przeplyw ==2 ) {
    
    
  } else {
    stop("Niepoprawna wartość, podaj 1 lub 2.")
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
  
}

rozpocznij()
0.23
0.014
1.21
1
