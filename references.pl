#!/usr/bin/perl

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
my @gilligan = qw(red_shirt hat lucky_socks water);
my @professor = qw(sunscreen water slide_rule batteries radio);

&check_list('skipper', \@skipper);
&check_list('professor',\@professor);
&check_list('gilligan', \@gilligan);

print "New elements of gilligan is @gilligan\n";
