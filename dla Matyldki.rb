print "wpisz swój login(czyli imię):"
imię = gets.chomp
zabawy = [:Kolki_Babolki, :restauracje_split, :zgadywanki, :rozmówki]
zzabawy = [:zgadywanki, :restauracje_split, :rozmówki]
zzabawy2 = [:Kolki_Babolki, :zgadywanki]
sleep 1
kontoM = {
	:hasło => "Matyldka",
	:zabawy => zabawy,
	:grupa => "KB",
	:nazwa_użytkownika => "Matyldka"
}
kontoS = {
	:hasło => "Stefuszka PRC",
	:zabawy => zzabawy,
	:grupa => "PRC",
	:nazwa_użytkownika => "Stefka"
}
kontoW = {
	:hasło => "Wiktuś",
	:zabawy => zzabawy2,
	:grupa => "KB",
	:nazwa_użytkownika => "Wiktuś"
}
daneUżytkownikow = [kontoS, kontoM, kontoW]
puts "podaj hasło:"
hasło = gets.chomp
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
tlf = sprawdź imię, hasło, daneUżytkownikow
if tlf == true
	
end
