#!/usr/bin/perl

use v5.14;
use PadWalker;

print STDOUT "replace - Please, enter 1 line of text: ";
my $baseTextReplace = <STDIN>;
chomp($baseTextReplace);

print STDOUT "replace - Enter space separated strings to match and replace (one pair per line). Empty line will interrupt input and start execution\n";
print STDOUT "replace - Rule 0: \n";

my $ruleNumber = 0;
my %rules;

my $ruleToReplace = <STDIN>;
while ($ruleToReplace ne "\n") {
	my ($key, $value) = split(/ /, $ruleToReplace);
	chomp($key);
	chomp($value);
	$rules{$key} = $value;
	$ruleNumber++;
	print STDOUT "replace - Rule $ruleNumber: \n";
	$ruleToReplace = <STDIN>;
}

my $keys = join('|', keys %rules);

$baseTextReplace =~ s/($keys)/$rules{$1}/g;

print STDOUT "$baseTextReplace\n";
exit 0;
