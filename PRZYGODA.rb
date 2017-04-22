puts "               Witaj w PRZYGODZIE!
W grze może grać graczy: 1 lub 2."
gets.chomp
puts "
Gra polega na tym, że pierwszy gracz wybiera poziom, gdzie się odbywają akcje i 
robi przeszkody.
Przerwa jest wtedy, gdy przechodzisz na następny poziom (lub gdy wpiszesz 'przerwa').
Jeśli wpiszesz na przerwie słowo 'patrz' gra podaje opis twojego otoczenia, miejsca, poziomu.
Po wpisaniu (na przerwie) 'inwentarz' dowiesz się, co niesiesz oraz co zdobyłeś.
Gdy wpiszesz na przerwie 'gdzie' gra podaje gdzie jesteś, co przeszedłeś.
'Weź','upuść', i 'rzuć' pomagają w zrobieniu czasownika z rzeczownikiem.
Część gry to próbowanie różnych poleceń i patrzenie, co się dzieje.
Jeśli chcesz więcej instrukcji, na przerwie wpisz 'pomoc'."
while true
	sleep 2
	print "zaczynamy!
	zaczyna gracz nr 1 - lub ten, który jako jedyny gra.
	gracza nr 1 będę nazywać Jeden.
	A gracza nr 2(tego, który będzie grać później) - Dwa.
	Jeden ma wybrać otoczenie, z tego(wpisz liczby):
	1). góry, 
	2). morza, 
	3). niziny, 
	4). wyżyny, 
	5). wyspy, 
	6). GnM(góry nad morzem),
	7). losowe." 
	liczba = gets.chomp
	tablica = {
		"1" => 'góry',
		"2" => 'morza',
		"3" =>'niziny',
		"4" => 'wyżyny',
		"5" => 'wyspy',
		"6" => 'góry nad morzem',
		"7" => 'losowe',
		"8" => nil,
		"przerwa" => :przerwij_pracę
		}
	tablica2 = {"8" => nil}.merge (tablica)
	tablica2.each do |klucz, zamek|
		klucz = $klucz
		if liczba == klucz
			puts "aa... wybrałeś #{klucz}.
			#{klucz} oznacza #{zamek}."
			break
		else
			puts "nie wybrałeś #{klucz}??"
		end
	end
	if tablica.include?(klucz)
		#include? = zawiera
		break
	else
		puts "źle!!!!!!! zaczynamy od nowa."
		print "najpierw jeszcze napisz,jak mam do ciebie mówić?:"
		imię1 = gets.chomp
		print "No wreszcie mogę mówić do ciebie jak chcesz.
		(Czyli będziesz nazywany przezemnie #{imię1}.)"
	end
end
while true
	if liczba == $klucz
		puts "jest przerwa."
	else
		break
	end
	puts "Pora wypróbować nasze hm... Jak to powiedzieć..."
	sleep 20
	system ('cls')
	print "Już wiem!Definicje. 
	Czyli zaczynamy!(Wybierz, Jeden, coś z tego: 'informacje','instrukcja':)"
	przerwisko = gets.chomp
	$klucz = $KLUCZ
	print "najpierw jeszcze napisz,jak mam do ciebie mówić?:"
		imię1 = gets.chomp
		print "No wreszcie mogę mówić do ciebie jak chcesz.
		(Czyli będziesz nazywany przezemnie #{imię1}.)"
		sleep 2
	if przerwisko == "informacje"
		puts "#{imię1}, napisałeś 'przerwa',
		A potem napisałeś 'informacje'...
		Czyli CHCESZ informacje.
		no, to proszę:"
		print "#{imię1}, po pierwsze powiem ci, po co to robisz...
		Robisz to po to,by Dwa pograł se w grę z PRZYGODĄ.
		Ty,#{imię1} będziesz mógł(a) potem być graczem Dwa.
		Po drugie, wijaśnię ci co będziesz robił(a) jako gracz Dwa(lub w dalszym ciągu gry, jeśli grasz sam(a)).
		Będziesz szedł przez wybrany przez gracza Jeden(lub siebie, zależy) teren,
		Chodzić po tajemniczym świecie pełnym niespodzianek...(zresztą sam się dowiesz.)
		Po trzecie i otatnie. Chodzi mi o 
		jedną informację.
		Ty, #{imię1}, dopóki jesteś Jeden, nie masz już wstępu do definicji* 'przerwa'.
		( - * coś o funkcjach (Definicjach): 
		Funkcje są zazwyczaj definiowane zanim zostaną one wykorzystane, ale mogą być również zdefiniowane później albo można używając nawet krótszą składnię się, a nawet anonimowe funkcje mogą podjąć wiele argumentów, Argumenty mogą być pominięte, a jedna z nich mogła spłodzić innego (Funkcje mogą również wziąć inne funkcje jako wejście.),*.
		 * przetłumaczone z ClojureScirpt z angielskiego.)"
	else
		if przerwisko == "instrukcja"
			puts "Gra polega na tym, że pierwszy gracz wybiera poziom, gdzie się odbywają akcje i 
			robi przeszkody.
			Przerwa jest wtedy, gdy przechodzisz na następny poziom (lub gdy wpiszesz 'przerwa').
			Jeśli wpiszesz na przerwie słowo 'patrz' gra podaje opis twojego otoczenia, miejsca, poziomu.
			Po wpisaniu (na przerwie) 'inwentarz' dowiesz się, co niesiesz oraz co zdobyłeś.
			Gdy wpiszesz na przerwie 'gdzie' gra podaje gdzie jesteś, co przeszedłeś.
			'Weź','upuść', i 'rzuć' pomagają w zrobieniu czasownika z rzeczownikiem.
			Część gry to próbowanie różnych poleceń i patrzenie, co się dzieje.
			W grze chodzi też o to, żeby tworzyć, bawić się i uczyć korzystania z matematyki w życiu* - ale można też
			niszczyć.
			Zdradzę Ci, #{imię1} tajemnicę.
			W trakcie przerwy zauważyłeś, że komputer zacina się** - popatrz gdzie są '**' i przeczytaj, to rozmiążesz tą tajemnicę.
			* - matematyka jest w życiu potrzebna, ale niektóre przykłady są głupie."
			sleep 3
			puts "** - przed chwilą komputer się zaciął, nieprawdaż? 
			To moja sprawka, czyli programu."
			sleep 7			
			break
		else
			puts "#{przerwisko}?????????!"
		end	
	end
end
