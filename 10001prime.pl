#! /usr/bin/perl 

use strict;
use warnings;

my $num = 10001;
my @arr = ();
my $sum = 2;

if ($#arr == 10000) {
	print $arr[10000];
}else {
	for (my $k = 3; $k >=3; $k++) { 
		my $check = &isPrime($k);
		if ($check == 0) {
			push @arr, $k;
			print "Length of arr is $#arr\n";
			if ($#arr == 10000) {
				print "List of prime numbers is: @arr\n";
				print "10001st prime number is : $arr[10000]\n";
				print "10001st prime number is: $#arr\n";
				return 0;
			}
		}
	}
}

foreach my $p (@arr) {
	$sum += $p;
}

print "Sum of $num prime numbers is: $sum\n";

sub isPrime {
	my $var = shift;
	my $half = int $var/2;
	my $sqrt = sqrt $var;
	if ($var % 2 == 0) {
		return 1;
	} else {
		for (my $i = 3; $i <= $sqrt; $i++) {
			if ($var%$i == 0) {
				return 1
			}
		}
		print "$var is prime\n";
		return 0;
	}
}

