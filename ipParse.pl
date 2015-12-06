#!/usr/bin/perl

use strict;
use warnings;

my $ip = "";
my $check = "";

until ($ip =~ m/\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}/g){
	print "Provide IP address in correct format(egs: 192.168.10.1) : ";
	$ip = <STDIN>;
	next;
}

$check = &ipParse ($ip);

if ($check == 0){
	print "IP address is valid\n";
}

sub ipParse {
	my $inp = shift;
	my $flag = 1;
	my @arr = split(/\./, $inp);
	foreach my $octet (@arr) {
		if ($octet <= 255) {
			$flag = 0;
			next
		}else{
			$flag = 1;
			print "IP not valid: octet $octet is bad\n";
			return 1;
		}
	}
	if ($flag == 0){
		return 0;
	}
}
