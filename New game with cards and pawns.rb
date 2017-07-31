puts "Włączam menu główne gry 'niezwykła podróż'. 
Proszę czekać a dalsze instrukcje."
while true
	sleep 4.3
	puts "Wpisz, co mam wykonać."
	sleep 3
	print "To znaczy... Wybierz i wpisz wybraną rzecz(którą wykonam):
	instrukcja,
	graj,
	wyjdź:"
	wybór = gets.chomp
	if wybór == 'wyjdź'
		break
	end
end
puts "koniec gry. Wpisz Enter"
