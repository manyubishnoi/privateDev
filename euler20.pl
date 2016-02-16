#!/usr/bin/perl

use strict;
use warnings;
use Math::BigInt;

my $num = new Math::BigInt(100); #Pay attention here, we need $num to be of type BigInt to store such a huge number

my $fact = &factorial($num);
&digitSum($fact);

sub factorial {
	my $int = shift;
	my $result = $int;
	my $final;
	for my $i (1..($int-1)){
		$result *= ($int -$i);
		print "i is: $i\t result is: $result\n";
	}
	print "Factorial is: $result\n";
	return $result;
}

sub digitSum {
	my $inp = shift;
	my @arr = split (//, $inp);
	my $sum = 0;
	foreach my $i (@arr){
		$sum += $i;
	}
	print "Digit sum of $inp is: $sum\n";
	return $sum;
}
