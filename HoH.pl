#/usr/bin/perl 

use strict;
use warnings;

use Data::Dumper qw(Dumper);

my %hash =();

$hash{"X"}{Math} = 97;
$hash{"X"}{Lit} = 67;
$hash{"Y"}{Math} = 88;
$hash{"Y"}{Lit} = 82;

print Dumper \%hash;

foreach my $key (keys %hash) {
	print "Keys of hash are: $key\t value is: $hash{$key}\n";
		foreach my $h (keys %{$hash{$key}}) {
			print "H is: $h\t value is: $hash{$key}{$h}\n";
		}
}

