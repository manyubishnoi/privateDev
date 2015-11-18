#!/usr/bin/perl 

use strict;
use warnings;

sub isLeap {
	my $year = shift;
	if ($year%100 == 0 && $year%400 != 0){
		print "$year is a century but not a leap\n";
		return 1;
	} elsif ($year%4 == 0) {
		print "$year is a leap year\n";
		return 0;
	} else {
		print "$year is not a leap year\n";
		return 1;
	}
}

my $i;
my $result;
my @arr = ();
my @leap = ();
my @notLeap = ();
my $sunday = 6;

for($i = 1901; $i <2001; $i++) {
	$result= &isLeap($i);
	if ($result == 0) {
		push @leap, $i;
		for(my $k = 7; $k <= 366; $k+=7) {
        		if ($sunday == 1) {
				push @arr,$sunday;
				print "Sunday on the first of the month\t $sunday\n";
			}
			$sunday +=7;
			if ($sunday == 32 || $sunday == 61 || $sunday == 92 || $sunday == 122 || $sunday == 153 || $sunday == 183 || $sunday == 214 || $sunday == 245 || $sunday == 275 || $sunday == 306 || $sunday == 336) {           
		       	print "sunday on the first of the month\t $sunday\n";
			push @arr, $sunday;
        		}
      
		}
		print "Last Sunday is on: $sunday\t year is: $i\n";
		if ($sunday >366) {
			$sunday = $sunday - 366;
		}elsif ($sunday <=366){
			$sunday = $sunday - 366;
		}

	}else {
		push @notLeap, $i;
		for(my $k = 7; $k <= 365; $k+=7) {
			if ($sunday == 1) {
                                push @arr,$sunday;
                                print "Sunday on the first of the month\t $sunday\n";
                        }
                        $sunday +=7;
                        if ($sunday == 32 || $sunday == 60 || $sunday == 91 || $sunday == 121 || $sunday == 152 || $sunday == 182 || $sunday == 213 || $sunday == 244 || $sunday == 274 || $sunday == 305 || $sunday == 335) {        
                        print "sunday on the first of the month\t $sunday\n";
                        push @arr, $sunday;
                        }

                }
		print "Last Sunday is on: $sunday \t year is: $i \n";
		if ($sunday >365) {
                        $sunday = $sunday - 365;
                }elsif ($sunday <=365){
                        $sunday = $sunday - 365;
                }


	}

}
print "List of Sundays: @arr\n";
print "Total number of Sundays falling on 1st of a month are: $#arr+1\n";
print "list of leap years: @leap\n";

