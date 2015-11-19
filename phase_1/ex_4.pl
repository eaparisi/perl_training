#!/usr/bin/perl

use v5.14;
use PadWalker;

my %equivalences=(
    one=>"1",
    two=>"2",
    three=>"3",
    four=>"4",
    five=>"5",
    six=>"6",
    seven=>"7",
    eight=>"8",
    nine=>"9",
    zero=>"0",
    ten=>"10",
    eleven=>"11",
    twelve=>"12",
    thirteen=>"13",
    fourteen=>"14",
    fifteen=>"15",
    sixteen=>"16",
    seventeen=>"17",
    eighteen=>"18",
    nineteen=>"19",
    twenty=>"20 ",
    thirty=>"30 ",
    forty=>"40 ",
    fifty=>"50 ",
    sixty=>"60 ",
    seventy=>"70 ",
    eighty=>"80 ",
    ninety=>"90 ",
    thousand=>"*1000",
    hundred=>"*100",
    millon=>"*1000000"
);

open(DATA_NUMBERS, "<:utf8", "data/ex_4_data.txt") || die "Can't open data: $!\n";

while (my $line = <DATA_NUMBERS>) {

	chomp($line);
	$line =~ s/-/ /g;
	$line =~ s/,//g;
	$line =~ s/ and //g;

	my $lineWords = $line;
	$lineWords =~ s/\s/|/g;

	$line =~ s/($lineWords)/$equivalences{$1}/g;
	$line =~ s/\s\*/\*/g;
	#quitar último espacio si lo hay
	$line =~ s/\s+/+/g;

	my $number = eval $line;

	my $dump = 1;
}
