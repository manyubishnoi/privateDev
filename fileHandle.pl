# /usr/bin/perl

# This program reads each file given as an argument to this script and then prints same line content 
# of each file before printing the next line.
# For example first print will have 1st lines from file 1, file 2 and file3. 
# Then the second print will have line 2nd lines from file1, file2 and file3 and so on.

# Asked in Google interview.

use strict;
use warnings;
use Getopt::Long;

my $file;
my $line;
my $fh;
my @files;
my @arr;

my $files = GetOptions(
	'file=s' => \@files,
);

my $totalFiles = ($#files+1);
print "files arr is: @files\n";

foreach $file (@files) {
	open($fh, "<$file");
	while($line = <$fh>){
		push @arr, $line;
	}
	close($fh)
}	

my $lpf = ($#arr+1)/$totalFiles;
print "Consolidated data from all files is: @arr";
print "lines per file are: $lpf\n";
print "total number of files are: $totalFiles\n";
print "Below is the requried output\n";

&printLines(@arr);

sub printLines{
	my @input = shift;
	for (my $i = 0; $i < $lpf; $i++) {
		for (my $j = $i; $j <= $#arr ; $j += $lpf) {
#			$arr[$j] = chomp $arr[$j];
			print "$j\t $arr[$j]\n";
		}
	}
}
