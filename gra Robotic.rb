def methodne(mim=nil)
	if mim == nil
		mim = {
			pap: 8
		}
	end
	mim = mim.merge (mim)
	mom = mim.shift
	puts mom
end
puts "gra polega i ma reguły(rady):
1.wypisujesz skróty - najkrócej,
2.po wyłączeniu gry wszystko zaczyna się od nowa i 
3.broni, którą używałeś i wyczerpałeś jest aktywna według listy:"
lista = {
	laser: 5,
	miecz: 6,
	pięść: 55,
	karabin: 4,
	'łuk i strzały' => 'łuk zostaje - strzały: 100!',
	strzały: 100,
	dżida: 90
}
lista.each do |broń, ilość|
	puts "#{broń} ma wytrzymałość #{ilość}."
end
while true
	print "napisz coś z tego:
	roboty,
	reguły,
	wyjdź,
	start:"
	decydowanie = gets.chomp
	if decydowanie == 'reguły'
		puts "gra polega i ma reguły(rady):
		1.wypisujesz skróty - najkrócej,
		2.roboty, którym pomożesz w trakcie jednej gry, możesz przywołać przyciskiem '!',
		3.po wyłączeniu gry wszystko zaczyna się od nowa 
		4. pięść to 'p', laser 'l', miecz 'mm' oraz strzały z łuku: 'strz'
		5.broni, którą używałeś i wyczerpałeś jest aktywna według listy:"
		lista = {
			laser: 5,
			miecz: 6,
			karabin: 4,
			'łuk i strzały' => 'łuk zostaje - strzały: 100!',
			strzały: 100,
			dżida: 90,
			pięść: 55
		}
		lista.each do |broń, ilość|
			puts "#{broń} ma wytrzymałość #{ilość}."
		end
		gets.chomp 
		system ('cls')
	end
	if decydowanie == 'wyjdź'
		puts "wychodzenie z gry Robotic..."
		break
	end
	if decydowanie == 'roboty'
		puts "roboty są i złe i dobre w tej grze...
		każdego normalnego da się pokonać dwoma ciosami miecza(jeden:'mm') lub jednym strzałem z łuku('strz');
		każdego normalnego z tarczą da się pokonać jednym strzałem z lasera('l');
		każdego słabego można rozwalić pięścią('p');
		każdego smoczego robota można pokonać trzema celnymi rzutami dżidą('dd')."
		gets.chomp 
		system ('cls')
	end
		if decydowanie == 'start'
		puts "ok. start!!!"
		puts "zaczynamy!"
		puts "biegniesz w nieznanym świecie..."
		print "widzisz na polance, która jest niedaleko, skrzynię.
		jeśli chcesz ją zostawić, napisz r.
		jeżeli jednak nie chcesz jej nie zostawiać, napisz coś innego:"
		ruszam = gets.chomp
		if ruszam == 'r'
			puts "ok. przechodzisz obok polanki."
			mam = {}
		else
			mam = {
				:piesc => 55,
			}
			niespodzianka = ['łuk i strzały', :laser, :miecz, :dżida, :karabin].sample
			puts "masz #{niespodzianka}!"
			if niespodzianka == :laser
				laser = 5
				piesc = 55
				mam = {laser: "#{laser}"}.merge (mam)
			end
			if niespodzianka == :miecz
				miecz = 6
				piesc = 55
				mam = {miecz: "#{miecz}"}.merge (mam)
			end
			if niespodzianka == 'łuk i strzały'
				strzaly = 100
				piesc = 55
				mam = {strzały: "#{strzaly}", 'łuk i strzały' => 'łuk zostaje; strzały:100'}.merge (mam)
			end
			if niespodzianka == :dżida
				dzida = 90
				piesc = 55
				mam = {:dżida => "#{dzida}"}.merge (mam)
			end
		end
		while true
			puts "idziesz dalej,dalej..."
			print "widzisz niewielki las.
			w jego środku znajdujesz...
			polanę, a na niej skrzynkę.
			jeśli chcesz ją otworzyć, to napisz 'otwieram'.
			ale jeżeli dla ciebie skrznka wygląda jakoś dziwnie, wpisz coś innego:"
			zdecydowanie = gets.chomp
			if zdecydowanie != 'otwieram'
				puts "słusznie."
			else
				while true
					puts "otwierasz."
					print "aa! wychodzi normalny robot z tarczą! 
					wpisz, jaką broń użyjesz:"
					broń = gets.chomp
					if mam.key? (:"#{broń}")
					else
						puts "pięść to 'p', laser 'l', miecz 'mm' oraz strzały z łuku: 'strz'"
						print "napisz skrót(lub głupotę,jeżeli chcesz wrócić:"
						skrót = gets.chomp
						skróty = ['p','l','mm','strz']
						if skróty.include? (skrót)
							puts "aha!"
							case skrót
							when  
								
							end
							mam.each do |klucz, wytrzymałość| 
								if mam.key?(:"#{broń}")
									puts "możemy to użyć!"
									case broń
									when condition
										
									end
								end
							end 
						else
							puts ""
						end
					end
				end
			end
		end
		gets.chomp 
		system ('cls')
	else
		puts "źle."
		gets.chomp
		system ('cls')
	end
end
