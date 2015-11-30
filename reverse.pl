#!/usr/bin/perl

# This program reverses a string

use strict;
use warnings;

my $string = "Hhello World";
my $i;
my $j;
my $s;
my $rev;
my @arr = split(//, $string);

# --------------- Method 1 -----------------------#
$string =~ s/(.)/substr($string, length($string)-pos($string)-1, 1)/eg;
print "Method 1 output: $string\n";

# --------------- Method 2 -----------------------#
for ($s = $#arr; $s >= 0; $s--) {
        $rev .= $arr[$s];
}
print "Method 2 output: $rev\n";

# --------------- Method 3 -----------------------#

for ($i = 0, $j = $#arr; $i < $#arr/2, $j > $#arr/2; $i++, $j--) {
	@arr[$i,$j] = @arr[$j,$i];
}
my $join = join ("", @arr);
print "Method 3 output:  $join\n";
