class Sejfy
	def initialize(do_utworzenia)
		@zrobione_sejfy_prezentowe = []
		(-100..do_utworzenia).each do |numerek|
			nazwa_prezentu = "sejf_#{numerek}.txt"
			zrobione_sejfy_prezentowe << nazwa_prezentu
			file = File.open(nazwa_prezentu, 'w+')
			file.write("niezwykły sejf załadunkowy nr #{numerek} o nazwie #{nazwa_prezentu} rozdaje #{[4,6,7,9,45,10000,34,1,2,3,5,8,10,100,1000,600].sample} prezentów!")
			file.close
			puts "..."
			sleep 1
		end
		@zrobione_sejfy_prezentowe
	end
	def otwórz_niezwykłe_sejfy
		@zrobione_sejfy_prezentowe.each do |sejf|
			file = File.open(sejf, 'r')
			puts file.read
			file.close
			gets.chomp
		end
	end
	def zapisz_w_sejfach_coś_innego? 
		@zrobione_sejfy_prezentowe.each do |sejf_bez_coś_innego|
			file = File.open(sejf_bez_coś_innego, "w")
			file.write("sejf #{sejf_bez_coś_innego} zmienia swą treść na #{coś_innego}!!")
			file.close
		end
	end
	def zapisz? 
		@zrobione_sejfy_prezentowe.each do |sejf|
			if jaki_sejf.include? (sejf)
				file = File.open(sejf, "w")
				file.write("sejf #{sejf} zmienia swoją treść na #{co} i jest z dodatkowym prezentem:
				#{["piękny domek Belli!", "zamek Gisneya!!","domek z piernika i cytrynowego lukru."].sample}")
				file.close
			else
				puts "nie chcesz w #{sejf} mieć #{co}?
				nie?"
				gets.chomp
			end
		end
		wszystkie_sejfy
	end
end
