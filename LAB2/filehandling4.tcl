# Simple parser for Verilog file
set filename "abc.txt"
if {![file exists $filename]} {
    puts "Error: File not found"
    exit 1
}

set fp [open $filename r]
set lines [split [read $fp] "\n"]
close $fp

# Initialize counters
set line_count 0
set module_name ""
set reg_vars {}
set always_blocks 0
set in_module 0

foreach line $lines {
    incr line_count
    set line [string trim $line]
    
    # Skip comments and empty lines
    if {$line == "" || [string match "//*" $line]} {
        continue
    }
    
    # Find module
    if {[string first "module " $line] == 0} {
        set words [split $line " "]
        foreach word $words {
            if {$word != "module" && $word != "" && $module_name == ""} {
                # Remove any trailing characters
                set module_name [string trim $word " \t\n\r\f\v();#"]
                break
            }
        }
        set in_module 1
    }
    
    # Check for endmodule
    if {[string first "endmodule" $line] >= 0} {
        set in_module 0
    }
    
    # Only process if inside module
    if {$in_module} {
        # Find reg declarations
        if {[string first "reg " $line] >= 0 || [string first "\treg " $line] >= 0} {
            # Remove "reg" keyword
            set clean_line [string map {"reg " "" "\treg " ""} $line]
            
            # Remove any [x:y] patterns
            while {[set start [string first "\[" $clean_line]] >= 0} {
                set end [string first "\]" $clean_line]
                if {$end > $start} {
                    set clean_line "[string range $clean_line 0 [expr {$start - 1}]] [string range $clean_line [expr {$end + 1}] end]"
                }
                set clean_line [string trim $clean_line]
            }
            
            # Split by commas and semicolons
            set parts [split $clean_line ";,"]
            foreach part $parts {
                set part [string trim $part]
                if {$part != ""} {
                    # Remove any assignment
                    set equal_pos [string first "=" $part]
                    if {$equal_pos >= 0} {
                        set part [string range $part 0 [expr {$equal_pos - 1}]]
                        set part [string trim $part]
                    }
                    
                    # Remove any size specifications
                    set colon_pos [string first ":" $part]
                    if {$colon_pos >= 0} {
                        set part [string range $part 0 [expr {$colon_pos - 1}]]
                        set part [string trim $part]
                    }
                    
                    if {$part != "" && [lsearch $reg_vars $part] < 0} {
                        lappend reg_vars $part
                    }
                }
            }
        }
        
        # Count always blocks
        if {[string first "always @" $line] >= 0 || 
            [string first "always begin" $line] >= 0 ||
            [string first "always" $line] == 0} {
            incr always_blocks
        }
    }
}

# Print output
puts "Analysis Results for: $filename"
puts "a. Number of lines: $line_count"
puts "b. Module name: $module_name"
puts "c. Reg variables found ([llength $reg_vars] total):"
foreach var [lsort $reg_vars] {
    puts "   $var"
}
puts "d. Number of always blocks: $always_blocks"
