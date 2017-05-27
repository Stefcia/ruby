print "wpisz swój login:"
login = gets.chomp
zabawy = [:Kolki_Babolki, :restauracje_split, :zgadywanki, :rozmówki]
zzabawy = [:zgadywanki, :restauracje_split, :rozmówki]
zzabawy2 = [:Kolki_Babolki, :zgadywanki]
kontoM = {
	:login => 12345, 
	:hasło => "Matyldka",
	:zabawy => zabawy,
	:grupa => "KB"
	:nazwa_użytkownika => "Matyldka"
}
kontoS = {
	:login => 5682,
	:hasło => "Stefuszka PRC",
	:zabawy => zzabawy,
	:grupa => "PRC",
	:nazwa_użytkownika => "Stefka"
}
kontoW = {
	:login => 4000,
	:hasło => "Wiktuś",
	:zabawy => zzabawy2,
	:grupa => "KB",
	:nazwa_użytkownika => "Wiktuś"
}
kontoW.each do |nazwa, dane|

end
