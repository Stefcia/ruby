print :"wpisz swój login:"
imię = gets.chomp
sleep 3
system ('cls')
zabawy = [:Kolki_Babolki, :rozmówki2, :restauracje_split,:notesik, :zgadywanki, :rozmówki]
zzabawy = [:zgadywanki, :restauracje_split, :rozmówki, :rozmówki2 ,:notesik, :"Legends; rycerze kontra smoki i inne stwory"]
zzabawy2 = [:Kolki_Babolki, :zgadywanki, :"Legends; wojownicy kontra smoki i inne stwory"]
sleep 2
def Legends (użytkownik)
	rycerze = [
		{:imię => :"Alfa Romeo Startintrain Tree-Chouse", zycie: 100, siła: 80, zminnosc: 10, zdolnoscAtaku: 70, zdolnoscObrony: 900},
		{:imię => :"Ajofort Romeo Erackle Alfort", zycie: 245, siła: 100, zwinnosc: 1, zdolnoscAtaku: 100, zdolnoscObrony: 100},
		{:imię => :"Alfa Alga Arometo Alkret", zycie: 1000, siła: 545, zwinnosc: 4, zdolnoscAtaku: 300, zdolnoscObrony: 80},
		{:imię => :"Rekory Alga Erackoll Alkret", zycie: 399, siła: 600, zwinnosc: 60, zdolnoscAtaku: 4000, zdolnoscObrony: 4000}
	]
	smoki_wojowniki = [
		{:imię => :"Smok Holiday", zycie: 6000, siła: 59909, zdolnoscAtaku: 8000, zdolnoscObrony: 5000},
		{:imię => :"Smoczyca Ahestina Ping", zycie: 6900, siła: 6000, zdolnoscAtaku: 6000, zdolnoscObrony: 7000}
	]
	inne_potwory = [
		{:imię => :Seal, :typ => :"sowo-nietoperzo-smok", zycie: 600, siła: 700, zdolnoscAtaku: 800, zdolnoscObrony: 900}
	]
	while true
		puts :"Wybierz rycerza lub wojownika:"
		rycerze.each do |rycerz|
			case rycerz.class
			when Hash
				sleep 3
				rycerz.each do |klucz, nazwa|
					puts :"#{klucz} to #{nazwa} z #{rycerz}"
					sleep 4
				end
			end
		end
		smoki_wojowniki.each do |klucz, cos_od_smoka|
			puts :"#{cos_od_smoka} jest  od #{klucz},"
			sleep 1
			puts :"..."
			sleep 1
			puts :"Który pochodzi z #{smoki_wojowniki}"
			sleep 1
		end
	end
end
sleep 2
def rozmowy(ilośćZakręceń, zaczynajacy, co, rozmowca)
	puts :"zacznijmy rozmowy!" 
	sleep 1
	rozmówki = [
		[zaczynajacy, co]
	]
	sleep 1
	i = 0
	rozmówki.each do |metadane|
		sleep 1
		i = i+1
		if i.odd?
		 	puts :"#{metadane.first} mówi: #{metadane.last}."
			sleep 2
			print :"co odpowie #{rozmowca}?"
			odpowiedź = gets.chomp
			rozmówki = rozmówki.push([rozmowca, odpowiedź])
		else
			sleep 1
			case i
			when 0..4 || 24
				sleep 2
				wypowiedź = :"#{[:"Abrakadabra! (Nie bój się, nie umiem czarować...)", :"Jak się masz, stary(a)?",:"o nie! Nie Umyłem(am) dziś zębów!", :"Ja się boję iść do twojego domu, bo masz 5 psów.", :"nie lubię, gdy się ubierasz na zielono.", :"Abrakadabra! (Nie bój się, nie umiem czarować...)"].sample}"
			when 5..10 || 40
				sleep 3
				wypowiedź = :"#{[:"co robisz ostatnio w domu?", :"Nie lubię takiego koloru, jakiego jest moja koszulka...", :"Lubię kiedy ubierasz się na niebieskawo-czerwono-fioletowo-zielono.", :"co robisz ostatnio w domu?", :"Nie lubię takiego koloru, jakiego jest ta koszulka...", :"Lubię kiedy ubierasz się na niebieskawo-czerwono-fioletowo-zielono.", :"co robisz ostatnio w domu?"].sample}"
			when 11..17 || 104
				sleep 4
				wypowiedź = :"#{[:"Co porobimy?",:"super...", :"mmm... mniam!", :"Co porobimy?", :"Uwielbiam mleko kozie. Masz jeszcze trochę?", :"Lubię twój ser.", :"super...", :"Uwielbiam mleko owcze. Masz jeszcze trochę?", :"Uwielbiam mleko owcze. Masz jeszcze trochę?", :"super...", :"Uwielbiam mleko owcze. Masz jeszcze trochę?", :"Dobrze, że nie masz mleka krowiego.", :"jaka ładna sukienka!"].sample}"
			when 100 || 20
				sleep 5.5
				wypowiedź = :"#{[:"A co to jest obora?", :"Co jest lepsze: kozie mleko czy owcze mleko?", :"? A ja myślałem że nie."].sample}"
			when 30..45 || 67
				wypowiedź =:"#{[:"Mam w domu makaron z sosem #{[:"czosnkowym", :"jabłkowym (z ryżem i fasolką)"].sample}", :""].sampl}"
			else
				if i > 105
					sleep 6
					wypowiedź = :"#{[:"Ile masz owiec, a ile kóz?", :"mmm... mniam! oscypek!", :"Ile masz owiec, a ile kóz?"].sample}"
				else
					sleep 5
					if i < 105
						puts :"ok, ok."
						sleep 6
						wypowiedź = :"#{[:"O! to przecież BMW, a nie Alfa Romeo!",:"O, widzisz Pontiac! A za nim Alfa Romeo i Suzuki!",:"W moich 10 stajniach jest 10 mysich dziur. W każdej miałam na początku 10 mysich par, które rodzą rocznie 20 młodych(5 dziewcząt i 5 chłopaków). Mam je 3,5 lat.", :"W każdej 1 stajni są 2 pary kotów. Koty te w jeden rok rodzą(każde pary rodzą!) 8 kociąt. Ma koty od 2 lat. Ile mam kotów?",:"Lubisz wchodzić do obory?", :"Ja mam 10 stajni, a na początku miałam w każdej 5 par koni, które rodzą rocznie 6 młodych.", :"W każdej z moich stajnii jest 6 szczurzych dziur. W każdej z tych dziur miałam na początku 2 pary, które rocznie rodzą 2 młodych(1 szczurzycę i 1 szczura). Każda kocia para zjada rocznie 8 szczurów. Mam szczurze dziury od 3 lat.", :"Mam też kozy, ale o tym pomówimy później.", :"super twoja nowa koszulka... Ja mam podobną, tylko że niebieskawo-czerwono-fioletowo-zielono"].sample}"
					end
				end
			end
			rozmówki = rozmówki.push([zaczynajacy, wypowiedź])
		end
		if ilośćZakręceń < 1
			break
		else
			ilośćZakręceń = ilośćZakręceń - 1
		end
	end 
	sleep 2
	puts :"oto rozmowa #{zaczynajacy} i #{rozmowca}:"
	rozmówki.each do |metadane|
		sleep 1
		puts :"- #{metadane.last} - #{[:"rzekł(a)", :"mówi", :"powiedział(a)", :"mówił(a)", :"rzekł(a)", :"mówi"].sample} #{metadane.first}."
	end
