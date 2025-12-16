set std_cells {inv nand2 nor2 xor2 dff}
puts "Number of cells: [llength $std_cells]"
puts "First cell: [lindex $std_cells 0]"
puts "Last cell: [lindex $std_cells [expr [llength $std_cells]-1]]"
lappend std_cells buf
lappend std_cells mux2
lset std_cells 4 dff_async
puts "MODULES: $std_cells"
