#!/usr/bin/perl

use strict;
use warnings;

my $limit = 101;
my $sumAdd = 0;
my $sumSquare = 0;

for(my $i=1; $i<$limit; $i++) {
	my $square = $i**2;
	$sumSquare += $square;
	$sumAdd += $i;
}
my $diff = ($sumAdd**2) - $sumSquare;
print "SS: $sumSquare\t SA: $sumAdd\t Diff: $diff\n";

