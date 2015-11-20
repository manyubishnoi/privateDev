# /usr/bin/perl

use strict;
use warnings;
use Getopt::Long;

my $file;
my $line;
my $fh;
my $i;
my @files;

my $files = GetOptions(
	'file=s' => \@files,
);

for ($i = 0; $i <= $#files; $i++) {
    foreach $file (@files) {
	open($fh, "<$file");
	while($line = <$fh>){
		print "$line\n";
	}
	close($fh)
    }
}	

