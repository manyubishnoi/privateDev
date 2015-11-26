#!/usr/bin/perl

use strict;
use warnings;

my $key;
my $val;
my %hash = (
	"one" => 1,
	"two" => 2,
	"three" => 3,
	"four" => 4,
);

my %new;

while (($key, $val) = each %hash) {
   $new{$val}=$key;
}

print "Reversd key is:\n";
foreach my $k (keys %new) {
	print "key is: $k\t value is $new{$k}\n";
}


