print "wpisz swój login:"
imię = gets.chomp
sleep 3
system ('cls')
zabawy = [:Kolki_Babolki, :restauracje_split,:notesik, :zgadywanki, :rozmówki]
zzabawy = [:zgadywanki, :restauracje_split, :rozmówki, :notesik]
zzabawy2 = [:Kolki_Babolki, :zgadywanki]
sleep 5
def notesik(ilośćZakręceń)
	puts "zacznij 'piękne' notatki:"
	i = 0
	notatki = ["oto piękna notatka:"]
	while true
		sleep 3
		n = gets.chomp
		notatki = notatki.push "#{n}"
		sleep 1
		if i == ilośćZakręceń
			break
		else
			i = i+1
			puts "jeszcze nie kończymy, kontynuuj:"
		end
	end
	puts "oto twoje notatki:"
	notatki.each do |n2|
		puts n2
	end
end
sleep 1
kontoM = {
	:hasło => "Matyldka",
	:zabawy => zabawy,
	:grupa => "KB",
	:nazwa_użytkownika => "Matyldka"
}
sleep rand(4)
kontoS = {
	:hasło => "Stefuszka PRC",
	:zabawy => zzabawy,
	:grupa => "PRC",
	:nazwa_użytkownika => "Stefka"
}
sleep 3
kontoW = {
	:hasło => "Wiktuś",
	:zabawy => zzabawy2,
	:grupa => "KB",
	:nazwa_użytkownika => "Wiktuś"
}
daneUżytkownikow = [kontoS, kontoM, kontoW]
puts "podaj hasło:"
hasło = gets.chomp
sleep 1
system ('cls')
#def sprawdź = rozwiązanie
def sprawdź(podaneImie, podaneHaslo, coSprawdzam)
	coSprawdzam.each do |a|
		case a.class
		when Hash
			if a[:nazwa_użytkownika] == podaneImie
				return a[:hasło] == podaneHaslo
			end
		end
	end
end
sleep 2
tlf = sprawdź imię, hasło, daneUżytkownikow
sleep 1
puts "sprawdzone, czy masz poprawne dane."
if tlf == true
	tajne = :tak
else
	tajne = :nie
end
if tajne == :nie
	
end
