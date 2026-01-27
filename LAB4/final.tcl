#!/bin/tclsh

#-------------------------------
# Count total and non-empty lines
#-------------------------------
proc count_lines {filename} {
    set total 0
    set non_empty 0

    set fp [open $filename r]
    while {[gets $fp line] >= 0} {
        incr total
        if {[string trim $line] ne ""} {
            incr non_empty
        }
    }
    close $fp

    return [list $total $non_empty]
}

#-------------------------------
# Extract design-related info
#-------------------------------
proc extract_design_info {filename} {
    set design_name ""
    set lib_file ""
    set operating_cond ""

    set fp [open $filename r]
    while {[gets $fp line] >= 0} {

        if {[regexp {^Design\s*:\s*(\S+)} $line -> dname]} {
            set design_name $dname
        }

        if {[regexp {File:\s*(\S+)} $line -> lib]} {
            set lib_file $lib
        }

        if {[regexp {^Operating Conditions:\s*(\S+)} $line -> op]} {
            set operating_cond $op
        }
    }
    close $fp

    return [list $design_name $lib_file $operating_cond]
}

#-------------------------------
# Extract power numbers
#-------------------------------
proc extract_power_info {filename} {
    set cell_internal 0.0
    set net_switching 0.0
    set total_dynamic 0.0
    set cell_leakage 0.0

    set fp [open $filename r]
    while {[gets $fp line] >= 0} {

        if {[regexp {Cell Internal Power\s*=\s*([\d\.]+)} $line -> val]} {
            set cell_internal $val
        }

        if {[regexp {Net Switching Power\s*=\s*([\d\.]+)} $line -> val]} {
            set net_switching $val
        }

        if {[regexp {Total Dynamic Power\s*=\s*([\d\.]+)} $line -> val]} {
            set total_dynamic $val
        }

        if {[regexp {Cell Leakage Power\s*=\s*([\d\.]+)} $line -> val]} {
            set cell_leakage $val
        }
    }
    close $fp

    return [list $cell_internal $net_switching $total_dynamic $cell_leakage]
}

#===============================
# Main
#===============================
if {$argc != 1} {
    puts "Usage: tclsh task1.tcl <log_file>"
    exit 1
}

set filename [lindex $argv 0]

# Line counts
puts "---------------TASK 1----------------------"
set line_counts [count_lines $filename]
set total_lines     [lindex $line_counts 0]
set non_empty_lines [lindex $line_counts 1]

puts "Total lines      : $total_lines"
puts "Non-empty lines  : $non_empty_lines"
puts ""

# Design info
puts "---------------TASK 2----------------------"
set design_info [extract_design_info $filename]
set design_name     [lindex $design_info 0]
set lib_file        [lindex $design_info 1]
set operating_cond  [lindex $design_info 2]

puts "Design Name          : $design_name"
puts "Library File Used    : $lib_file"
puts "Operating Conditions : $operating_cond"
puts ""

# Power info
puts "---------------TASK3-----------------------"
set power_info [extract_power_info $filename]
set cell_internal [lindex $power_info 0]
set net_switching [lindex $power_info 1]
set total_dynamic [lindex $power_info 2]
set cell_leakage  [lindex $power_info 3]

set total_power [expr {$total_dynamic + $cell_leakage}]

puts "Cell Internal Power  : $cell_internal uW"
puts "Net Switching Power  : $net_switching uW"
puts "Total Dynamic Power  : $total_dynamic uW"
puts "Cell Leakage Power   : $cell_leakage uW"
puts "_______________________________"
puts "Total Power          : $total_power uW"

