#/usr/bin/perl

use strict;
use warnings;
use Data::Dumper;

my %hash = ();
my @arr2;
my @arr = qw(foo Bar bar first second Foo foo another foo);

#@arr2 = grep {!$hash{$_}++} @arr;
foreach my $k (@arr) {
	if (! $hash{$k}++) {
		push @arr2, $k;
	}
}
print "@arr2\n";

