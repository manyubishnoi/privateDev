#!/usr/bin/perl 

#Project Euler problem 22.

use strict;
use warnings;
use Getopt::Long;

my %hash;
my $wordSum=0;
my $totalSum;
my $file;
my $product;

my $x = GetOptions (
	'file=s' => \$file,
);

if (defined($file)) {
	&map;
	&readfile($file);
}
else {
        &usage;
}

sub usage{
        print"ERROR............ See usage below:\n";
        print "$0 -file <filename>\n";
}

sub map {
	my $value = 1;
	for my $i ('A'..'Z') {
		$hash{$i} = $value;
		$value++;
	}
}

sub readfile {
	my $inputFile = shift;
	open (my $fh, "<$inputFile") || die "cant open file .... $!";
	while (my $line = <$fh>) {
		chomp $line;
		$line =~ s/"//g;
		#$line =~ s/,//g;
		my @wordlist = split (/,/, $line);
		@wordlist = sort {$a cmp $b} @wordlist;
		print "sorted wordlist is:  @wordlist\n";
		for(my $a = 0; $a <= $#wordlist; $a++) {
			$totalSum = &sum($wordlist[$a]);
			$product += ($a+1)*$totalSum;
			print "total product is: $product\n";
		}
	}
	close($fh);
	print "total product is: $product\n";
}

sub sum { 
	my $word = shift;
	$wordSum = 0;
	my @alphabets = split(//, $word); 
	foreach my $alpha (@alphabets) {
		$wordSum += $hash{$alpha};	
	}
	#print "sum is: $wordSum\t";
	return $wordSum;
}
