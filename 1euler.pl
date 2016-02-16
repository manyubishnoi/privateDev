#!/usr/bin/perl

use strict;
use warnings;

my $limit = 1000;
my $sum = 0;

sub multipleOf_3_5 {
        my $number = shift;
        if ($number % 3 == 0 || $number % 5 == 0) {
                return 1;
        } else {
                return 0;
        }
}

for (my $i=1; $i<$limit; $i++){
	my $res = &multipleOf_3_5($i);
	print "I is: $i \t return: $res\n";
	if ($res == 1){
		$sum += $i;
	}
}

print "Sum of all the natural number below $limit is: $sum\n";
