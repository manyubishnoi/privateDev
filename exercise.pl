#!/usr/bin/perl

# We take a reference to an array that also contains a reference to another array

use strict;
use warnings;

sub check_list {
	my $who = shift;
	my $new_items = shift;
	my $items = @$new_items;
	my @required = qw(preserver sunscreen water jacket);
	my @missing = ();

	foreach my $item (@required) {
		if (!(grep $item eq $_, @$items)) {
			print "$who is missing $item \n";
			push @missing, $item;
		}
	}
	
	if (@missing) {
		print "Adding @missing to @$items for $who\n";
		push @$items, @missing;
	}
}

sub check_list_all {
	my $all = shift;
	foreach my $person (keys %$all){
		check_list($person, $all->{$person}); 
	}
}
my @skipper = qw(blue_shirt hat jacket preserver sunscreen);
my @gilligan = qw(red_shirt hat lucky_socks water);
my @professor = qw(sunscreen water slide_rule batteries radio);

my %all = (
	Gilligan => '\@gilligan',
	Skipper => '\@skipper',
	Professor => '\@professor',
);

&check_list_all(\%all);
