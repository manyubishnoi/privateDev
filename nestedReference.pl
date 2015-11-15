#!/usr/bin/perl

# We take a reference to an array that also contains a reference to another array

use strict;
use warnings;

sub check_list {
	my $who = shift;
	my $items = shift;
	my %persons_items = map {$_, 1} @$items;
	my @required = qw(preserver sunscreen water jacket);
	my @missing = ();

	foreach my $item (@required) {
		if (!($persons_items{$item})) {
			print "$who is missing $item \n";
			push @missing, $item;
		}
	}
	
	if (@missing) {
		print "Adding @missing to @$items for $who\n";
		push @$items, @missing;
	}
}

my @skipper = qw(blue_shirt hat jacket preserver sunscreen);
my @skipper_with_name = ('skipper' => \@skipper);

my @gilligan = qw(red_shirt hat lucky_socks water);
my @gilligan_with_name = ('gilligan' => \@gilligan);

my @professor = qw(sunscreen water slide_rule batteries radio);
my @professor_with_name = ('professor' => \@professor);

my @all_with_names = (\@skipper_with_name, \@professor_with_name, \@gilligan_with_name);

#print "trying arrow on gilligan: $all_with_names[2]->[1]->[0]\n";
foreach my $person (@all_with_names){
	&check_list(@$person);	
}

print "New elements of gilligan is @gilligan\n";
