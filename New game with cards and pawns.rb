def instrukcja
	puts "Gra toczy się tak(załóżmy, że wybrałeś 'graj'):
	1.) Wchodzisz(co już zrobiłeś) w menu główne i wybieraz graj, wyjdz lub instrukcja.
	2.) Włącza się gra i... grasz(czasami musisz trochę poczekać)
	3.) Komputer tworzy 'planszę'.
	4.) Wpisujesz cyfrę.
	5.) Komputer losuje parę razy.
	6.) Załóżmy, że ostateczne losowanie komputera wynosi 3. Idziesz wtedy 3 metry przed siebie.
	7.) Jeśli w kroku przy kroku 5 trzy metry przed tobą nie ma żadnej pozycjii karty Akcjii ani pola wymagającego karty Akcjii, to nic się nie dzieje.
	8.) Ale jeżeli jednak jest, to się dzieje... A! Sam zobacz!
	9.) Kroki: 5, 6, 7, 8 komputer powtarza wiele razy, aż dotrzesz do końca.
	10.) "
end

def menu_glowne
	sleep 4.3
	puts "Wpisz, co mam wykonać."
	sleep 3
	print "To znaczy... Wybierz i wpisz wybraną rzecz(którą wykonam): slownik, instrukcja, graj, wyjdz(nie można używać ż, ś, ę, ć, ó, ą, ź, więc 'wyjdz' może oznaczać 'wyjdź'. itp.):"
	wybor = gets.chomp
	sleep 2
	puts "#{wybor}... wyszukuję... proszę czekać... #{wybor}..."
	sleep 1
	puts "#{wybor}..."
end
#po menu_glowne jest:
#case wybor
#when "wyjdz"
#	system ('cls')
#	break
#when "instrukcja"
#	instrukcja
#when "graj"
#end
def graj (wykonaj)

end
sleep 1
puts "Właśnie stworzono menu główne gry 'niezwykła podróż'"
puts "Włączam menu główne gry 'niezwykła podróż'. Proszę czekać na dalsze instrukcje."
puts "koniec gry. Naciśnij klawisz Enter"
gets.chomp
