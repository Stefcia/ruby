true
false

puts :"Witamy w Ruby, świecie rb!"
sleep 1

ab = (0..10)

a = 1
a
a = a - 1
$a = a
$a

menu = {
	pyszne_danie_Janka: 9,
	owsianka_babuni: 5,
	bułka_z_czosnkiem: 2..4,
	czosnkowa_zupa: 4,
	:pizza => {
		szpinakowa: 8,
		serowa: 5,
		mięsna: 9,
		:informacja => :"bardzo ważne: pizze są tylko duże!"
	},
	:zupa => {
		zupa_dnia: 2,
		zupa_szpinakowa: 5,
		pomidorówka: 4.50,
		rosół: 3,
		:informacja => :"zupa dnia jest zawsze: pomidorówka czwarek i poniedziałek, rosół - wtorek, zupa szpinakowa - środa, zupa Janka - sobota i niedziela, niespodzianka - piątek."
	}
}
b = [1, 2, true, nil, false, :a, :b, :c, {}]
b = b.push (menu)
[:d, :c, :a, :b, b, menu, :c].sample

rand(130)

if 100 - rand(200) < 0
	puts :true
else
	puts :false
end
if false
	nil
else
	false
end

while true
	puts :"#{[:Ruby, :Riki, :Stefcia, :programiści, :"Witamy w Ruby, świecie rb!"].sample}!"
	sleep 2
	if $a == 5
		break
	else
		puts :"jeszcze nie!"
		$a = $a + 1
		sleep 2
	end
end

def create_name (name, to)
	
end
