#!/usr/bin/perl

use v5.14;
use PadWalker;
use Scalar::Util qw(looks_like_number);

my $responseResult = 0;	# Successful execution
my $result1;
my $result2;

my @parameters = @ARGV;
my @defParameters = [];

for (my $counter = 0; $counter < 3; $counter++) {
	my $param = $parameters[$counter];
	if (!defined $param) {
		$param = 0;
	} elsif (!looks_like_number($param)) {
		print STDERR "Error - bad input: value '$param' is not number\n";
		$responseResult = 1;	# Execution with errors
		next;
	}
	$defParameters[$counter] = $param;
}

if ($responseResult == 0) {

	my $a = $defParameters[0];
	my $b = $defParameters[1];
	my $c = $defParameters[2];
	
	my $sqrRootArgument = $b*$b - 4*$a*$c;
	
	if ($sqrRootArgument > 0) {
		my $sqrRoot = sqrt ($sqrRootArgument);	
		$result1 = (-$b + $sqrRoot) / 2*$a;
		$result2 = (-$b - $sqrRoot) / 2*$a;
	} elsif ($sqrRootArgument == 0) {
		$result1 = $result2 = (-$b) / 2*$a;		
	} else {
		print STDERR "Error - no real solutions: SqrRoot argument not positive\n";
		$responseResult = 1;	# Execution with errors
	}
}

if ($responseResult == 0) {
	#	print STDOUT "Result 1: $result1 / Result 2: $result2" .'\n';
	print STDOUT "$result1 $result2\n";
	exit 0;
} else {
	print STDERR "Execution with errors\n";
	exit 1;
}
