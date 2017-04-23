require 'C:\Users\admin\Documents\ruby\LeR\Robot.rb'
require 'C:\Users\admin\Documents\ruby\LeR\Robowalka.rb'
r1 = Robot.new(:r4, 55, 10,10, 50, 25)
r2 = Robot.new("r#{[:s. "t", 5].object_id}", 77, 5,5, 40, 45)
super_r = Robot.new("Eerno1",67, 19, 10, 55, 70)
bubu_robo = Robot.new("Eerno2",67, 6, 5, 50, 50)
dr = RoboPtak.new(3,4,"Gge67")
robo = Robot.new("Zżylla5", 79, 23, 9, 55, 60)
średni_r = Robot.new("Robo średniak.R#{rand(100)}", 50, 10, 7, 35, 50)
fu = Robot.new("Marko Fu 2000",70, 90, 50, 60, 40)
allen = RoboPtak.new(50, 60, "Mark Allen4", 70, 50, 90, 40, 60)
sullivan = Robot.new("O'Sullivan 6", 70, 80, 90, 50, 100)
day = RoboPtak.new(30, 70, "Day90", 80, 50, 50, 70, 50)
super_robo = Robot.new("Eerno3000", 99, 80, 70, 80, 60)
final = {
	allen => r1,
	średni_r => fu,
	dr => sullivan,
	super_r => r2,
	bubu_robo => r1,
	day => robo
}
def grajmy(lista)
	lista.each do |r, r3|
		w1 = RoboWalka.new(r, r3)
		w1.walczmy
		sleep 6
		print "CZY CHCESZ ZOBACZYĆ RoboWALKĘ JESZCZE RAZ(inną)?"
		tln = gets.chomp
		if tln == 'nie'
			break
		end
	end
end
