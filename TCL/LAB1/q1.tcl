set mod1 {10 5}
set mod2 {30 40}
set mod3 {50 60}
set modules {mod1 mod2 mod3}
puts "$modules"
set new1 [expr [lindex $mod1 0] * [lindex $mod1 1]]
puts "Area for 1: $new1"
set new2 [expr [lindex $mod2 0] * [lindex $mod2 1]]
puts "Area for 2: $new2"
set new3 [expr [lindex $mod3 0] * [lindex $mod3 1]]
puts "Area for 3: $new3"
