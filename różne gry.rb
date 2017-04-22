$cos = 0
$punkty = 10
puts "Witamy w świecie gier!"
sleep 4
system ('cls')
while true
	print "Wybierz jedną z tych gier: Restauracje albo scrabble lub skorzystaj z funkcjii:
	pomoc, los: "
	decyzja = gets.chomp
	case decyzja
	when "los"
	los = []
	when "scrabble"
		#mam taki plan:
		#1. kompter wybiera 7 liter.
		#2. gracz wypisuje słowo z literami PO PRZECINKU.
		#3. funkcja split.
		#4. punkty odejmowane i dodawane.
		# ...
		# ostatnie działanie. komputer zapisuje liczbę puktów($punkty) i coś($cos) w wybranym przez gracza pliku(tata musi pomóc!).
		while true
			$cos = $cos +1
			case $cos
			when 13
				l1 = [:A, :B, :C, :D,"Ń", :E, :F, :G, :joker, "Ę"].sample
				l2 = [:Z, :E, :joker, :R, :R,"Ą", :A,:N, :E, :D].sample
				l3 = [:I, :O, :T, :joker, :E, :L, :O,:M, :O, :A, :S, :I].sample
				l4 = [:N, "Ś", :L, "Ł", :H, :K, :joker, :N, :M].sample
				l5 = [:K, :J, :F, :V, "Ó", :W, :P, :Z, :M, :N].sample
				l6 = [:R, :N, "Ó", "Ł", :O, "Ą", :joker, "Ę", "Ó"].sample
				l7 = ["Ą", "Ę", :E :joker].sample
				sleep 6
				$punkty = $punkty * rand(1000000000)
				litery = [l1, l7, l3, l2, l5, l4, l6]
			when (0..2)
				l1 = [:A, :B, :C, :D, :E, :F, :G, "Ę"].sample
				l2 = [:Z, :E, :joker, :R, :R,"Ą", :A,:N, :E, :D].sample
				l3 = [:I, :O, :T, :joker, :E, :L, :O,:M, :O, :A, :S, :I].sample
				l4 = [:N, "Ś", :L, "Ł", :H, :K, :N, :M].sample
				l5 = [:K, :J, :F, :V, "Ó", :W, :P, :Z, :M, :N].sample
				l6 = [:R, :N, "Ó", "Ł", :O, "Ą"].sample
				l7 = ["Ą", "Ę", :E].sample
				sleep 6
				$punkty = $punkty + rand(800)
				litery = [l1, L7, L3, l2, L5, l4, L6]
			when (4..10)
				l1 = [:A, :B, :C, :D, :E, :F, :G, "Ę", :U].sample
				l2 = [:Z, :E, :joker, :R, :R,"Ą", :A,:N, :E, :D, "Ó"].sample
				l3 = [:I, :O, :T, :N, :E, :L, :O, :M, :O, :A, :S, :I].sample
				l4 = [:N, "Ś", :L, "Ł", :H, :K, :N, :H].sample
				l5 = [:K, :J, :F, :V, "Ó", :W, :P, :Z, :M, :N].sample
				l6 = [:R, "Ó", "Ł", "Ą", :E].sample
				l7 = ["Ą", "Ę", :E].sample
				sleep 2
				$punkty = $punkty - 5
				litery = [l1, l2, L3, l4, L5, L6, L7]
			when (10...30)
				l1 = [:A, :B, :C, :D, :E, :F, :G, "Ę", :U].sample
				l2 = [:Z, :E, :joker, :R, :R,"Ą", :A,:N, :E, :D, "Ó"].sample
				l3 = [:I, :O, :T, :N, :E, :L, :O, :M, :O, :A, :S, :I].sample
				l4 = [:N, "Ś", :L, "Ł", :H, :K, :N, :H].sample
				l5 = [:K, :J, :F, :V, "Ó", :W, :P, :Z, :M, :N].sample
				l6 = [:R, "Ó", "Ł", "Ą", :E, :W, :P, :B, :T, :S, :D, :P, :W, :O, :R, :joker].sample
				l7 = ["Ł", :O, :L, :Y, :T, "Ą", :R, :E, :I, :O, "Ó", :K, "Ę", :E, :joker].sample
				sleep 3/6
				$punkty = $punkty * 2
				litery = [l1, l2, L3, l4, L6, L7, L5]
			when 100
				l1 = [:A, :N, :C, :D, :E, :F, :Z, "Ę", :U].sample
				l2 = [:Z, :E, :joker, :R, :R,"Ą", :A,:N, :E, :D, "Ó"].sample
				l3 = [:I, :O, :T, :N, :E, :L, :O, :Z, :O, :A, :S, :I].sample
				l4 = [:N, "Ś", :L, "Ł", :H, :K, :N, :H].sample
				l5 = [:M, :P, :F, :V, "Ę", :O, :I, :Z, :M, :N].sample
				l6 = [:O, "Ó", "Ł", "Ą", :E, :W, :P, :B, :T, :S, :D, :P, :W, :O, :R, :joker].sample
				l7 = ["Ó", :O, :L, :Y, :T, "Ą", :R, :E, :I, :O, "Ó", :K, "Ę", :E, :joker].sample
				sleep 6/7
				litery = [l1, l2, L3, l4, L6, L5, L7]
			else
				if $cos < 100
					l1 = [:A, :N, :W, :C, :D, :E, :F, :Z, "Ę", :U].sample
					l2 = [:Z, :E, :joker, :R, :R, "Ą", :A,:N, :E, :D, "Ó"].sample
					l3 = [:I, :O, :T, :N, :E, :L, :O, :Z, :O, :A, :S, :I].sample
					l4 = [:N, "Ś", :L, "Ł", :H, :K, :N, :H].sample
					l5 = [:M, :P, :F, :V, "Ę", :O, :I, :Z, :M, :N].sample
					l6 = [:O, "Ó", "Ł", "Ą", :E, :W, :P, :B, :T, :S, :D, :P, :W, :O, :R, :joker].sample
					l7 = ["Ó", :O, :L, :Y, :T, "Ą", :R, :E, :I, :O, "Ó", :K, "Ę", :E, :joker].sample
					sleep 6/7
					litery = [l1, l2, L3, l4, L6, L5, L7]
				else
					if $cos > 101
						l1 = [:A, :B, :C, :D, :E, :F, :G, "Ę"].sample
						l2 = [:Z, :E, :joker, :R, :R,"Ą", :A,:N, :E, :D].sample
						l3 = [:I, :O, :T, :joker, :E, :L, :O,:M, :O, :A, :S, :I].sample
						l4 = [:N, "Ś", :L, "Ł", :H, :K, :joker, :N, :M].sample
						l5 = [:K, :J, :F, :V, "Ó", :W, :P, :Z, :M, :N].sample
						l6 = [:R, :N, "Ó", "Ł", :O, "Ą", :joker, "Ę", "Ó"].sample
						l7 = ["Ą", "Ę", :E :joker].sample
						sleep 3
						$punkty = $punkty + 1
						litery = [l1, L7, L3, l2, L5, l4, L6]
					else
						l1 = [:A,:joker, :B, :C, :D, :E, :joker, :F, :G, "Ę"].sample
						l2 = [:Z, :E, :joker, :R, :R,"Ą", :A,:N, :E, :D].sample
						l3 = [:I, :O, :T, :joker, :E, :L, :O,:M, :O, :A, :S, :I].sample
						l4 = [:N, "Ś", :L, "Ł", :H, :K, :joker, :N, :M].sample
						l5 = [:K, :J, :F, :V, "Ó", :W, :P, :Z, :M, :N].sample
						l6 = [:R, :N, "Ó", "Ł", :O, "Ą", :joker, "Ę", "Ó"].sample
						l7 = ["Ą", "Ę", :E :joker, :joker, :A, :S, :N, :M, :T, :Y].sample
						sleep 3
						$punkty = $punkty + 1
						litery = [l3, l6, l1, l5, l2, l7, l4]
					end
				end
			end
			litery.each do |litera|
				puts "masz literę: #{litera}."
				sleep 1
			end
			sleep 10
			system ('cls')
		end
	end
end
