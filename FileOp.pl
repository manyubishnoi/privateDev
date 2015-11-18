#!/usr/bin/perl

# This program takes a files from the command line input and then does:
# read, write, reverse etc operations on it.

use strict;
use warnings;
use Getopt::Long;

my $x;
my @arr1 = ();
my @arr2 = ();

my $file = GetOptions(
	"file=s" => \$x,
);

if (defined($x)) {
	&readFile($x);
	&write($x);
	&reverse($x);
}else {
	&usage;
	print "\n";
}


sub usage {
	print "Usage $0 -file <filename>";
}

sub readFile {
	my $input = shift;
	open (my $FH, $input) || die "cant not open the file: $!";
	while (my $line = <$FH>) {
		print "line number $. is: $line\n";	
		push @arr1, $line;
	}
	close ($FH);
}

sub write {
	my $input = shift;
	open (my $FH, ">>$input") || die "cant open the file: $!";
	print $FH "Just a dummy line at the end";
	while (my $line = <$FH>){
		print "$. is $line\n";
	}
	close ($FH);
}

sub reverse{
	my $input = shift;
	@arr2 = reverse (@arr1);
	open (my $FH, ">$input") || die "cant open the file: $!";
		print $FH @arr2;
		print "Reverse file is: @arr2\n";
	close ($FH);
}

#print "First arg is $ARGV[0] \n";
#&readFile($ARGV[0]);
#&write($ARGV[0]);



