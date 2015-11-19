#!/usr/bin/perl

use v5.14;
use PadWalker;
use Scalar::Util qw(looks_like_number);

print STDOUT "Enter a number: ";
my $maxN = <STDIN>;

sub showPrimes {

	my $limit = $_[0] + 0;
	my $index = 2;
	my @notPrimeNumbers = ();

	while ($index <= $limit) {
		
		my $factor = 2;
		my $mult = $index*$factor;
		while ($mult <= $limit) {
			$notPrimeNumbers[$mult] = 1;
			$factor++;
			$mult = $index*$factor;
		}

		print STDOUT "$index ";

		$index++;
		my $continue = 1;
		my $arrLength = @notPrimeNumbers;
		while ($index < $arrLength && $continue) {
			if (defined $notPrimeNumbers[$index]) {
				$index++;
			} else {
				$continue = 0;
			}
		}
	}
}

# Validation of input -----------------------------------------------------------------
if (looks_like_number($maxN)) {
	if ($maxN <= 1000000) {
		if ($maxN >= 2) {
			showPrimes($maxN);
			exit 0;
		} else {
			print STDERR "Error - Value is not greater than 1\n";
		}
	} else {
		print STDERR "Error - Value is not less than 1000001\n";
	}
} else {
	print STDERR "Error - Value is not a number\n";
}
exit 1;
