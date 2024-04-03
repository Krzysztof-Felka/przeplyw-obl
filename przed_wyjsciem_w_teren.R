# Ten plik należy włączyć przed wyjściem w teren
# Zostaną stworzone 2 pliki .csv, które które należy wypełnić danymi które otrzymamy z pomiarów w terenie
# W "sondowanie_glebokosci.csv" 1 kolumna to odległość od brzegu, 2 kolumna to numer pionów, 3 kolumna to głębokość

do_roboty = function(){
  wd = getwd()
  cat("Ten skrypt stworzy folder 'Arkusze do uzupełnienia' w ", wd)
  cat("\nW tym folderze zostaną umieszczone dwa pliki .csv, które należy wypełnić danymi, otrzymanymi z pomiarów w terenie")
  sondowanie_glebokosci = data.frame(odległość_od_brzegu_lewego = c(0),
                                     nr_pionu = c(0),
                                     głębokość = c(0))
  dir.create("Arkusze do uzupelnienia")
  write.csv(sondowanie_glebokosci,
            file = "Arkusze do uzupelnienia/01sondowanie_glebokosci.csv",
            row.names = F)
  # Zostaje stworzony plik z 3 kolumnami i jednym wierszem z wartością zero, należy zamienić ten wiersz pierwszym pomiarem, i następnie dodać kolejne wiersze aż do ostatniego pomiaru.
  pomiar_predkosci = data.frame(Pion_pomiarowy = c(0),
                                odl_od_brzegu_lewego = c(0),
                                głębokosć_w_pionie = c(0),
                                czas_pomiaru = c(0),
                                liczba_obrotów_powierzchnia = c(0),
                                "l obr 0,8 h" = c(0),
                                "l obr 0,6 h" = c(0),
                                "l obr 0,4 h" = c(0),
                                "l obr 0,2 h" = c(0),
                                l_obr_dno = c(0))
  write.csv(pomiar_predkosci,
            file = "Arkusze do uzupelnienia/01pomiar_predkosci.csv",
            row.names = F)
  # Zostaje stworzony plik z 10 kolumnami i jeden wiersz z wartościami 0, które należy zamienić na pierwszy pomiar, następnie kolejny wiersz na drugi pomiar, aż do ostatniego pomiaru.
  cat("\n\nTen skrypt stworzy również folder 'Arkusze uzupełnione' w ", wd)
  cat("\nW tym folderze należy umieścić wszystkie arkusze po uzupełnieniu\n")
  dir.create("Arkusze uzupelnione")
  
}

do_roboty()
