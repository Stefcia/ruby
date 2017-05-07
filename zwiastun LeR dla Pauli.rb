require 'json'
require 'tempfile'
puts "Witam w świecie robotów! Stworzymy teraz bazę robotów!"
class Robot 
	attr_reader :zdolnoscAtaku, :zdolnoscObrony, :imie
	def initialize(imie, zycie, sila, zwinnosc, zdolnoscAtaku, zdolnoscObrony)
		@imie = imie
		@zycie = zycie
		@sila = sila #siła robota
		@zwinnosc = zwinnosc #zwinność
		@zdolnoscAtaku = zdolnoscAtaku
		@zdolnoscObrony = zdolnoscObrony
		puts "robot ma siłę: #{sila}, zwinność: #{zwinnosc}, życie: #{zycie}, zdolnoscAtaku: #{zdolnoscAtaku}, zdolnoscObrony #{zdolnoscObrony} a dodatki ma: #{@dodatki}."
	end	
	def to_s
		"ROBO_#{imie}."
	end
	def opis
		"To jest robot #{to_s}. Jego sila to #{@sila} a zwinnosc to #{@zwinnosc} i ma dodatki: #{dodatki}."
	end
	def sila= (nowa_sila)
		@sila = nowa_sila
	end
	def zwinnosc= (nowa_zwinnosc)
		@zwinnosc = nowa_zwinnosc
	end
	def zycie= (nowa_zycie)
		@zycie = nowa_zycie
	end
	def sila	
		@sila
	end
	def zwinnosc
		@zwinnosc
	end
	def zycie
		@zycie
	end
	def wykonajAtak (roboAtakowany, atak)
		atak.obrazenia = ((rand(6)+1)* (1+((@sila/10.0+@zwinnosc/10.0)/2))).round
		if atak.wynikAkcji == 2 #krytyczny sukces UWAGA! zmienić na korzytanie z modułu
			atak.obrazenia *= 2 
		end
		roboAtakowany.zycie -= atak.obrazenia
		puts "UWAGA! #{roboAtakowany} doznał #{atak.obrazenia} obrażeń."
	end
	#koniec metod podstawowych
	
	def nowe_dodatki (dodatkir=['turboodrzutowe buty','zegarek  z kołysankami','ogienne rękawiczki'])
		dodatkir.each do |dodatek|
			print "czy chcesz mieć w tym robocie jako dodatek: #{dodatek}?"
			tn = gets.chomp
			if tn == "tak"
				@dodatki = @dodatki.unshift(dodatek)
			end
		end
	end
	def domyslne_dodatki # wybieraj domyślne dodatki	
		domyslne_dodatki = ["#{['super smok z pudełka','plastelina z funkcją wyciągania z niej rzeczy, co ulepisz'].sample}","#{['smoczek w jajku smoka','robo-potwór'].sample}","#{["robo-zestaw robo-naprawy","robo-zestaw naprawczy","pistolet z olejem niszczącym roboty"].sample}","#{['ogienne rękawiczki', 'przyssające się do wszystkiego rękawiczki'].sample}"]
		domyslne_dodatki.each do |dodatek|
			print "czy chcesz mieć w tym robocie jako dodatek: #{dodatek}?"
			tln = gets.chomp
			if tln != "nie"
				@dodatki = @dodatki.push (dodatek)
			end
		end
	end
	def dodatki
		return @dodatki
	end
	#zapisywanie Robocików do JSONa - nie ruszać! #http://stackoverflow.com/questions/3226054/how-to-convert-a-ruby-object-to-jsona
	def as_json(options={})
        {
            sila: @sila,
            zwinnosc: @zwinnosc,
            dodatki: @dodatki
        }
    end
	def to_json(*options)
        as_json(*options).to_json(*options)
    end
	def save_json
		t = Tempfile.new("test_temp")             
		t.write(to_json)
		t.close
		t
	end
	def self.make_robots_from_json(json_string)#bierze JSONa z danymi JENDEGO robota i tworzy obiekt RUBY.
		data = JSON.parse(json_string)#http://stackoverflow.com/questions/12723094/parse-json-to-object-ruby
		#puts data
		#puts data.class
		if data.is_a? Array
			puts 'tutaj w array'
			#data.map{|roboDane| puts roboDane.class}
			return data.map{|roboDane| Robot.new(roboDane['sila'], roboDane['zwinnosc'], roboDane['dodatki'])}
		else #czyli powinno być: Hash - co oznacza że łancuch JSONA zawierał tylko jednego robota lub nie
			puts 'nie w Array'
			return Robot.new(data['sila'], data['zwinnosc'], data['dodatki'])
		end
	end
