require 'json'
require 'tempfile'
class Robot
	def initialize(sila, zwinnosc)
		@dodatki = []
		@wynalazki = []
		@mądrość = rand(8908)
		@sila = sila #siła robota
		@zwinnosc = zwinnosc #zwinność
		puts "robot ma siłę: #{sila}, zwinność: #{zwinnosc}, a dodatki ma: #{@dodatki}."
	end	
	def initialize(sila,zdolność_ataku=10,zdolność_obrony=90, zwinnosc, dodatki, nazwa='Orro7')
		@dodatki = dodatki
		@zdolność_obrony = zdolność_obrony
		@zdolność_ataku = zdolność_ataku
		@sila = sila #siła robota
		@zwinnosc = zwinnosc #zwinność
		puts "robot ma siłę: #{sila}, zwinność: #{zwinnosc}, a dodatki ma: #{@dodatki}."
	end	
	def nazwa= (nowa_nazwa)
		@nazwa = nowa_nazwa
	end
	def nazwa
		@nazwa
	end
	def to_s
		"To jest robot r_#{object_id}.Jego sila to #{@sila} a zwinnosc to #{@zwinnosc} i ma dodatki: #{dodatki}.
		 ma nazwę: #{@nazwa}.
		 wynalazki: #{@wynalazki}.
		 mądrość: #{@mądrość}."
	end
	def sila= (nowa_sila)
		@sila = nowa_sila
	end
	def zwinnosc= (nowa_zwinnosc)
		@zwinnosc = nowa_zwinnosc
	end
	def sila	
		@sila
	end
	def zwinnosc
		@zwinnosc
	end
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
	def zdolność_obrony
		zdolność_obrony
	end
	def zdolność_obrony= (nowa_zdolność)
		@zdolność_obrony = nowa_zdolność
	end
	def zdolność_ataku= (zdolność_a)
		@zdolność_ataku = zdolność_a
	end
	def zdolność_ataku
		zdolność_ataku
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
	def what_json?
		save = save_json
		file = File.open(save, 'r')
		return file.read
		file.close
	end
end
class RoboPtak < Robot # przychodzi w poziomie II
	def initialize(skrzydła, nogi, nazwa,zdolność_ataku=10,zdolność_obrony=67)
		@dodatki = []
		@sila = 901000
		@zdolność_obrony = zdolność_obrony
		@zdolność_ataku = zdolność_ataku
		@skrzydła = skrzydła
		@nogi = nogi
		@nazwa = nazwa
	end
	def atak 
		silaw = rand(100)
		@sila = @sila - (silaw * 2)
		puts "brawo!! nasz #{@nazwa} grał z ptakiem z siłą #{silaw} wygrał nasz ptak #{@nazwa}!
		niestety, stracił siłę o #{silaw*2}.
		teraz ma #{@sila}."
	end
	def as_json(*options={})
		{
			siła: @sila,
            zwinnosc: @zwinnosc,
            dodatki: @dodatki,
            zdolność_ataku: @zdolność_ataku,
			nazwa: @nazwa,
			współna_siła: @@sila,
			zdolność_obrony: @zdolność_obrony,
			skrzydła: @skrzydła,
			nogi: @nogi
		}
	end
