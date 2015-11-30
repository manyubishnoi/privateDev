#!/usr/bin/perl

use strict;
use warnings;

my @arr = ();
my $tally = 0; 
my $num;

for (my $i = 2; $i <=1000000; $i++) {
	@arr = ();
	my $j = $i;
	push @arr, $i;
	while ($j != 1){
		if ($j%2 == 0) {
			$j = even($j);
			push @arr, $j;
			}
		elsif ($j%2 != 0) {
			$j = odd($j);
			push @arr, $j;
		}
	}
	if ($#arr > $tally){
		$num = $arr[0];
	}
	$tally = max($tally, $#arr);
	print "Largest tally is: $tally\t Element is: $arr[0]\n";
}

print "===========================\n";
print "largest number is: $num\n";
print "===========================\n";

sub max {
	my ($x, $y) = @_;
	return $x > $y ? $x: $y
}

sub even {
	my $int = shift;
	return ($int = $int/2);
}

sub odd {
	my $int = shift;
	return ($int = (3*$int +1));
}

