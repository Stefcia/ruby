def instrukcja
	puts "Gra toczy się tak(załóżmy, że wybrłeś'graj'):
	1.) Wchodzisz(co już zrobiłeś) w menu główne i wybieraz graj, wyjdz lub instrukcja.
	2.) Włącza się gra i... grasz(czasami musisz trochę poczekać)!"
end
def menu_glowne
	sleep 4.3
	puts "Wpisz, co mam wykonać."
	sleep 3
	print "To znaczy... Wybierz i wpisz wybraną rzecz(którą wykonam): instrukcja, graj, wyjdz(nie można używać ż, ś, ę, ć, ó, ą, ź, więc 'wyjdz' może oznaczać 'wyjdź'. itp.):"
	wybor = gets.chomp
	sleep 2
	puts "#{wybor}... wyszukuję... proszę czekać... #{wybor}..."
	sleep 1
	puts wybor
	case wybor
	when "wyjdz"
		system ('cls')
		break
	when "instrukcja"
		instrukcja
	end
end
sleep 1
puts "Właśnie stworzono menu główne gry 'niezwykła podróż'"
puts "Włączam menu główne gry 'niezwykła podróż'. Proszę czekać na dalsze instrukcje."
puts "koniec gry. Naciśnij klawisz Enter"
gets.chomp
