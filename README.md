Projekt wykonali:
Krzysztof Felka
Aliaksandra Kandratsenka

Celem projektu było stworzenie programu, który ułatwi zastosowanie metod rachunkowych do obliczenia natężenia przeplywu na podstawie pomiarów młynkiem hydrometrycznym.
Podstawowym założeniem projektu jest to, że pomiar jest dokonany ze świadomością wymagań metody pomiarowej, a osoba korzystająca z programu posiada wiedzę o wpływie warunków panujących w cieku na dane pomiarowe oraz współczynniki, potrzebne do obliczeń.

Na program skłąda się dwa skrypty ze zdefiniowanymi funkcjami
Pierwszy jest do uruchomienia przed wyjściem w teren, generuje pliki .csv z modelem danych do wypełnienia podczas pomiaru.

Drugi jest do uruchomienia po dokonaniu pomiarów. Przyjmuje na wejściu informacje o warunkach pomiaru, takich jak ukształtowanie brzegu, współczynniki tarowania młynku, oraz wypełnione arkusze, generowane przez pierwszy skrypt.

Na wyjściu program wyświetla wartość natężenia przepływu, inne wartości charakterystyczne dla przekroju oraz zapisuje do pliku .png szkic przekroju pomiarowego.
