#!/usr/bin/perl 

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

&map;
&readfile($file);

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
	my @alphabets = split(//, $word); 
	foreach my $alpha (@alphabets) {
#		print "alpha is: $alpha\n";
		$wordSum += $hash{$alpha};	
	}
	print "sum is: $wordSum\t";
	return $wordSum;
}
