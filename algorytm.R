Algorytm:
  -przyjmujemy dane młynka na wejściu (alfa, beta)

  -przyjmujemy na wejściu, czy jest przepływ swobodny, czy mamy koryto zarastające/pokrywę lodową - od tego zależy 
      obliczenie średniej prędkości przepływu w pionie
  -rzyjmujemy na wejściu, czy metoda jest pełna, czy uproszczona    
  -przyjmujemy na wejściu jakie są warunki przy brzegu - od tego zależy wartość wsp fi
  
  -warianty warunków:
        *woda przy brzegu nie płynie ze względu na silne zarastanie lub istnieje przekrój nieczynny (fi = 0.5)
        *brzeg płaski i wyrównany (fi = 0.7)
        *brzeg ma naturalny spadek, jest zbudowany z gliny, pisku lub żwiru (fi = 0.8)
        *brzeg jest wyłożony deskami, betonem, ma duże nachylenie i jest wyrównany (fi = 0.9)
  
  -przyjmujemy na wejściu dane sondażowe (głębokości w pionach sondażowych, ich odległość od lewego brzegu)  
      
  -stwarzamy df z 10 kolumnami i tyloma wierszami, ile jest pionów sondażowych
      
  -lista kolumn:
    *odległość od brzegu lewego - odl - dostaejmy na wejściu
    *nr pionu pomiarowego - nr - dostajemy na wejściu, tylko kilka z pionów sondażowych są pomiarowe, reszta ma NULL
    *głębokość w pionie - h - dostaejmy na wejściu
    *głębokosć średnia - hsr - obliczamy: hsr_n = (h_n-1 + h_n)/2
    *odległość między punktemi sondowań - b - obliczamy: b_n = odl_n - odl_n-1
    *powierzchnia - f - obliczamy: f_n = b_n * hsr_n 
    *suma powierzchni między pionami pomiarowymi - deltaF - obliczamy: suma(f) dla odc pomiedzy pionami
    *prędkość średnia w pionie - vh - obliczamy oddzielnie opisane dla df pionów
    *prędkość średnia w polu - vsr - obliczamy: dla pól między pionami pomiarowymi vsr_n = (vh_n-1 + vh_n)/2;
                                                dla pół brzegowych vsr_n = fita * vsr (fita zależy od charakeru 
                                                                                        brzegu)
    *przepływ cząstkowy - deltaQ - olbliczamy: deltaQ_n = vsr_n * deltaF_n
  
  -przyjmujemy na wejściu zestaw danych pomiarowych o prędkośći na poszczególnych głębokościach 
    w poszczególnych pionach; każdy wiersz odpowiada pionu pomiarowemu
     
  -stwarzamy df z 29 kolumnami i tyloma wierszami, ile jest pionów pomiarowych (w naszym przypadku 5)
    
  -lista kolumn:
    * nr pionu - dostajemy na wejściu (liczba arabska)
    * odległość od brzegu - dostajemy na wejściu
    * głębokość w pionie - h - dostajemy na wejściu
    * czas pomiaru - t - dostajemy na wejściu, w sekundach
    * liczba obrotów przy powierzchni - l_pow - dostajemy na wejściu
    * liczba obrotów na 0.8h - l_0.8h - dostajemy na wejściu
    * liczba obrotów na 0.6h - l_0.6h - dostajemy na wejściu
    * liczba obrotów na 0.4h - l_0.4h - dostajemy na wejściu
    * liczba obrotów na 0.2h - l_0.2h - dostajemy na wejściu
    * liczba obrotów przy dnie - l_dno - dostajemy na wejściu
    * głębokość na 0.8h - 0.8h - obliczamy: 0.8h = h - 0.8 * h 
    * głębokość na 0.6h - 0.6h - obliczamy: 0.6h = h - 0.6 * h 
    * głębokość na 0.4h - 0.4h - obliczamy: 0.4h = h - 0.4 * h 
    * głębokość na 0.2h - 0.2h - obliczamy: 0.2h = h - 0.2 * h 
    * obroty na sekundę przy powierzchni - n_pow - obliczamy: n_pow = l_pow / t
    * obroty na sekundę na 0.8h - n_0.8h - obliczamy: n_0.8h = l_0.8h / t
    * obroty na sekundę na 0.6h - n_0.6h - obliczamy: n_0.6h = l_0.6h / t
    * obroty na sekundę na 0.4h - n_0.4h - obliczamy: n_0.4h = l_0.4h / t
    * obroty na sekundę na 0.2h - n_0.2h - obliczamy: n_0.2h = l_0.2h / t
    * obroty na sekundę przy dnie - n_dno - obliczamy: n_dno = l_dno / t
    * prędkość przy powierzchni - v_pow - obliczamy: v_pow = alfa + beta * n_pow 
    * prędkość na 0.8h - v_0.8h - obliczamy: v_0.8h = alfa + beta * n_0.8h 
    * prędkość na 0.6h - v_0.6h - obliczamy: v_0.6h = alfa + beta * n_0.6h 
    * prędkość na 0.4h - v_0.4h - obliczamy: v_0.4h = alfa + beta * n_0.4h 
    * prędkość na 0.2h - v_0.2h - obliczamy: v_0.2h = alfa + beta * n_0.2h 
    * prędkość przy dnie - v_dno - obliczamy: v_dno = alfa + beta * n_dno
    * średnia prędkość w pionie - obliczamy:
      
  -obliczamy średnią prędkość przepływu w pionie. wzór zależy od głębokośći pionu, metody i warunków (przepływ swobodny 
                                                                    vs. zarastanie koryta/pokrywa lodowa)
    
  -wzory na prędkość zależnie od warunków:
        wartości:
        h - głebokość w pionie pomiarowym
        v_h - średnia prędkość w pionie pomiarowym
        v_p - prędkość przy powierzchni wody
        v_d - prędkość przy dnie
        v_0.2h - prędkość na wysokości 0.2 głębokości od dna
      @ przepływ swobodny, metoda pełna
        *h < 0.2 m            v_h = v_0.4h
        *0.2 <= h <= 0.6 m    v_h = 0.25 * (v_0.2h + 2 * v_0.4h + v_0.8h)
        *h > 0.6 m            v_h = 0.1 * (v_d + 2 * v_0.2h + 3 * v_0.4h + 3 * v_0.8h + v_p)
      @ przepływ swobodny, metoda uproszczona 
        *v_h = (v_0.2h + v_0.8h)/2
      @ koryto zarastające/zjawiska lodowe
        *h < 0.2 m            v_h = v_0.5h
        *0.2 <= h <= 0.6 m    v_h = 0.33 * (v_0.15h + v_0.5h + v_0.85h)
        *h > 0.6 m            v_h = 0.1 * (v_d + 2 * v_0.2h + 2 * v_0.6h + 2 * v_0.8h + v_p)
  
  -wrzucamy dane o średniej prędkości przepływu w pionie do df głębokości
  
  -dokańczamy obliczenia, do których nam tych danych brakowało
  
  -sumujemy przepływ cząstkowy
  
  -dajemy ten przepływ cząstkowy na wyjście