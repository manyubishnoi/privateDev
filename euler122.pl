#/usr/bin/perl

#Project Euler problem 112
#Working from left-to-right if no digit is exceeded by the digit to its left it is called an increasing number; for example, 134468.
#Similarly if no digit is exceeded by the digit to its right it is called a decreasing number; for example, 66420.
#We shall call a positive integer that is neither increasing nor decreasing a "bouncy" number; for example, 155349.
#Clearly there cannot be any bouncy numbers below one-hundred, but just over half of the numbers below one-thousand (525) are bouncy. In fact, the least number for which the proportion of bouncy numbers first reaches 50% is 538.
#Surprisingly, bouncy numbers become more and more common and by the time we reach 21780 the proportion of bouncy numbers is equal to 90%.
#Find the least number for which the proportion of bouncy numbers is exactly 99%.

use strict;
use warnings;

my $result;
my @bouncy;
my $num;
my $percentage;

for($num = 1;  $num > 0, $percentage <= 99.00; $num++) {
	$result = &isBounce($num);
	if ($result == 0) {
		push @bouncy, $num;
		$percentage = ((($#bouncy+1)/$num)*100);
		print "Current percent is: $percentage\n";
	}
}
print "99% number is $num\n";
last;

sub isBounce {
	my $int = shift;
	my @check = split(//,$int);
	my $flag1;
	my @sort = sort @check;
	my $sortedJoin = join ("", @sort);
	my @rev = reverse sort @check;
	my $revJoin = join ("", @rev);
#	print "Input: $int\tSorted Input is: @sort\tReverve Input: @rev\t";
	if ($int == $sortedJoin || $int == $revJoin) {
		print "$int is not bouncy\n";
		$flag1 = 1;
	} else {
		print "$int is bouncy\t";
		$flag1 = 0;
	}

}

