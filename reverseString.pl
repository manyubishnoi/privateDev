#!/usr/bin/perl

use strict;
use warnings;

my $s = "Hhello World";
my $temp;
my $i;
my $j;

my @arr = split(//, $s);

for ($i = 0, $j = $#arr; $i <= $#arr/2, $j > $#arr/2; $i++, $j--) {
	$temp = $arr[$i];
	$arr[$i] = $arr[$j];
	$arr[$j] = $temp;
}

print "reversed array is @arr\n";