end
sleep 1
puts "dobra. Teraz skończymy tworzenie bazy robotów!"
class RoboPtak < Robot # przychodzi w poziomie II
	def initialize(skrzydła, nogi, nazwa="R#{rand(4000)}",sila=nil, życie=80, zwinnosc=nil, zdolnoscAtaku=nil, zdolnoscObrony=nil)
		@dodatki = []
		if sila != nil
			@sila = sila
		else
			@sila = rand(90)
		end
		if zdolnoscAtaku != nil
			sleep 2
			puts "nie nic?"
			@zdolnoscAtaku = zdolnoscAtaku
		else
			sleep 1
			@zdolnoscAtaku = rand(100)
		end
		if zdolnoscObrony != nil
			sleep 6
			puts "nie nil!"
			@zdolnoscObrony = zdolnoscObrony
		else
			sleep 5
			@zdolnoscObrony = rand(600)
		end
		@życie = życie + 1
		@skrzydła = skrzydła
		@nogi = nogi
		@imię = nazwa
		if zwinnosc != nil
			@zwinnosc = zwinnosc
		else
			@zwinnosc = rand(80)
		end
	end
	def atak 
		silaw = rand(89)+1
		@sila = @sila - (silaw * 2)
		puts "brawo!! nasz #{@imię} grał z ptakiem z siłą #{silaw} i wygrał nasz ptak #{@imię}!
		niestety, stracił siłę o #{silaw*2}.
		teraz ma #{@sila}."
	end
	def wykonajAtak (roboAtakowany, atak)
		atak.obrazenia = ((rand(6)+1)* (1+((@sila/10.0+@zwinnosc/10.0)/2))).round
		if atak.wynikAkcji == 2 #krytyczny sukces UWAGA! zmienić na korzytanie z modułu
			atak.obrazenia *= 2 
		end
		roboAtakowany.życie -= atak.obrazenia
		puts "UWAGA! #{roboAtakowany} doznał #{atak.obrazenia} obrażeń."
	end
	def as_json(options={})
		{
			sila: @sila,
            zwinnosc: @zwinnosc,
            dodatki: @dodatki,
			nazwa: @imię,
			zwinnosc: @zwinnosc,
			sila: @@sila,
			skrzydła: @skrzydła,
			nogi: @nogi,
			życie: @życie
		}
	end
