#! /usr/bin/perl 

# This programs finds the value of the first triangle number to have over five hundred divisors.

use strict;
use warnings;
use List::MoreUtils;

sub divisor {
	my $num = shift;
	my $half = $num/2;
	my @divList = ();
	my $sum = 0;
	for (my $i = 1; $i < $half+1 ; $i++) {
		if ($num%$i == 0) {
			push @divList, $i;
		}
	}
	foreach my $var (@divList) {
#		print "elements of divlist are: @divList\n";
		$sum += $var;
	}
#	print "Sum is $sum\n"; 
	return $sum;
}

sub amicable {
	my $sum;
	my $final;
	my $result;
	my $recResult;
	my @amic = ();
	for (my $i=1; $i <= 10000; $i++ ){
		$result = &divisor($i);
		print "Result of $i is : $result\n";
		$recResult= &divisor($result);
		print "RecResult of $result is: $recResult\n";
		if ($recResult == $i){
			push @amic, $i;
			push @amic, $result;
			print "$i and $result are amicable numbers\n";
			print "Array elements are: @amic\n";
		} 
	}
	foreach my $k (@amic) {
		$sum += $k;
		$final = $sum/2;
		print "Total sum of all the amicable numbers is: $final\n"
	}
#	my @unique = uniq @amic;
#	print "unique values of array are: @unique";
}

&amicable;
