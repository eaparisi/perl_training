#!/usr/bin/perl

use v5.14;
use PadWalker;
use Scalar::Util qw(looks_like_number);

print STDOUT "Enter a number: ";
my $maxN = <STDIN>;

# -------------------------------------------------------------------------------------
sub getNextUnlocked {

	my ($pos, @notPriNumbers) = @_;
	$pos++;
	
	my $continue = 1;
	my @arr = @{$notPriNumbers[0]};
	my $arrLength = @arr;
	while ($pos < $arrLength && $continue) {
		if (defined $notPriNumbers[0][$pos]) {
			$pos++;
		} else {
			$continue = 0;
		}
	}
	return $pos;
}

# -------------------------------------------------------------------------------------
sub showPrime {
	my $numToShow = $_[0];	
	print STDOUT "$numToShow ";
}

# -------------------------------------------------------------------------------------
sub setMultiplesAsNotPrime {
	my ($baseNum, $limitN, @notPrNumbers) = @_;
	my $factor = 2;
	my $mult = $baseNum*$factor;
	while ($mult <= $limitN) {
		$notPrNumbers[0][$mult] = 1;
		$factor++;
		$mult = $baseNum*$factor;
	}
	return @notPrNumbers;
}

# Principal subroutine ----------------------------------------------------------------
sub showPrimes {
	my $limit = $_[0] + 0;
	my $index = 2;
	my @notPrimeNumbers = ();
	while ($index <= $limit) {
		@notPrimeNumbers = setMultiplesAsNotPrime($index, $limit, @notPrimeNumbers);
		showPrime($index);
		$index = getNextUnlocked($index, @notPrimeNumbers);
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
