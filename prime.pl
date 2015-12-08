#! /usr/bin/perl 

use strict;
use warnings;

my $num = 200;
my @arr = ();
my $sum = 0;
for (my $k = 2; $k < $num; $k++) {
	my $check = &isPrime($k);
	if ($check == 0) {
		push @arr, $k;
	}
}

print "List of prime numbers is: @arr\n";

foreach my $p (@arr) {
	$sum += $p;
}

print "Sum of all the prime numbers upto 2 million is: $sum\n";
print "Total number of primes below 2 mill is: $#arr\n";

sub isPrime {
	my $var = shift;
	my $sqrt = sqrt $var;
	if ($var == 2) {
		return 0;
	}
	if ($var % 2 == 0) {
		return 1;
	} else {
		for (my $i = 2; $i <= $sqrt; $i++) {
			if ($var%$i == 0) {
				return 1
			}
		}
		print "$var is prime\n";
		return 0;
	}
}
