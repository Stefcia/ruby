require 'C:\Users\admin\Documents\ruby\LeR\Robot.rb'
require 'C:\Users\admin\Documents\ruby\LeR\Robowalka.rb'
r1 = Robot.new(:r4, 55, 10,10, 50, 25)
r2 = Robot.new("r#{[:s, "t", 5].object_id}", 77, 5,5, 40, 45)
super_r = Robot.new("Eerno1",67, 19, 10, 55, 70)
bubu_robo = Robot.new("Eerno2",67, 6, 5, 50, 50)
dr = RoboPtak.new(3,4,"Gge67")
robo = Robot.new("Zżylla5", 79, 23, 9, 55, 60)
średni_r = Robot.new("Robo średniak.R#{rand(100)}", 50, 10, 7, 35, 50)
fu = Robot.new("Marko Fu #{rand(100)+rand(399)-(rand(10)+1)}}",70, 90, 50, 60, 40)
sullivan = Robot.new("O'Sullivan 6", 70, 80, 90, 50, 100)
allen = RoboPtak.new(50, 60, "Mark Allen#{rand(500)-rand(4)+10}", 70, 50, 90, 40, 60)
day = RoboPtak.new(30, 70, "Day90", 80, 50, 50, 70, 50)
super_robo = Robot.new("Eerno3000", 99, 80, 70, 80, 60)
final1 = [
	[allen,r1],
	[średni_r, fu],
	[dr , sullivan],
	[super_r , r2],
	[bubu_robo , super_robo],
	[day , robo]
]
final2 = [
	RoboWalka.new(robo, fu),
	RoboWalka.new(super_r, super_robo),
	RoboWalka.new(allen, sullivan),
	RoboWalka.new(day, średni_r),
	RoboWalka.new(dr, r2),
	RoboWalka.new(r1, bubu_robo)
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
