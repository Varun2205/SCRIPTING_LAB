#QUESTION 1

# set mod1 {10 5}
# set mod2 {30 40}
# set mod3 {50 60}
# set modules {mod1 mod2 mod3}
# puts "$modules"
# set new1 [expr [lindex $mod1 0] * [lindex $mod1 1]]
# puts "Area for 1: $new1"
# set new2 [expr [lindex $mod2 0] * [lindex $mod2 1]]
# puts "Area for 2: $new2"
# set new3 [expr [lindex $mod3 0] * [lindex $mod3 1]]
# puts "Area for 3: $new3"



#Question 2

# set std_cells {inv nand2 nor2 xor2 dff}
# puts "Number of cells: [llength $std_cells]"
# puts "First cell: [lindex $std_cells 0]"
# puts "Last cell: [lindex $std_cells [expr [llength $std_cells]-1]]"
# lappend std_cells buf
# lappend std_cells mux2
# lset std_cells 4 dff_async
# puts "MODULES: $std_cells"


#Question 3
# set cell_power {1.0 2.5 2.3 3.0}
# #MUST UNCOMMENT QUESTION 2
# set xor2_pow [lsearch $std_cells xor2]  
# puts "xor2 power: $xor2_pow"
# set inv_pow [lsearch $std_cells inv]
# set nand_pow [lsearch $std_cells nand2]
# puts "Cell inv : [lindex $cell_power [expr $inv_pow]] uW"
# puts "Cell nand2 : [lindex $cell_power [expr $nand_pow]] uW"
# set avg_pow 0
# foreach i $cell_power {
#     #puts "$i"
#     set avg_pow [expr {$avg_pow+$i}]
# }
# set avg_pow [expr {$avg_pow / [llength $cell_power]}]
# puts "Average Power:$avg_pow uW"

#Question 3

# set cell_power(inv) 1.0
# set cell_power(nand2) 2.3
# set cell_power(xor2) 3.0
# puts "Power of xor2: $cell_power(xor2)"
# foreach i [array names cell_power] {
#     puts "$i : $cell_powercler($i) uW"
# }

#Question 4
# set modules {alu regfile controller}
# set module_area {120 300 180}

# for {set i 0} {$i < [llength $modules]} {incr i} {
#     puts "[lindex $modules $i] : [lindex $module_area $i]"
# }

#Questions5
# puts -nonewline "Enter your name: "
# flush stdout
# gets stdin name
# puts "Hello, $name"

# puts -nonewline "Enter your frequency: "
# flush stdout
# gets stdin freq_mhz
# if {$freq_mhz > 800} {
#     puts "Ultra High Performance mode"
# } elseif {$freq_mhz >= 400} {
#     puts "High Performance mode"
# } elseif {$freq_mhz >= 200} {
#     puts "Balanced  mode"
# } else {
#     puts "Low Performance mode"
# }

# puts "Clock speed : [expr {1000.0/$freq_mhz}] ns"

#Question 6
# set areas {120 250 90 300}
# set max_area [lindex $areas 0]
# set max_index 0
# for {set i 0} {$i < [llength $areas]} {incr i} {
#     set current [lindex $areas $i]
#     if {$current > $max_area} {
#         set max_area $current
#         set max_index $i
#     }
# }
# puts "Maximum area = $max_area sq.units\nIndex=$max_index"


#Question 7
# set modules {alu regfile controller fifo uart}
# foreach mod $modules {
#     puts "read_verilog ./rtl/$mod.v"
# }
# puts "All RTL files read Successfully"

# Question 8
# puts -nonewline "Enter a number: "
# flush stdout
# gets stdin num
# set n 0
# set i 0
# while {$i < $num} {
#     set n [expr {$n + $num}]
#     incr i
# }
# puts "$n"



#Question 9
puts -nonewline "Enter the number of timing paths (P): "
flush stdout
gets stdin P
set worst_slack 0
set violating_paths 0

for {set i 1} {$i <= $P} {incr i} {
    puts -nonewline "Enter slack value for path $i: "
    flush stdout
    gets stdin slack

    if {$i == 1} {
        set worst_slack $slack
    } else {
        if {$slack < $worst_slack} {
            set worst_slack $slack
        }
    }
    if {$slack < 0} {
        incr violating_paths
    }
}
puts "Total paths: $P"
puts "Violating paths (negative slack): $violating_paths"
puts "Worst slack: $worst_slack"

