module Wegetarian
	nie_jem = [:mięso, :wędliny, :ryby]
end
module Wegan
	nie_jem = ["Produkty odzwierzęce, np. nabiał, jogurt..."]
end
module Roślinożerca
	jem = ["jem prawie to co Wszystkożerca.", 'jem roślimy.', 'jestem pożywieniem mięsożerców.']
end
module Wszystkożerca
	def nie_jem
		nie_jem = ["Wszystko jem!"]
	end
end
module Mięsożerca
	jem = ["Jem tylko mięso."]
end
module PopularnyCzłowiek
	nie_jem = [:prawie_nic]
end
class Restauracja
	@@stół_wszystkożerców = {"dzik" => Time.now}
	@@stół_PCz = {:filozof => Time.now - (1000 * (199 * (1000 * 100)))}
	@@stół_Wegetarian = {:ja => Time.now}
	@@stół_Wegan = {}
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
	def stoły
		puts "#{@@Wszystkie_stoły}"
	end
	def zjedzmy(proponuję)
		puts "dla stołu #{@@stół_Roślinożerców} mam trawę+#{['herbatę Roibos', 'oranżadę z jagód', 'lemoniadę z truskawek', 'sok z borówek'].sample}.
		do stołu #{@@stół_PCz} mam #{["#{proponuję}",'kurczak i surówka+herbata Matcha gratis!', 'purre z ziemniaków i marchewki z dorszem i kawą.'].sample}
		dla stołu #{@@stół_mięsożerców} mam #{[:sarnę, :borsuka, :niedźwiedzia].sample}!
		do stołu #{@@stół_Wegan} mam #{["#{proponuję}", "#{proponuję} i lemoniadę", "#{proponuję}].sample} i #{["napój z róży", "jogurt z mleka migdałowego"].sample}"]}!
		dla stołu #{@@stół_wszystkożerców} mam #{["'pyszną' padlinkę łosia", "trawę+padlinę+herbatkę malinową"].sample} i pyszny dodatek: #{[:bezkręgowiec, "Ślimak", "gąbka prosto z morza!!"].sample}!
		do stołu #{@@Wszystkie_stoły} mam #{proponuję}.
		dla stółu #{@@stół_Wegetarian} mam #{["#{proponuję}", "#{proponuję}, ryż z cukinią i sałatkę owocową"].sample}+#{["sok z truskawki.", :sok, "kawa!", "Matcha!"].sample}"
	end
	def dodaj_do_stołów(imię)
		while true
			print "czy #{imię} je wszystko(jako zwierzę, nie człowiek)?"
			tak_lub_nie = gets.chomp
			if tak_lub_nie == 'tak'
				Wszystkożerca::nie_jem.each do |nie_jem|
					puts "#{imię} mówi 'nie jem #{nie_jem}'."
					sleep 1
				end
				@@stół_wszystkożerców = @@stół_wszystkożerców.merge ({"#{imię}" => Time.now})
				break
			else
				puts "#{imię} nie mówi 'nie jem #{nie_jem}'."
				sleep 2
			end
			print "czy #{imię} je jako człowiek wszystko, co się da?"
			tlubn = gets.chomp
			if tlubn == 'tak'
				PopularnyCzłowiek::nie_jem.each do |nie_jem|
					puts "'nie jem #{nie_jem}' - mówi #{imię}."
				end
			end
		end
	end
end
