#/usr/bin/perl

use strict;
use warnings;

my $i;
my $j;
my @arr;
my @new = qw(34 7 232 687 3453 23 56 9 343 23);
print "orig arr: @new\n";

&selection_sort(@new);

sub selection_sort {
	my @arr = @_;
	print "input of func is: @arr\n";
	foreach my $k (@arr){
		for ($i = 0, $j = 1; $j <= $#arr; $i++, $j++) {
			if ($arr[$i] > $arr[($j)]) {
				@arr[$i,$j] = @arr[$j,$i];
			}
		}
	}
	print "sorted array is: @arr\n";
}

