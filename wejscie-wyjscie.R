Na wejściu dostajemy:
  - odległość pionu sondażowego od lewego brzegu
  - głębokość w pionie sondażowym
  - które z pionów sondażowych są pionami pomiarowymi
  - współczynniki alfa i beta młynku pomiarowego (dwa sety dla różnych zasięgów liczby obrotów)
  - głębokość pomiarów w pionie pomiarowym, liczba obrotów młynka i czas pomiaru.
  - współczynnik redukcyjny prędkości fita 


Na wyjściu wydajemy:
  - Przepływ całkowity
  - szkic przekroju, ale to nie obowiązkowe

Założenia ogólne:
  - na starcie zakladamy, że dostajemy idealne dane bez braków i normalnie pomierzone
  - w pierwszym kroku robimy jądro, które oblicza te idealne dane
  - w drugim kroku obsługujemy przypadki niepoprawnych danych
  - w trzecim kroku piszemy komunikacje z użytkownikiem, ilekolwiek czasu będziemy na to mieli
