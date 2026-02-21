set cell_power(inv) 1.0
set cell_power(nand2) 2.3
set cell_power(xor2) 3.0
puts "Power of xor2: $cell_power(xor2)"
foreach i [array names cell_power] {
    puts "$i : $cell_powercler($i) uW"
}
