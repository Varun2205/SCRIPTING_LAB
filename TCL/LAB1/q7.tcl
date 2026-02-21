set modules {alu regfile controller fifo uart}
foreach mod $modules {
    puts "read_verilog ./rtl/$mod.v"
}
puts "All RTL files read Successfully"


