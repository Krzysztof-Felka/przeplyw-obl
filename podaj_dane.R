# funkcja rozpocznij będzie 

rozpocznij = function(){
  
  cat("Podaj dane młynka, współczynniki alfa oraz beta oraz granice zastosowań tych wartości.\n")
  
  alfa1 = as.numeric(readline("Podaj pierwszy współczynnik alfa: "))
  
  if (alfa1 == numeric()){
    alfa1 = alfa1
  } else if (alfa1 != numeric()){
    stop("Niepoprawna wartość, podaj wartość numeryczną.")
  }
  beta1 = as.numeric(readline("Podaj pierwszy współczynnik beta: "))
  
  if (beta1 == numeric()){
    beta1 = beta1
  } else if (beta1 != numeric()){
    stop("Niepoprawna wartość, podaj wartość numeryczną.")
  }
  alfa2 = as.numeric(readline("Podaj drugi współczynnik alfa: "))
  
  if (alfa2 == numeric()){
    alfa2 = alfa2
  } else if (alfa2 != numeric()){
    stop("Niepoprawna wartość, podaj wartość numeryczną.")
  }
  beta2 = as.numeric(readline("Podaj drugi współczynnik beta: "))
  
  if (beta2 == numeric()){
    beta2 = beta2
  } else if (beta2 != numeric()){
    stop("Niepoprawna wartość, podaj wartość numeryczną.")
  }
  granica_min1 = as.numeric(readline("Podaj pierwszą granicę minimalną: "))
  
  if (granica_min1 == numeric()){
    granica_min1 = granica_min1
  } else if (granica_min1 != numeric()){
    stop("Niepoprawna wartość, podaj wartość numeryczną.")
  }
  granica_max1 = as.numeric(readline("Podaj pierwszą granicę maksymalną: "))
  
  if (granica_max1 == numeric()){
    granica_max1 = granica_max1
  } else if (granica_max1 != numeric()){
    stop("Niepoprawna wartość, podaj wartość numeryczną.")
  }
  granica_min2 = as.numeric(readline("Podaj drugą granicę minimalną: "))
  
  if (granica_min2 == numeric()){
    granica_min2 = granica_min2
  } else if (granica_min2 != numeric()){
    stop("Niepoprawna wartość, podaj wartość numeryczną.")
  }
  granica_max2 = as.numeric(readline("Podaj drugą granicę maksymalną: "))
  
  if (granica_max2 == numeric()){
    granica_max2 = granica_max2
  } else if (granica_max2 != numeric()){
    stop("Niepoprawna wartość, podaj wartość numeryczną.")
  }
  cat("Podaj stan przepływu.\n")
  cat("1. Przepływ swobodny.\n")
  cat("2. Koryto zarastające/z pokrywą lodową.\n")
  przeplyw = as.numeric(readline("Wybierz (1 lub 2) : "))
  if (przeplyw == 1){
    
  } else if {
    
  } else {
    stop("Niepoprawna wartość, podaj 1 lub 2.")
  }
  
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
  