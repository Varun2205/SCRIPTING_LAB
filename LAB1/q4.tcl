set modules {alu regfile controller}
set module_area {120 300 180}

for {set i 0} {$i < [llength $modules]} {incr i} {
    puts "[lindex $modules $i] : [lindex $module_area $i]"
}
