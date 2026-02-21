puts -nonewline "Enter a number: "
flush stdout
gets stdin num
set n 0
set i 0
while {$i < $num} {
    set n [expr {$n + $num}]
    incr i
}
puts "$n"