end
sleep 3
puts "gotowe! teraz stworzymy 'instykt' walki!"
class RoboWalka

	#attr_accessor :roboWyzywajacy, :roboAkceptujacy 
	attr_reader :roboWyzywajacy, :roboAkceptujacy, :początekWalki, :koniecWalki, :roboZwyciezca, :roboPrzegrany

	def initialize(robo1, robo2)
		@początekWalki = Time.now
		@roboWyzywajacy = robo1
		@roboAkceptujacy = robo2
	end
	
	def obrona(roboBroniacy, roboAtakujacy)
		obrona = Obrona.new(roboBroniacy.zdolnoscObrony)
		puts "#{roboBroniacy} zwiera wszystkie śrubki do obrony..."
		sleep 2
		puts "...#{obrona.los}..."
		sleep 4
		case obrona.wynikAkcji 
			when WynikAkcji::KRYTYCZNY_SUKCES 
				puts "OBRONA KRYTYCZNA! #{roboBroniacy} broni się jak robo-mistrz! Nie tylko odpiera atak, ale sam atakuje... #{roboAtakujacy} jest tak zaskoczony, że aż zaiskrzyły mu obwody i nie jest w stanie nic zrobić!" 
				sleep 3
				roboBroniacy.wykonajAtak(roboAtakujacy, Atak.new(roboAtakujacy.zdolnoscAtaku, rand(5)+1))
			when WynikAkcji::SUKCES
				puts "UDANA OBRONA! #{roboBroniacy} skutecznie się broni."
				sleep 3
			when WynikAkcji::PORAZKA
				puts "#{roboBroniacy} nie jest w stanie się obronić..."
				sleep 2
			when WynikAkcji::KRYTYCZNA_PORAZKA
				rodzaj = ["potyka się o własną antenkę podczas obrony", "broni się robociałem; gdy się zasłania swoim robopancerzem, pęka i pęka mu kabelek(na szczęście niezbyt potrzebny)..", "przeciwnik bije go, ale on urzywa robolaseru, który odbija się od oczu #{roboAtakujacy} i uszkadza go.."].sample
				if rodzaj == "broni się robociałem; gdy się zasłania swoim robopancerzem, pęka i pęka mu kabelek(na szczęście niezbyt potrzebny).."
					puts "KRYTYCZNIE ZŁA OBRONA! #{roboBroniacy} #{rodzaj}. Bardzo źle... dla niego."
					sleep 2
				else
					puts "KRYTYCZNIE ZŁA OBRONA! #{roboBroniacy} #{rodzaj}. Nie bardzo źle, ale troszkę źle... Dla niego."
					sleep 5
				end
			else
				puts "Dzieje się coś dziwnego: {#atak.wynikAkcji}"
		end
		return obrona
		
	end
	
	def atak(roboAtakujacy, roboBroniacy)
		atak = Atak.new(roboAtakujacy.zdolnoscAtaku)
		puts "#{roboAtakujacy} atakuje ile sił w bateryjce..."
		sleep 3
		puts "..."
		sleep 4
		puts "#...#{atak.los}..."
		sleep 3
		case atak.wynikAkcji 
			when WynikAkcji::KRYTYCZNY_SUKCES 
				puts "ATAK KRYTYCZNY! #{roboBroniacy} nie jest w stanie się bronić..." 
				sleep 3
				roboAtakujacy.wykonajAtak(roboBroniacy, atak)
			when WynikAkcji::SUKCES
				puts "UDANY ATAK... ale #{roboBroniacy} przystępuje do obrony..."
				sleep 3
				obrona = obrona(roboBroniacy, roboAtakujacy)
				case obrona.wynikAkcji
					when WynikAkcji::PORAZKA
						roboAtakujacy.wykonajAtak(roboBroniacy, atak)
					when WynikAkcji::KRYTYCZNA_PORAZKA
						roboAtakujacy.wykonajAtak(roboBroniacy, Atak.new(roboAtakujacy.zdolnoscAtaku, rand(5)+1))						
				end
			when WynikAkcji::PORAZKA
				puts "#{roboAtakujacy} nie jest w stanie skutecznie zagrozić przeciwnikowi..."
			when WynikAkcji::KRYTYCZNA_PORAZKA
				rodzaj = ["potyka się o własny kabel podczas ataku", "bije przeciwnika tak mocno, że #{roboBroniacy} nie umie odeprzeć ataku, więc atakuje i robi mu usterkę", "atakuje, ale #{roboBroniacy} jeszcze nie skończył ataku..", "bije się, ale tak, że wypada mu bateryjka", "jest uszkodzony, bo nagle pewien kabel się rospada"].sample
				if rodzaj == "bije przeciwnika tak mocno, że #{roboBroniacy} nie umie odeprzeć ataku, więc atakuje i robi mu usterkę"
					puts "ATAK KRYTYCZNY! #{roboAtakujacy} #{rodzaj}. Bardzo źle... dla niego."
					sleep 3
				else
					puts "!!!ATAK KRYTYCZNY!!! #{roboAtakujacy} #{rodzaj}.Nic bardzo złego, ale nie jest dobrze."
				end
				roboBroniacy.wykonajAtak(roboAtakujacy, Atak.new(roboAtakujacy.zdolnoscAtaku, rand(5)+1))
			else
				puts "Dzieje się coś dziwnego: #{atak.wynikAkcji}"
		end
		
	end
	
	def sprawdzCzyKoniec?
		#puts "#{@roboWyzywajacy.zycie} "
		koniec = (@roboWyzywajacy.zycie<1 || @roboAkceptujacy.zycie<1)
		if koniec
			if @roboWyzywajacy.zycie < 1
				@roboZwyciezca = @roboAkceptujacy
				@roboPrzegrany = @roboWyzywajacy				
			else
				@roboZwyciezca = @roboWyzywajacy
				@roboPrzegrany = @roboAkceptujacy
			end
			@koniecWalki = Time.now
			puts "Koniec walki! Wygrany: #{roboZwyciezca} - przegrany: #{roboPrzegrany}, którego koledzy zbierają jeszcze jego śrubki z areny..."
		end
		return koniec
	end
	
	
	def walczmy
		akcjaWalki = 1
		sleep 2
		until sprawdzCzyKoniec?
			puts " ***************** Akcja #{akcjaWalki}. ***************** \n#{roboWyzywajacy} ma #{roboWyzywajacy.zycie} punktów życia.\n#{roboAkceptujacy} ma #{roboAkceptujacy.zycie} punktów życia."
			if akcjaWalki.odd?
				atak(@roboAkceptujacy, @roboWyzywajacy)
			else
				atak(@roboWyzywajacy, @roboAkceptujacy)			
			end
			akcjaWalki =  akcjaWalki+1
		end
	end
