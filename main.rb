
x1, y1, x2, y2 = ARGV

if [x1, y1] == [x2, y2]
	puts 'Точка найдена!'
elsif x1 == x2
	puts 'х координата верна, у нет'
elsif y1 == y2
	puts 'у координата верна, х нет'
else
	puts 'Близко, но нет'
end