#!/usr/bin/perl 

use strict;
use warnings;

my %gilligan_info = (
	name => 'Gilligan',
	hat => 'white',
	shirt => 'red',
	position => 'first mate',
);

my %skipper_info = (
	name => 'Skipper',
	hat => 'black',
	shirt => 'blue',
	position => 'captain',
);

my $gill_ref = \%gilligan_info;
my $skip_ref = \%skipper_info;

my @crew = (%gilligan_info, %skipper_info);
print $crew[0]->{'name'};

#my @keys = keys %gilligan_info;
my @keys = keys %$gill_ref;
my $name = ${$gill_ref}{'name'};

#print "@keys\n";
#print "name is $name\n"; 
