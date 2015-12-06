#!/usr/bin/perl

# This program finds the longest array (path). 
# Use case would be suppose there are many branches of a tree
# and we are required to find the longest branch. 
# Here we assume that all the individual branches are known because a user selected them.
# User input is then saved in the Database and those values are populated here from another script.

# Asked in facebook interview.

use strict;
use warnings;

my @arr1 = qw(a b e h i);
my @arr2 = qw(a b e h j k);
my @arr3 = qw(a b f l m);
my @arr4 = qw(a b f l n);
my $largest = 0;
my @array;

my @arr = (\@arr1, \@arr2, \@arr3, \@arr4); #passing individual arrays by ref.

foreach my $path (@arr) {
	&longestPath(@$path);
}

print "Largest length and path are: @array\n";

sub longestPath {
	my @p = @_;
	print "Path is: @p\t\t";
	my $len = ($#p+1);
	print "length is: $len\n";
	if ($len > $largest) {
		@array = qq($len, @p);
		$largest = $len;
	}
}
	
