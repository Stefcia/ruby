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
				L1 = [:A, :B, :C, :D,"Ń", :E, :F, :G, :joker, "Ę"].sample
				L2 = [:Z, :E, :joker, :R, :R,"Ą", :A,:N, :E, :D].sample
				L3 = [:I, :O, :T, :joker, :E, :L, :O,:M, :O, :A, :S, :I].sample
				L4 = [:N, "Ś", :L, "Ł", :H, :K, :joker, :N, :M].sample
				L5 = [:K, :J, :F, :V, "Ó", :W, :P, :Z, :M, :N].sample
				L6 = [:R, :N, "Ó", "Ł", :O, "Ą", :joker, "Ę", "Ó"].sample
				L7 = ["Ą", "Ę", :E :joker].sample
				sleep 6
				$punkty = $punkty * rand(1000000000)
				LITERY = [L1, L7, L3, L2, L5, L4, L6]
			when (0..2)
				L1 = [:A, :B, :C, :D, :E, :F, :G, "Ę"].sample
				L2 = [:Z, :E, :joker, :R, :R,"Ą", :A,:N, :E, :D].sample
				L3 = [:I, :O, :T, :joker, :E, :L, :O,:M, :O, :A, :S, :I].sample
				L4 = [:N, "Ś", :L, "Ł", :H, :K, :N, :M].sample
				L5 = [:K, :J, :F, :V, "Ó", :W, :P, :Z, :M, :N].sample
				L6 = [:R, :N, "Ó", "Ł", :O, "Ą"].sample
				L7 = ["Ą", "Ę", :E].sample
				sleep 6
				$punkty = $punkty + rand(800)
				LITERY = [L1, L7, L3, L2, L5, L4, L6]
			when (4..10)
				L1 = [:A, :B, :C, :D, :E, :F, :G, "Ę", :U].sample
				L2 = [:Z, :E, :joker, :R, :R,"Ą", :A,:N, :E, :D, "Ó"].sample
				L3 = [:I, :O, :T, :N, :E, :L, :O, :M, :O, :A, :S, :I].sample
				L4 = [:N, "Ś", :L, "Ł", :H, :K, :N, :H].sample
				L5 = [:K, :J, :F, :V, "Ó", :W, :P, :Z, :M, :N].sample
				L6 = [:R, "Ó", "Ł", "Ą", :E].sample
				L7 = ["Ą", "Ę", :E].sample
				sleep 2
				$punkty = $punkty - 5
				LITERY = [L1, L2, L3, L4, L5, L6, L7]
			when (10...30)
				L1 = [:A, :B, :C, :D, :E, :F, :G, "Ę", :U].sample
				L2 = [:Z, :E, :joker, :R, :R,"Ą", :A,:N, :E, :D, "Ó"].sample
				L3 = [:I, :O, :T, :N, :E, :L, :O, :M, :O, :A, :S, :I].sample
				L4 = [:N, "Ś", :L, "Ł", :H, :K, :N, :H].sample
				L5 = [:K, :J, :F, :V, "Ó", :W, :P, :Z, :M, :N].sample
				L6 = [:R, "Ó", "Ł", "Ą", :E, :W, :P, :B, :T, :S, :D, :P, :W, :O, :R, :joker].sample
				L7 = ["Ł", :O, :L, :Y, :T, "Ą", :R, :E, :I, :O, "Ó", :K, "Ę", :E, :joker].sample
				sleep 3/6
				$punkty = $punkty * 2
				LITERY = [L1, L2, L3, L4, L6, L7, L5]
			when 100
				L1 = [:A, :N, :C, :D, :E, :F, :Z, "Ę", :U].sample
				L2 = [:Z, :E, :joker, :R, :R,"Ą", :A,:N, :E, :D, "Ó"].sample
				L3 = [:I, :O, :T, :N, :E, :L, :O, :Z, :O, :A, :S, :I].sample
				L4 = [:N, "Ś", :L, "Ł", :H, :K, :N, :H].sample
				L5 = [:M, :P, :F, :V, "Ę", :O, :I, :Z, :M, :N].sample
				L6 = [:O, "Ó", "Ł", "Ą", :E, :W, :P, :B, :T, :S, :D, :P, :W, :O, :R, :joker].sample
				L7 = ["Ó", :O, :L, :Y, :T, "Ą", :R, :E, :I, :O, "Ó", :K, "Ę", :E, :joker].sample
				sleep 6/7
				LITERY = [L1, L2, L3, L4, L6, L5, L7]
			else
				if $cos < 100
					L1 = [:A, :N, :W, :C, :D, :E, :F, :Z, "Ę", :U].sample
					L2 = [:Z, :E, :joker, :R, :R, "Ą", :A,:N, :E, :D, "Ó"].sample
					L3 = [:I, :O, :T, :N, :E, :L, :O, :Z, :O, :A, :S, :I].sample
					L4 = [:N, "Ś", :L, "Ł", :H, :K, :N, :H].sample
					L5 = [:M, :P, :F, :V, "Ę", :O, :I, :Z, :M, :N].sample
					L6 = [:O, "Ó", "Ł", "Ą", :E, :W, :P, :B, :T, :S, :D, :P, :W, :O, :R, :joker].sample
					L7 = ["Ó", :O, :L, :Y, :T, "Ą", :R, :E, :I, :O, "Ó", :K, "Ę", :E, :joker].sample
					sleep 6/7
					LITERY = [L1, L2, L3, L4, L6, L5, L7]
				else
					if $cos > 101
						L1 = [:A, :B, :C, :D, :E, :F, :G, "Ę"].sample
						L2 = [:Z, :E, :joker, :R, :R,"Ą", :A,:N, :E, :D].sample
						L3 = [:I, :O, :T, :joker, :E, :L, :O,:M, :O, :A, :S, :I].sample
						L4 = [:N, "Ś", :L, "Ł", :H, :K, :joker, :N, :M].sample
						L5 = [:K, :J, :F, :V, "Ó", :W, :P, :Z, :M, :N].sample
						L6 = [:R, :N, "Ó", "Ł", :O, "Ą", :joker, "Ę", "Ó"].sample
						L7 = ["Ą", "Ę", :E :joker].sample
						sleep 3
						$punkty = $punkty + 1
						LITERY = [L1, L7, L3, L2, L5, L4, L6]
					else
						L1 = [:A,:joker, :B, :C, :D, :E, :joker, :F, :G, "Ę"].sample
						L2 = [:Z, :E, :joker, :R, :R,"Ą", :A,:N, :E, :D].sample
						L3 = [:I, :O, :T, :joker, :E, :L, :O,:M, :O, :A, :S, :I].sample
						L4 = [:N, "Ś", :L, "Ł", :H, :K, :joker, :N, :M].sample
						L5 = [:K, :J, :F, :V, "Ó", :W, :P, :Z, :M, :N].sample
						L6 = [:R, :N, "Ó", "Ł", :O, "Ą", :joker, "Ę", "Ó"].sample
						L7 = ["Ą", "Ę", :E :joker].sample
						sleep 3
						$punkty = $punkty + 1
						LITERY = [L3, L6, L1, L5, L2, L7, L4]
					end
				end
			end
			puts "masz takie litery: #{LITERY}."
		end
	end
end
