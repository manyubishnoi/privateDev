#!/usr/bin/perl 

use strict;
use warnings;

my $limit = 4000000;
my $a = 1;
my $b = 2;
my @arr;
my $sum = 2;

while ($b < $limit) {
	$a = $a+$b;
	push (@arr, $a);
	$b = $a+$b;	
	push (@arr, $b);
}

print "arr : @arr\n";

foreach my $i (@arr) {
	if ($i%2 == 0) {
		$sum += $i;
	}	
}
print "sum is $sum\n";

