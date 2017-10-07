# Do zrobienia:
# robo.wykonajKrytycznyAtak(roboBroniacy, atak.los)
# robo.wykonajAtak
# robo.zycie

class RoboWalka

	#attr_accessor :roboWyzywajacy, :roboAkceptujacy 
	attr_reader :roboWyzywajacy, :roboAkceptujacy, :początekWalki, :koniecWalki, :roboZwyciezca, :roboPrzegrany

	def initialize(robo1, robo2)
		@roboWyzywajacy = robo1
		@roboAkceptujacy = robo2
		#stRoboWyzywajacy{ :Robot }
		@początekWalki = Time.now
		@stRoboWyzywajacy = {
			:Robot => robo1,
			krytyczneAtaki: 0,
			krytyczneObrony: 0,
			udaneAtaki: 0,
			udaneObrony: 0,
			nieudaneObrony: 0,
			nieudaneAtaki: 0,
			:najlepszyAtak => {
				obrażenia: 0, 
				runda: 0, 
				:rodzaj => nil}, 
			:najgorszyAtak => {
				obrażenia: 0, 
				runda: 0, 
				:rodzaj => nil},
			:najlepszaObrona => {
				runda: 0,
				:rodzaj => nil},
			:najgorszaObrona => {
			dostał: 0, 
			:rodzaj => nil},
			:Aktualizacja => Time.now,
			:ZakonczenieJegoWalki => nil
		}
		sleep 0.23
		@stRoboAkceptujacy = {
			:Robot => robo1,
			krytyczneAtaki: 0,
			krytyczneObrony: 0,
			udaneAtaki: 0,
			udaneObrony: 0,
			nieudaneObrony: 0,
			nieudaneAtaki: 0,
			:najlepszyAtak => {
				obrażenia: 0, 
				runda: 0, 
				:rodzaj => nil}, 
			:najgorszyAtak => {
				obrażenia: 0, 
				runda: 0, 
				:rodzaj => nil},
			:najlepszaObrona => {
				runda: 0,
				:rodzaj => nil},
			:najgorszaObrona => {
			dostał: 0, 
			:rodzaj => nil},
			:Aktualizacja => Time.now,
			:ZakonczenieJegoWalki => nil
		}
		@statystyczki = {robo1 => stRoboWyzywajacy, robo2 => stRoboAkceptujacy}
	end
	
	def obrona(roboBroniacy, roboAtakujacy)
		obrona = Obrona.new(roboBroniacy.zdolnoscObrony)
		puts "#{roboBroniacy} zwiera wszystkie śrubki do obrony..."
		sleep 2
		puts "...#{obrona.los}..."
		sleep 1
		case obrona.wynikAkcji 
			when WynikAkcji::KRYTYCZNY_SUKCES 
				puts "OBRONA KRYTYCZNA! #{roboBroniacy} broni się jak robo-mistrz! Nie tylko odpiera atak, ale sam atakuje... #{roboAtakujacy} jest tak zaskoczony, że aż zaiskrzyły mu obwody i nie jest w stanie nic zrobić!" 
				sleep 1
				st = @statystyczki[roboBroniacy]
				st[:udaneObrony] = st[:udaneObrony] + 1
				st[:krytyczneObrony] = st[:krytyczneObrony] + 1
				roboBroniacy.wykonajAtak(roboAtakujacy, Atak.new(roboAtakujacy.zdolnoscAtaku, rand(5)+1))
			when WynikAkcji::SUKCES
				puts "UDANA OBRONA! #{roboBroniacy} skutecznie się broni."
				st = @statystyczki[roboBroniacy]
				st[:udaneObrony] = st[:udaneObrony] + 1 
				sleep 1
			when WynikAkcji::PORAZKA
				puts "#{roboBroniacy} nie jest w stanie się obronić..."
				sleep 1
			when WynikAkcji::KRYTYCZNA_PORAZKA
				puts "KRYTYCZNIE ZŁA OBRONA! #{roboBroniacy} upada na własną antenkę podczas próby odparcia ataku. Bardzo źle... to mocno ułatwi sprawę przeciwnikowi."
				sleep 1
			else
				puts "Dzieje się coś dziwnego: {#atak.wynikAkcji}"
		end
		return obrona
		
	end
	
	def atak(roboAtakujacy, roboBroniacy)
		atak = Atak.new(roboAtakujacy.zdolnoscAtaku)
		puts "#{roboAtakujacy} atakuje ile sił w bateryjce..."
		sleep 1
		puts "..."
		sleep 1
		puts "#...#{atak.los}..."
		sleep 1
		case atak.wynikAkcji 
			when WynikAkcji::KRYTYCZNY_SUKCES 
				puts "ATAK KRYTYCZNY! #{roboBroniacy} nie jest w stanie się bronić..." 
				sleep 1
				roboAtakujacy.wykonajAtak(roboBroniacy, atak)
			when WynikAkcji::SUKCES
				puts "UDANY ATAK... ale #{roboBroniacy} przystępuje do obrony..."
				sleep 1
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
					sleep 1
				else
					puts "!!!ATAK KRYTYCZNY!!! #{roboAtakujacy} #{rodzaj}.Nic bardzo złego, ale nie jest dobrze."
					sleep 1
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
				@stRoboWyzywajacy[:ZakonczenieJegoWalki] = Time.now			
			else
				@roboZwyciezca = @roboWyzywajacy
				@roboPrzegrany = @roboAkceptujacy
				@stRoboAkceptujacy[:ZakonczenieJegoWalki] = Time.now
			end
			@koniecWalki = Time.now
			puts "Koniec walki! Wygrany: #{roboZwyciezca} - przegrany: #{roboPrzegrany}, którego koledzy zbierają jeszcze jego śrubki z areny..."
			puts "PODSUMOWANIE: #{roboZwyciezca} zadał ... obrażeń, odniósł ... obrażeń. Najlepszy cios: ... obrażeń. KRYTYCZNE SUKCESY: ... w ataku i ... w obronie. KRYTYCZNE PORAŻKI: ... w ataku i ... w obronie.  "
		end
		return koniec
	end
	
	
	def walczmy
		akcjaWalki = 1
		sleep 1
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

module WynikAkcji
	KRYTYCZNY_SUKCES = 2
	SUKCES = 1
	KRYTYCZNA_PORAZKA = -2
	PORAZKA = -1
end

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

class Atak < Akcja
	attr_accessor :obrazenia
end

class Obrona < Akcja

end
