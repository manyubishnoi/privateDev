#!/usr/bin/perl

use strict;
use warnings;

my @arr = qw(34 10 56 37 232 687 3453 23 7 9 343 23);
my $i; 
my $j;
my $k;

my @final = &quicksort(@arr);
print "sorted array is: @final\n";

sub quicksort{
	my @list = @_;
	if (scalar @list <= 1) {
		return @list;
	}
	
	my $pivot = shift @list;
	my @less = grep ($_ < $pivot, @list);
	my @more = grep ($_ > $pivot, @list);
	return (quicksort(@less), $pivot, quicksort(@more));
}

