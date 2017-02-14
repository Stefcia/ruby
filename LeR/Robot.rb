require 'json'
require 'tempfile'
class Robot
	def initialize(sila, zwinnosc)
		@dodatki = []
		@sila = sila #siła robota
		@zwinnosc = zwinnosc #zwinność
		puts "robot ma siłę: #{sila}, zwinność: #{zwinnosc}, a dodatki ma: #{@dodatki}."
	end	
	def initialize(sila, zwinnosc, dodatki)
		@dodatki = dodatki
		@sila = sila #siła robota
		@zwinnosc = zwinnosc #zwinność
		puts "robot ma siłę: #{sila}, zwinność: #{zwinnosc}, a dodatki ma: #{@dodatki}."
	end	
	def to_s
		"To jest robot r_#{object_id}. Jego sila to #{@sila} a zwinnosc to #{@zwinnosc} i ma dodatki: #{dodatki}."
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
class RoboPtak < Robot # przychodzi w poziomie II
	def initialize(skrzydła, nogi, nazwa)
		@dodatki = []
		@sila = 901000
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
	def as_json(options={})
		{
			sila: @sila,
            zwinnosc: @zwinnosc,
            dodatki: @dodatki,
			nazwa: @nazwa,
			sila: @@sila,
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
	def initialize(iśrubokrętów, igwoździ, imłotków, iśrubek)
		@nazwa = ["Lukas3","Lucas67","Eltra 34","Pier1","R1","R2","R3",'R4'].sample
		@iśrubek = iśrubek # ilość śrubek
		@imłotków = imłotków # ilość młotków
		@igwoździ = igwoździ # ilość gwóździ
		@iśrubokrętów = iśrubokrętów # ilość śrubokrętów
		@zwinnosc = [1,2,89,45,768,8990,565656,12, 89, 74555, 562].sample
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
	def as_json(options={})
		{
			nazwa: @nazwa,
			dodatki: @dodatki,
			zwinnosc: @zwinnosc,
			siłaa: @sila,
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
