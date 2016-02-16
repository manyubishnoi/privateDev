#!/usr/bin/perl

use strict;
use warnings;

my %hash = ();
my $x = "{aHHbhi[(hjkuiosd)n]bjk}";

my %mapping = (
	"}" => "{",
	")" => "(",
	"]" => "[",
);

&reverse($x);

sub reverse {
	my $s = shift;
	my $val;
	my @start;
	my $flag;
	my @rev;

	print "Input is: $s\n";
	$s =~ s/[A-Za-z]//ig;
	print "only brackets: $s\n";

	my @arr = split(//, $s);
	print "array is: @arr\n";
	@rev = reverse @arr;
	print "reverse is: @rev\n";
	foreach my $k (@arr){
		$flag = 0;
		if ($k eq '{'|| $k eq '[' || $k eq '(' ) {
			print "K is :$k\n";
			push @start, $k;			
		}
		if ($k eq '}' || $k eq ']' || $k eq ')') {
			$val = pop @start;
			if ($val eq $mapping{$k}) {
				$flag = 1;
				print "$k is good because $mapping{$k} was last opened\n";
			}
			else {
				print "Bad prog, exiting $k\n";
				$flag = 0;
				return 1;
			}
		}
	}
	print "Remaining elements of the array are: @start\n";
	if((!@start) && $flag == 1) {
		print "Syntax just fine\n";
	} 
	else {
		print "bad program, check syntax\n";
	}
}


