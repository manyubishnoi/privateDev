#!/usr/bin/perl

# This program counts the frequency of each each word in a text file.

use strict;
use warnings;
use Getopt::Long;

my $file;

my $f = GetOptions (
	'file=s' => \$file,
);

if (defined($file)) {
	&freq($file);
}
else {
	&usage;
}

sub usage{
	print"ERROR............ See usage below:\n";
	print "$0 -file <filename>\n";
}
sub freq {
	my $in = shift;
	my %counter = ();
	my @arr = ();
	my @newarr = ();
	my @line = ();
	open(my $fh, "<$in") || die "cant open file... $!";
	while (my $line = <$fh>) {
		chomp $line;
		@line = split (/ /, $line);
		push @arr, @line;
	}
	print "arr is : @arr\n";	
	foreach my $str (@arr) {
		$counter{$str}++;	
	}

#Explanation for the above loop:
#When we encounter the first element of the array, $counter{$str} will not yet exists. In perl if we access a hash element where the key does not exists yet, Perl will return undef. 
#Perl will silently increment the undef to be 1, it will create the necessary key in the hash and assign the new value (which is 1). This is a simple case of autovivification. 	

#Commented out below code is without autovivification. It has bug in it though.

	#my %counter = map {$_, 1} @arr;
	#print "contents of the array are: @arr\n";
	#foreach my $key (keys %counter) {
	#	for (my $i = 0; $i < $#arr; $i++) {
	#		print "FORLOOP KEY: $key\n";
	#		if ($key eq $arr[$i]) {
	#			print "IF key: $key\t";
	#			$counter{$key}++;
	#			print "IF value: $counter{$key}\n"; 
	#		} else {
	#			print "ELSE key: $key\n";
	#			$counter{$arr[$i]} = 1;
	#		}
	#	}
	#}

	foreach my $key ( reverse sort {$counter{$a} <=> $counter{$b} } keys %counter) {
		print "Keys: $key\t value: $counter{$key}\n";
	}
}


