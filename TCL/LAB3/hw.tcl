#!/bin/tclsh

# Fixed: Renamed from 'teminate' to 'terminate' to match the call in MAIN
proc terminate {msg} {
    puts stderr "ERROR: $msg"
    exit 1
}

proc parse_timing_report {fname} {
    if {![file exists $fname]} {
        terminate "File $fname does not exist."
    }

    set fp [open $fname r]
    set startpoint ""
    set endpoint ""
    set slack ""

    while {[gets $fp line] >= 0} {
        # Match Startpoint
        if {[regexp {^\s*Startpoint:\s+(\S+)} $line -> sp]} {
            set startpoint $sp
        }

        # Match Endpoint
        if {[regexp {^\s*Endpoint:\s+(\S+)} $line -> ep]} {
            set endpoint $ep
        }

        # Match slack
        
        if {[regexp {slack\s+\((?:MET|VIOLATED)\)\s+([-+]?[0-9]*\.?[0-9]+)} $line -> sl]} {
            set slack $sl
        }
    }

    close $fp

    # Create and return a dictionary
    return [dict create startpoint $startpoint endpoint $endpoint slack $slack]
}
proc extract_cell_delays {filename} {
    set fp [open $filename r]
    set cells {}

    while {[gets $fp line] >= 0} {
        if {[regexp {(\S+)/\S+\s+\(([^)]+)\)\s+([0-9.]+)} $line -> inst celltype delay]} {
            lappend cells [dict create \
                instance $inst \
                celltype $celltype \
                delay    $delay]
        }
    }
    close $fp
    return $cells
}

# ------------------------MAIN----------------------------------------------
if {[llength $argv] != 1} {
    # Fixed: Corrected call to 'terminate'
    terminate "Usage: tclsh parse_timing_report.tcl <filename.log>"
}

set report [lindex $argv 0]
set r [parse_timing_report $report]

puts "Startpoint : [dict get $r startpoint]"
puts "Endpoint   : [dict get $r endpoint]"
puts "Slack      : [dict get $r slack]"
set cell_list    [extract_cell_delays $argv]
puts "$cell_list"
