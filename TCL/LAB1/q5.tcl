#puts -nonewline "Enter your name: "
#flush stdout
#gets stdin name
#puts "Hello, $name"

puts -nonewline "Enter your frequency: "
flush stdout
gets stdin freq_mhz
if {$freq_mhz > 800} {
    puts "Ultra High Performance mode"
} elseif {$freq_mhz >= 400} {
    puts "High Performance mode"
} elseif {$freq_mhz >= 200} {
    puts "Balanced  mode"
} else {
    puts "Low Performance mode"
}

puts "Clock speed : [expr {1000.0/$freq_mhz}] ns"
