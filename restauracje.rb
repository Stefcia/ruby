module Wegetarian
	NIE_JEM = [:mięsa, :wędlin, :ryb]
end
module Wegan
	NIE_JEM = ["Produkty odzwierzęce, np. nabiał, jogurt..."]
end
module Roślinożerca
	JEM = ["jem prawie to co Wszystkożerca.", 'jem roślimy.', 'jestem pożywieniem mięsożerców.']
end
module Wszystkożerca
		NIE_JEM = ["Wszystko jem!"]
end
module Mięsożerca
	JEM = ["Jem tylko mięso."]
end
module PopularnyCzłowiek
	NIE_JEM = [:prawie_nic]
end
class Restauracja
	@@stół_wszystkożerców = {"dzik" => Time.now + 1}
	@@stół_PCz = {:filozof => Time.now - (1000 * (199 * (1000 * 100)))}
	@@stół_Wegetarian = {:ja => Time.now}
	@@stół_Wegan = {:filozof2 => Time.now - (200 * (1000 * (100 * 1000)))}
	@@stół_Roślinożerców = {"Bambi" => Time.now + rand(30)}
	@@stół_mięsożerców = {"Simba" => Time.now + 6}
	@@Wszystkie_stoły = [@@stół_Wegetarian, @@stół_PCz, @@stół_mięsożerców, @@stół_Roślinożerców, @@stół_Wegan, @@stół_wszystkożerców]
	def initialize(nazwa_restauracji="pod starym rakiem",imię="Sztefi N.",typ_jedzenia=[:Wegetarianin, :Wegan, :PopularnyCzłowiek].sample)
		puts "cześć! możemy, dodać trochę osób do tych pustych stołow:
		{}, {}, {}, {}, {}, {}, {}, lub od razu smakować najlepsze dania restauracjii #{nazwa_restauracji}."
		@imię = imię
		@nazwa_restauracji = nazwa_restauracji
		case typ_jedzenia
		when :Wegan
			sleep 1
			puts "Świetnie! znam Twój tryb jedzenia!"
			@@stół_Wegan = @@stół_Wegan.merge ({"#{imię}" => Time.now})
		when :Wegetarianin
			sleep 1
			puts "Super! Ja też Jestem Wegetarianinem."
			@@stół_Wegetarian = @@stół_Wegetarian.merge ({"#{imię}" => Time.now})
		when :PopularnyCzłowiek
			sleep 1
			puts "'ludziu popularny'!"
			@@stół_PCz = @@stół_PCz.merge ({"#{imię}" => Time.now})
		else
			puts "#{typ_jedzenia}? taki nie znam."
			@@Wszystkie_stoły = @@Wszystkie_stoły.push
		end
	end
	def self.stoły
		puts "#{@@Wszystkie_stoły}"
	end
	def zjedzmy(proponuję)
		puts "dla stołu #{@@stół_Roślinożerców} mam trawę+#{['herbatę Roibos', 'oranżadę z jagód', 'lemoniadę z truskawek', 'sok z borówek'].sample}.
		do stołu #{@@stół_PCz} mam #{["#{proponuję}",'kurczak i surówka+herbata Matcha gratis!', 'purre z ziemniaków i marchewki z dorszem i kawą.'].sample}
		dla stołu #{@@stół_mięsożerców} mam #{[:sarnę, :borsuka, :niedźwiedzia].sample}!
		do stołu #{@@stół_Wegan} mam #{["#{proponuję}", "#{proponuję} i lemoniadę", "#{proponuję}].sample} i #{["napój z róży", "jogurt z mleka migdałowego"].sample}"]}!
		dla stołu #{@@stół_wszystkożerców} mam #{["'pyszną' padlinkę łosia","", "trawę+padlinę+herbatkę malinową"].sample} i pyszny dodatek: #{[:bezkręgowiec, "Ślimak", "gąbka prosto z morza!!"].sample}!
		do stołu #{@@Wszystkie_stoły} mam #{proponuję}.
		dla stołu #{@@stół_Wegetarian} mam #{["#{proponuję}", "#{proponuję}, ryż z cukinią i sałatkę owocową"].sample}+#{["sok z truskawki.", :sok, "kawa!", "Matcha!"].sample}"
	end
	def self.dodaj_do_stołów(imię)
		while true
			print "czy #{imię} je wszystko(jako zwierzę, nie człowiek)?"
			tak_lub_nie = gets.chomp
			if tak_lub_nie == 'tak'
				Wszystkożerca::NIE_JEM.each do |nie_jem|
					puts "#{imię} mówi 'nie jem #{nie_jem}'."
					sleep 1
				end
				@@stół_wszystkożerców = @@stół_wszystkożerców.merge ({"#{imię}" => Time.now})
				break
			else
				sleep 2
			end
			print "czy #{imię} je jako człowiek wszystko, co się da?"
			tlubn = gets.chomp
			if tlubn == 'tak'
				PopularnyCzłowiek::NIE_JEM.each do |nie_jem|
					puts "'nie jem #{nie_jem}' - mówi #{imię}."
				end
				@@stoł_PCz = @@stoł_PCz.merge({"#{imię}" => Time.now + (1000 * (1000 * (100 * 4)))})
				sleep 1
				break
			end
			sleep 3
			print "czy #{imię} jest człowiekiem, który nie je: ryb, wędlin oraz innego mięsa(ale je jogurt, itp.)???"
			t_lub_n = gets.chomp
			sleep 2
			if t_lub_n == 'tak'
				Wegetarian::NIE_JEM.each do |nie_jem|
					puts " - Nie jem #{nie_jem} - mówi #{imię}."
				end
				@@stół_Wegetarian = @@stół_Wegetarian.merge({"#{imię}" => Time.now - ((100 - -4) + (0 - 5))})
				break
			end
			print "czy #{imię} je roślinki?"
			tak_lub_n = gets.chomp
			if tak_lub_n == 'tak'
				Roślinożerca::JEM.each do |jem|
					puts " - Jem #{jem}. - mówi #{imię}."
					sleep 3 / 2
				end
				@@stół_Roślinożerców = @@stół_Roślinożerców.merge({"#{imię}" => Time.now - (rand(2000) + 101)})
				break
			end
			puts "czy #{imię} jast człowiekiem i nie je: mięsa, jogurtów, mleka, jaj i innych produktów odzwierzęcych? "
			t_lub_nie = gets.chomp
			if t_lub_nie == 'tak'
				Wegan::NIE_JEM.each do |nie_jem|
					puts "Uff... '#{nie_jem} - tego nie jem!' - krzyczy #{imię}."
				end
				@@stół_Wegan = @@stół_Wegan.merge({"#{imię}" => Time.now - -23577870099})
				break
			end
		end
	end
end
