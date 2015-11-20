#!/usr/bin/perl

use strict;
use warnings;

my @arr = qw(34 56 232 687 3453 23 7 9 343 23);
my $i; 
my $j;
my $k;

sub selection_sort{
   for($i=0; $i <= $#arr; $i++) {
	for($j=$i, $k=$i; $j <= $#arr; $j++) {
		if ($arr[$j] < $arr[$k]) {
			$k = $j;
		}
	}
	my $temp = $arr[$i];
	$arr[$i] = $arr[$k];
	$arr[$k] = $temp;
   }
}

&selection_sort(@arr);
print "sorted array is @arr\n";
