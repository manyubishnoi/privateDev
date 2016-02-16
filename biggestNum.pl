#!/usr/bin/perl

#This program combines all the individual integer elements of the array and then produces the largest
#possible number from the combination.

# Asked in Google interview.

use strict;
use warnings;

my @arr = (3,6,12,45,87,234,67,9,1);
my $concat;
my $sorted;

foreach my $x (@arr) {
	print "element: $x\n";
	$concat .= $x;
}

print "Concat is $concat\n";

my @arr1 = split(//, $concat);
$sorted = reverse sort @arr;

print"arr1 is @arr1\n";
print "sorted concat is: $sorted\n";

