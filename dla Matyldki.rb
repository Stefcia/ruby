print "wpisz swój login:"
imię = gets.chomp
sleep 3
system ('cls')
zabawy = [:Kolki_Babolki, :rozmówki2, :restauracje_split,:notesik, :zgadywanki, :rozmówki]
zzabawy = [:zgadywanki, :restauracje_split, :rozmówki, :rozmówki2 ,:notesik]
zzabawy2 = [:Kolki_Babolki, :zgadywanki]
sleep 2
$i = 0
def rozmowy(ilośćZakręceń, zaczynajacy, co, rozmowca)
	puts "zacznijmy rozmowy!" 
	rozmówki = [
		[:"#{zaczynajacy}", co]
	]
	sleep 1
	rozmówki.each do |metadane|
		$i = $i+1
		if $i.odd?
		 	puts "#{metadane.first} mówi: #{metadane.last}."
			print "co odpowie #{rozmowca}?"
			odpowiedź = gets.chomp
			rozmówki = rozmówki.push([rozmowca, odpowiedź])
		else
			
		end
	end 
		if ilośćZakręceń < 1
			break
		else
			ilośćZakręceń = ilośćZakręceń - 1
		end
	end
	sleep 2
	$i = 0
	puts "oto rozmowa #{zaczynajacy} i #{rozmowca}:"
	rozmówki.each do |metadane|
		puts "- #{metadane.last} - #{["rzekł(a)", "mówi", "powiedział(a)", "mówił(a)", "rzekł(a)", "mówi"].sample} #{metadane.first}."
	end
end
def rozmówki(ilośćZakręceń, zaczynajacy, rozmowca, co)
	puts "zacznijmy rozmówki!" 
	rozmówki = [
		[:"#{zaczynajacy}", co]
	]
	sleep 1
	rozmówki.each do |metadane|
		$i = $i+1
		if $i.odd?
		 	puts "#{metadane.first} mówi: #{metadane.last}."
			print "co odpowie #{rozmowca}?"
			odpowiedź = gets.chomp
			rozmówki = rozmówki.push([rozmowca, odpowiedź])
		else
			puts "#{metadane.first} mówi: #{metadane.last}"
			print "co odpowie #{zaczynajacy}?"
			odpowiedź = gets.chomp
			rozmówki = rozmówki.push([zaczynajacy, odpowiedź])				
		end 
		if ilośćZakręceń < 1
			break
		else
			ilośćZakręceń = ilośćZakręceń - 1
		end
	end
	sleep 2
	$i = 0
	puts "oto rozmowa #{zaczynajacy} i #{rozmowca}:"
	rozmówki.each do |metadane|
		puts "- #{metadane.last} - #{["rzekł(a)", "mówi", "powiedział(a)", "mówił(a)", "rzekł(a)", "mówi"].sample} #{metadane.first}."
	end
end
sleep 1
def notesik(ilośćZakręceń)
	puts "zacznij 'piękne' notatki:"
	notatki = ["oto piękna notatka:"]
	while true
		sleep 3
		n = gets.chomp
		notatki = notatki.push "#{n}"
		sleep 1
		if $i == ilośćZakręceń
			break
		else
			$i = $i+1
			puts "jeszcze nie kończymy, kontynuuj:"
		end
	end
	puts "oto twoje notatki:"
	notatki.each do |n2|
		puts n2
	end
	$i = 0
	sleep 1
	return notatki
end
def restauracje_split
	print "Witamy! Zamów coś! zamówienia wypisz po przecinku."
	sleep 7
	zamówienie = gets.chomp
	sleep 2
	zamówienie = zamówienie.split(",")
	return "dziękujemy za twoje zakupy:#{zamówienie}."
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