end
def rozmówki(ilośćZakręceń, zaczynajacy, rozmowca, co)
	puts :"zacznijmy rozmówki!"
	i = 0 
	rozmówki = [
		[:"#{zaczynajacy}", co]
	]
	sleep 1
	rozmówki.each do |metadane|
		i = i+1
		if $i.odd?
		 	puts :"#{metadane.first} mówi: #{metadane.last}."
			print :"co odpowie #{rozmowca}?"
			odpowiedź = gets.chomp
			rozmówki = rozmówki.push([rozmowca, odpowiedź])
		else
			puts :"#{metadane.first} mówi: #{metadane.last}"
			print :"co odpowie #{zaczynajacy}?"
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
	puts :"oto rozmowa #{zaczynajacy} i #{rozmowca}:"
	rozmówki.each do |metadane|
		puts :"- #{metadane.last} - #{[:"rzekł(a)", :"mówi", :"powiedział(a)", :"mówił(a)", :"rzekł(a)", :"mówi"].sample} #{metadane.first}."
	end
end
sleep 1
def notesik(ilośćZakręceń)
	puts :"zacznij 'piękne' notatki:"
	notatki = [:"oto piękna notatka:"]
	while true
		sleep 3
		n = gets.chomp
		notatki = notatki.push :"#{n}"
		sleep 1
		if $i == ilośćZakręceń
			break
		else
			$i = $i+1
			puts :"jeszcze nie kończymy, kontynuuj:"
		end
	end
	puts :"oto twoje notatki:"
	notatki.each do |n2|
		puts n2
	end
	$i = 0
	sleep 1
	return notatki
end
def restauracje_split
	print :"Witamy! Zamów coś! zamówienia wypisz po przecinku."
	sleep 7
	zamówienie = gets.chomp
	sleep 2
	zamówienie = zamówienie.split(",")
	return :"dziękujemy za twoje zakupy:#{zamówienie}."
end
sleep 1
kontoM = {
	:hasło => :"Matyldka",
	:zabawy => zabawy,
	:grupa => :"KB",
	:nazwa_użytkownika => :"Matyldka"
}
sleep rand(4)
kontoS = {
	:hasło => :"Stefuszka PRC",
	:zabawy => zzabawy,
	:grupa => :"PRC",
	:nazwa_użytkownika => :"Stefka"
}
sleep 3
kontoW = {
	:hasło => :"Wiktuś",
	:zabawy => zzabawy2,
	:grupa => :"KB",
	:nazwa_użytkownika => :"Wiktuś"
}
daneUżytkownikow = [kontoS, kontoM, kontoW]
puts :"podaj hasło:"
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
puts :"sprawdzone, czy masz poprawne dane."
if tlf 
	tajne = :tak
else
	tajne = :nie
end
if tajne == :nie
	
end