end
sleep 2
puts "to teraz, właśnie teraz stworzyliśmy 'szkielet' walki!"
sleep 10
system ('cls')
module WynikAkcji
	KRYTYCZNY_SUKCES = 2
	SUKCES = 1
	KRYTYCZNA_PORAZKA = -2
	PORAZKA = -1
end
puts "A teraz 'pojemnik' na akcje walki!"
sleep 1
class Akcja include WynikAkcji
	attr_reader :wynikAkcji, :los
	
	
	def initialize(zdolnosc, los=rand(100)+1)
		@zdolnosc = zdolnosc
		@los = los
		ustalWynik
	end
	
	def ustalWynik
		if @zdolnosc >= @los #udało się
			if @los <= 5
				@wynikAkcji = WynikAkcji::KRYTYCZNY_SUKCES
			elsif @los == 100
				@wynikAkcji = WynikAkcji::KRYTYCZNA_PORAZKA
			else
				@wynikAkcji = WynikAkcji::SUKCES
			end
		elsif @los > 95
			@wynikAkcji = WynikAkcji::KRYTYCZNA_PORAZKA
		else
			@wynikAkcji = WynikAkcji::PORAZKA	
		end
	end
end
sleep 6
puts "A teraz stworzyliśmy teraz 'serce' każdej akcjii!"
sleep 8
system ('cls')
class Atak < Akcja
	attr_accessor :obrazenia
end
sleep 2
puts "Atak zrobiony!"
class Obrona < Akcja
end
sleep 1
puts "Obrona też!"
r1 = Robot.new("Fu'Fuja", 90, 30, 60, 20, 60)
r2 = RoboPtak.new(70,65)
r3 = Robot.new("O'Fifajka", 90, 30, 50, 90, 50)
r4 = Robot.new("O'Fibajka")
domyślne_roboty = ["#{r1}","#{r2}","#{r5}","#{r3}","#{r4}"]
roboty = []
stworzone_roboty = [domyślne_roboty, roboty]
puts "Gotowe! A oto twe roboty:
#{stworzone_roboty}."
sleep 8
puts "Fiuu! Praca zakończona."
while true
	puts "spójrz na linijkę zaczynającą się 'Gotowe!' i linijkę pod."
	sleep 2
	puts "czy chcesz dorobić robota(bądź roboty) do []?"
	sleep 5
	puts "czy wolisz 'powalczyć' robotami?
	napisz 1, jeśli chcesz dorobić robota, a jeśli nie, napisz nic(wtedy wyjdziesz z gry) lub poprostu napisz coś innego:"
	sleep 2
	c1 = gets.chomp
	sleep 29 / 2
	system ('cls')
	sleep1
	if c1 != 1
		if c1 == nil
			$najważniejsze = "break"
		else
			puts "i teraz nadszedł czas na..."
			sleep 3
			puts "na..."
			sleep 10
			system ('cls')
			puts "RoboWalkę LeR*!"
			sleep 7
			puts "* - treningową;)"
			sleep 10
			system ('cls')
			$najważniejsze = "Walka"
		end			
	else
		puts "dorobimy..."
		sleep 12
		puts "dorobimy robota dla walki LeR!!!"
		$najważniejsze = "dorobimy robocika!"
	end
end
