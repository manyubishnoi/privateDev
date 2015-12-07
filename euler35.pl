#!/usr/bin/perl

# Projcet euler problem 35.
# The number, 197, is called a circular prime because all rotations of the digits: 197, 971, and 719, are themselves prime.
# There are thirteen such primes below 100: 2, 3, 5, 7, 11, 13, 17, 31, 37, 71, 73, 79, and 97.
# How many circular primes are there below one million?

# Solution is: 55

use strict;
use warnings;

my @subFinal;
my @final;
my @arr;
my $string;
my $check;
my $flag;
my $f;
my $start = 2;
my $stop = 1000000;

&circularPrime($start, $stop);
my $Number = $#final+1;
print "Number of Circular primes: $Number\n";
print "List of Circular Primes: @final\n";

sub circularPrime {
	my $begin = shift;
	my $end = shift;
	for (my $i = $begin; $i <= $end; $i++) {
		$check = &isPrime($i);
		if ($check == 0) {	
			@arr = split(//, $i);			 # Split the number into digit array.
			@subFinal = ();				 # Emptying the array for each iteration.
			foreach my $ele (@arr) {		 # Foreach digit of the original number.
				splice @arr, 0, 0, $arr[$#arr];  # Inserting the last digit in front.
				pop @arr;			 # Deleting the last digit.
				$string = join ("", @arr);	 # Making a string from array.
				push @subFinal, $string;	 # Saving each circular combination of $ele
				foreach my $s (@subFinal) {	 # Foreach number in the saved array 
					$flag = &isPrime($s);	 # Check to see if it is prime.
					if ($flag == 0){
						$f = 0;
						next;
					}
					else {
						$f = 1;
						last;
					}
				}
			}	
			if ($f == 0) {
				push @final, $subFinal[0];
			}
		}
	}
}

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
#                print "$var is prime\n";
                return 0;
        }
}
