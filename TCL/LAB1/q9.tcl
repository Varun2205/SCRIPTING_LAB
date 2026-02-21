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
