#!/usr/bin/perl

# This script does a binary search to find a bad CL which is where between the
# CL 100 and CL 200. We write a hypothetic function (isGood) which confirms 
# if the current CL is good or bad by comparing it with a known point (190 here)

# Func binary will recursively call isGood to reach the end goal.

use strict;
use warnings;
my $bad = 200;
my $good = 100;

&binary($bad, $good);
	
sub binary {
	my $high = shift;
	my $low = shift;
	my $mid = int ($high+$low)/2;
	my $ret = 10;
	print "INIT: good: $low\t mid: $mid\t $bad: $high\n";
	$ret = &isGood($mid);
	while (int $good < int $bad && $ret != 0) {
		if ($ret == 1) {
			$good = $mid;
			$mid = ($mid + $bad)/2; 
			print "1: good: $good\t mid: $mid\t bad: $bad\n";
			$ret = &isGood ($mid);
			next;
		}
		elsif ($ret == 2) {
			$bad = $mid;
			$mid = ($mid + $good)/2;
			print "2: good: $good\t mid: $mid\t bad: $bad\n";
			$ret = &isGood ($mid);
			next;
		}
		return $ret;
	}
	print "return after while loop: $ret\n";
}

sub isGood {
	my $inp = shift;
	my $desired = 120;
	if ($inp == $desired) {
		return 0;
	}
	elsif ($inp < $desired){
		return 1;
	}
	elsif ($inp > $desired) {
		return 2
	}
	else {
		return 5;
	}
}
