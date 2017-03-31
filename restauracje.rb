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
	nie_jem = ["Wszystko jem!"]
end
module Mięsożerca
	jem = ["Jem tylko mięso."]
end
module PopularnyCzłowiek
	nie_jem = [:prawie_nic]
end
class Zjedzmy
	@@stół_wszystkożerców = {}
	@@stół_PCz = {}
	@@stół_Wegetarian = {:ja => Time.now}
	@@stół_Wegan = {}
	@@stół_Roślinożerców = {"Bambi" => Time.now - rand(3000)}
	@@stół_mięsożerców = {"Simba" => Time.now / 6}
	@@Wszystkie_stoły = [@@stół_Wegetarian, @@stół_PCz, @@stół_mięsożerców, @@stół_Roślinożerców, @@stół_Wegan, @@stół_wszystkożerców]
	def initialize(imię="Sztefi N.",typ_jedzenia=[:Wegetarianin, :Wegan, :PopularnyCzłowiek].sample)
		puts "cześć! możemy, dodać trochę osób do list:
		{}, {}, {}, {}, {}, {}, {}, lub od razu 'jeść'."
		@imię = imię
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
		puts "do stołu #{@@stół_Roślinożerców} mam trawę+#{['herbatę Roibos', 'oranżadę z jagód', 'lemoniadę z truskawek', 'sok z borówek'].sample}.
		do stołu #{@@stół_PCz} mam #{["#{proponuję}",'kurczak i surówka+herbata Matcha gratis!', 'purre z ziemniaków i marchewki z dorszem i kawą.'].sample}
		do stołu #{@@stół_Wegan} mam #{["#{proponuję}", "#{proponuję} i lemoniadę", "#{proponuję} i #{["napój z róży", "jogurt z mleka migdałowego"].sample}"]}!
		do stółu #{@@stół_Wegetarian} mam #{proponuję}!"
	end
	def dodaj_do_stołów(imię)
		print "czy #{imię} je wszystko?"
    #tu powinno być więcej
	end
end
