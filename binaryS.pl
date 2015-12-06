#!/usr/bin/perl

# This script does a binary search to find a bad CL which is where between the
# CL 100 and CL 200. We write a hypothetic function (isGood) which confirms 
# if the current CL is good or bad by comparing it with a known point ($desired here)
# Function binary will recursively call isGood to reach the end goal.

# Asked in facebook interview.

use strict;
use warnings;
my $bad = 200;
my $good = 100;

&binary($bad, $good);
	
sub binary {
	my $high = shift;
	my $low = shift;
	my $mid = int ($high+$low)/2;
	print "INIT: good: $low\t mid: $mid\t $bad: $high\n";
	my $ret = &isGood($mid);
	while (int $low < int $high && $ret != 0) {
		if ($ret == 1) {
			$low = int $mid;
			$mid = int ($mid + $high)/2; 
			print "1: good: $low\t mid: $mid\t bad: $high\n";
			$ret = &isGood ($mid);
			next;
		}
		elsif ($ret == 2) {
			$high = int $mid;
			$mid = int ($mid + $low)/2;
			print "2: good: $low\t mid: $mid\t bad: $high\n";
			$ret = &isGood ($mid);
			next;
		}
		return $ret;
	}
	print "Bad Change: $mid\n";
	return $mid;
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
}
