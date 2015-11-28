#!/usr/bin/perl

# This program reverses a string

use strict;
use warnings;

my $s = "Hhello World";
my $i;
my $j;

my @arr = split(//, $s);

for ($i = 0, $j = $#arr; $i < $#arr/2, $j > $#arr/2; $i++, $j--) {
	@arr[$i,$j] = @arr[$j,$i];
}

print "reversed array is @arr\n";