end
class Wynalazca < Robot # przychodzi w poziomie V
	@@wynalazki = 1000
	@@dodatki = {
			elektryczna_wiertarka: 1000,
			blacha: 900000,
			mózg_dla_robota: 6790,
			drewno: 8980
		}
	def initialize(zdolność_ataku=56,iśrubokrętów=45, igwoździ=56, imłotków=45, iśrubek=56, zdolność_obrony=89)
		@nazwa = ["Lucas3","Ullo60","Eltra#{[67,1,2,142,2,34,67,475,76].sample}","R#{[5,6,7,8,9,10,11,12,13,14,151,16,15,17,nil,18,19,20].sample}","Robo#{[34,23,456,345,645,465]}","#{["Los#{[7,89,68,567,56].sample}","R56","Niezwykły Wynalazca#{[3,4,5,6,71,2,3,1,4,5,6,7,8,9].sample}"].sample}","Lucas#{[90,900,1,2,3,4,5,7,6,7,8,nil].sample}","Lucas67","Eltra 34","Pierd1","R1","R2","R3",'R4',"Pierd#{1,2,3,4,5,6,7,8,9,10,45,1797,nil}","Ullo70","Ullo#{[30,300,3,12,78,74,85,24,56,34,5].sample}"].sample
		@iśrubek = iśrubek # ilość śrubek
		@imłotków = imłotków # ilość młotków
		@igwoździ = igwoździ # ilość gwóździ
		@zdolność_obrony = zdolność_obrony
		@iśrubokrętów = iśrubokrętów # ilość śrubokrętów
		@zwinnosc = [1,2,89,45,768,8990,565656,12, 89, 74555, 562].sample
		@zdolność_ataku = zdolność_ataku
		@sila = [nil, 0,34,67,nil,4,57,78, 10008320009900].sample
		@dodatki = {}
		@wynalazkir = []
	end
	def nowe_dodatki (dodatk={elektro_robot: 42, elektro_wojownik: 19})
		dodatk.each do |nazwa, zgarniano|
			zgarniano = zgarniano / 3
			@@dodatki.each do |no, yes|
				yes = yes - zgarniano
			end
		end
		@dodatki.merge (dodatk)
	end
	def as_json(*options={})
		{
			nazwa: @nazwa,
			dodatki: @dodatki,
			zwinnosc: @zwinnosc,
			siła: @sila,
			zdolność_obrony: @zdolność_obrony,
			ilość_śrubokrętów: @iśrubokrętów,
			ilość_młotków: @imłotków,
			ilość_gwoździ: @igwoździ,
			zdolność_ataku: @zdolność_ataku,
			ilość_śrub: @iśrubek,
			wspólne_dodatki: @@dodatki,
			wynalazki: @wynalazkir,
			ilość_jeszcze_wspólnych_wynalazków: @@wynalazki
		}
	end
	def wynalazek2
		puts "robot #{@nazwa} tworzy machinę..."
		gets.chomp
		wynalazek = ["robo-kot","robo-pies","robo-ninja","robo-smok","robo-miś do przytulania", "robo-łóżko","robo-urządzenie"].sample
		print "czy chcesz przyjąć od #{@nazwa} machinę: #{wynalazek}(wpisz tak, jeśli tak)?"
		t = gets.chomp
		if t == 'tak'
			@@wynalazki = @@wynalazki - 1
			@wynalazkir = @wynalazkir.unshift(wynalazek)
		end
	end
	def self.dodatki(nowe_dodatki_self={wiertarka: 9000})
		@@dodatki = @@dodatki.merge(nowe_dodatki_self)
	end
	def to_s
		"nazwa: #{@nazwa},
			dodatki: #{@dodatki},
			zwinnosc: #{@zwinnosc},
			siła: #{@sila},
			ilość śrubokrętów: #{@iśrubokrętów},
			ilość młotków: #{@imłotków},
			ilość gwoździ: #{@igwoździ},
			ilość śrub: #{@iśrubek},
			wspólne dodatki: #{@@dodatki},
			wynalazki: #{@wynalazkir},
			ilość jeszcze wspólnych wynalazków: #{@@wynalazki}"
			end
		end
		def as_json(*options={})
			{
			dodatki: @dodatki,
			zwinnosc: @zwinnosc,
			sila: @sila,
			ilość_śrubokrętów: @iśrubokrętów,
			ilość_młotków: @imłotków,
			ilość_gwoździ: @igwoździ,
			ilość_śrub: @iśrubek,
			wspólne_dodatki: @@dodatki,
			wynalazki: @wynalazkir,
			ilość_jeszcze_wspólnych_wynalazków: @@wynalazki
		}
	end
	def wynalazek
		puts "robot #{@nazwa} tworzy machinę..."
		gets.chomp
		wynalazek = ["robo-kot","robo-pies","robo-ninja","robo-smok","robo-miś do przytulania", "robo-łóżko","robo-urządzenie"].sample
		print "czy chcesz przyjąć od #{@nazwa} machinę: #{wynalazek}(wpisz tak, jeśli tak)?"
		t = gets.chomp
		if t == 'tak'
			@@wynalazki = @@wynalazki - 1
			@wynalazkir = @wynalazkir.unshift(wynalazek)
		end
	end
end
class Lekarz < Robot # przychodzi w poziomi X.
	@@punkty = 2947
	@@nieosobiste_dodatki = {
		robo_strzykawka: 78,
		"robo-słuchawka do słuchania pulsowania śrubek" => 6909
	}
	def initialize(zdolność_obrony=10000,zdolność_ataku=10,mądrość=[9,12,23,34,100,20,19,18,17,16,1000,167].sample)
		@mądrość = mądrość
		@zdolność_ataku = zdolność_ataku
		@zwinnosc = [45,34,45,163,66].sample
		@siła = [12,35,636,7685,454512].sample
		@dodatki = []
		@zdolność_obrony = zdolność_obrony
		@nazwa = ["Lucas50","Ullo60","Olli10","Robo40","Linno5","Etto30","Tikko20","Osa100"].sample
	end
	def self.co?
		puts "robot #{@nazwa} ma punkty: #{@@punkty},
		i ma dodatki: #{@@dodatki}"
	end
	def self.dd (new_dd={})
		if new_dd.class == Hash
			new_dd.each do |klucz, no_klucz|
				print "czy chcesz mieć w #{@@dodatki}: {#{klucz}: #{no_klucz}}?"
				tt = gets.chomp
				if tt == 'tak'
					@@nieosobiste_dodatki = @@nieosbiste_dodatki.merge({"#{klucz}" => no_klucz})
				end
			end
		else
			new_dd.each do |klucz|
				print "czy chcesz mieć w #{@@dodatki}: {#{klucz}: #{no_klucz}}?"
				tt = gets.chomp
				if tt == 'tak'
					@@nieosobiste_dodatki = @@nieosbiste_dodatki.merge({"#{klucz}" => no_klucz})
				end
			end
		end
	end
	def self.dodatki
		return @@nieosobiste_dodatki
	end
	def self.punkty
		return @@punkty
	end
	def as_json(*options={})
		{
			nazwa: @nazwa,
			siła: @siła,
			zdolność_ataku: @zdolność_ataku
			zwinność: @zwinnosc,
			dodatki: @dodatki,
			mądrość: @mądrość,
			ilość_wspólnych_dodatków: @@nieosobiste_dodatki,
			wspólne_punkty: @@punkty,
			zdolność_obrony: @zdolność_obrony
		}
	end
end
r1 = Robot.new(45,80,["ogienne rękawiczki"],"Orro7")
r2 = RoboPtak.new(70,65,"Ullo70")
r3 = Wynalazca.new(677,50,455,677)
r4 = Lekarz.new(666)
domyślne_roboty = ["#{r1}","#{r2}","#{r3}","#{r4}"]
def zapisz_roboty_w_(gdzie, *roboty)
	*roboty.each do |Robocik|
		print "czy nasz robot '#{Robocik}' ma być w pliku #{gdzie}(wpisz tak, jeżeli tak)?"
		tlubn = gets.chomp
		if tlubn == 'tak'
			puts "nasz robot '#{Robocik}' zostaje zapisywany..."
			file = File.open(gdzie, 'w')
			puts "dobra. otworzyliśmy plik."
			file.write("#{Robocik}")
			puts "OK.Robot został zapisywany."
			file.close
			puts "już gotowe."
		end
	end
end
def wyświetl_coś_w_(gdzie)
	file = File.open(gdzie, 'r')
	return file.read
	file.close
end
