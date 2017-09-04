#!/usr/bin/tclsh

# This is a simple script to extract all[0] linked URLs from an HTML file.
# Usage: ./extract-links.tcl < page.html
#
#  [0] Yes, all. A regular expression can't be wrong, can it?

while {[gets stdin line] >= 0} {
  if {[regexp -- {<a +([^>]* +)?href="([^"]*)"} $line match discard link]} {
    puts $link
  }
}
