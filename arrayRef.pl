#!/usr/bin/perl

use strict;
use warnings;

my @arr1 = qw(a b e h i);
my @arr2 = qw(a b e h j k);
my @arr3 = qw(a b f l m);
my @arr4 = qw(a b f l n);
my @arr = (\@arr1, \@arr2, \@arr3, \@arr4); 	# Array of array ref
my @ar = (\@arr1, \@arr2, \@arr3);		# Array of array ref
my $ref1 = \@arr2;				# Simple reference
my $ref2 = \@arr;				# Nested reference
my @aoar = (\@arr, \@ar);			# Array of nested array ref

print "arr:  $arr[1]->[5]\n";
print "ref1: $ref1->[5]\n";
print "ref2: $ref2->[1]->[5]\n";
print "aoar: $aoar[0]->[1]->[5]\n";

foreach my $path (@arr) {
	# To print all sub-elements of each element of array @arr:
	print "path: @$path\n";
	# To print each sub-element of each element of array @arr:
	foreach my $k (@$path) {
		print "$k\n";	
	}
}
