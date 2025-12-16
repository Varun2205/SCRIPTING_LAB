set areas {120 250 90 300}
set max_area [lindex $areas 0]
set max_index 0
for {set i 0} {$i < [llength $areas]} {incr i} {
    set current [lindex $areas $i]
    if {$current > $max_area} {
        set max_area $current
        set max_index $i
    }
}
puts "Maximum area = $max_area sq.units\nIndex=$max_index"
