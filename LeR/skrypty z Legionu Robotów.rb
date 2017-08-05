require 'C:\Users\admin\Documents\ruby\LeR\Robot.rb'
require 'C:\Users\admin\Documents\ruby\LeR\Robowalka.rb'
r1 = Robot.new(:r4, 55, 10,10, 50, 25)
r2 = Robot.new("r#{[:s, "t", 5].object_id}", 77, 5,5, 40, 45)
r3 = Robot.new("r3", 100, 60, 40, 500, 500)
super_r = Robot.new("Eerno1",67, 19, 10, 55, 70)
bubu_robo = Robot.new("Eerno2",67, 6, 5, 50, 50)
dr = RoboPtak.new(3,4,"Gge67")
robo = Robot.new("Zżylla5", 79, 23, 9, 55, 60)
robo2 = RoboPtak.new(400, 600,"Bird-Eerno#{rand(6000)+rand(490)-(rand(300)*rand(10))+5} fly..",679, 609, 55, 700, 800)
średni_r = Robot.new("Robo średniak.R#{rand(100)}", 50, 10, 7, 35, 50)
fu = Robot.new("Marko Fu #{rand(100)+rand(399)-(rand(10)+1)}}",70, 90, 50, 60, 40)
sullivan = Robot.new("O'Sullivan 6", 70, 80, 90, 50, 100)
allen = RoboPtak.new(50, 60, "Mark Allen#{rand(500)-rand(4)+10}", 70, 50, 90, 40, 60)
day = RoboPtak.new(30, 70, "Day90", 80, 50, 50, 70, 50)
super_robo = Robot.new("Eerno3000", 99, 80, 70, 80, 60)
nr = Robot.new("New Robo", 99, 40, 60, 50, 90)
nrp = RoboPtak.new(3, 1, "The New Robot-Bird", 40, 99, 60, 50, 92)
tajemniczy_hood = Robot.new("Tajemniczy ktoś-hood(Robin Hood)", 999, 99, 99, 150, 60, "Łuk")
robo_R = Robot.new("Ryszard8950", 899, 89, 89, 50, 59)
marianna = Robot.new("Marianna, żona #{tajemniczy_hood.to_s}", 998, 98, 98, 151, 68, "Łuk", "Miecz")
robo_E = Robot.new("Edaward88, brat #{robo_R.to_s}", 888, 88, 87, 60, 40)
final1 = [
	[nrp, robo_E],
	[marianna, r2],
	[super_robo, robo2],
	[allen,robo_R],
	[średni_r, fu],
	[dr , sullivan],
	[super_r , nr],
	[bubu_robo , r3],
	[day , robo],
	[r1, tajemniczy_hood]
]
final2 = [
	RoboWalka.new(robo_E, r3),
	RoboWalka.new(robo, fu),
	RoboWalka.new(super_r, super_robo),
	RoboWalka.new(allen, tajemniczy_hood),
	[marianna, sullivan],
	RoboWalka.new(day, średni_r),
	RoboWalka.new(dr, r2),
	RoboWalka.new(r1, bubu_robo),
	RoboWalka.new(robo2, nr),
	[nrp, robo_R]
]

final3 = [
	RoboWalka.new(fu, marianna),
	RoboWalka.new(day, bubu_robo),
	RoboWalka.new(nr, robo_E),
	[sullivan, tajemniczy_hood],
	[dr, nrp],
	[robo_R, super_robo],
	RoboWalka.new(robo2, robo),
	[r1, r3],
	[allen, r2],
	[fu, średni_r]
]

def grajmy(lista)
	lista.each do |elementTablicy|
		if elementTablicy.class == Array
			w1 = RoboWalka.new(elementTablicy.first, elementTablicy.last)
			w1.walczmy
		elsif elementTablicy.class == RoboWalka
			elementTablicy.walczmy
		end
		print "CZY CHCESZ ZOBACZYĆ RoboWALKĘ JESZCZE RAZ(inną)?"
		tln = gets.chomp
		if tln == 'tak'
			sleep 1
			system ('cls')
		else
			break
		end
	end
end
