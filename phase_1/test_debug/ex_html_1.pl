#!/usr/bin/perl

use v5.14;

my $dummy = 1;

# $DB::single = 1;

print "Content-type: text/html\n\n";
print <<htmlcode;
<!DOCTYPE html>
<html>
	<head>
		<title>Ex</title>
	</head>
	<body>
htmlcode

my @numbers;
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

open(DATA_NUMBERS, "<:utf8", "phase_1/data/ex_4_data.txt") || die "Can't open data: $!\n";

while (my $line = <DATA_NUMBERS>) {

# Ver caso que no mapea

	chomp($line);
	my $originalLine = $line;
	$line =~ s/-/ /g;
	$line =~ s/,//g;
	$line =~ s/ and //g;

	my $lineWords = $line;
	$lineWords =~ s/\s/|/g;

	$line =~ s/\b($lineWords)\b/$equivalences{$1}/g;
	$line =~ s/\s\*/\*/g;
	$line =~ s/\s\*/\*/g;
	$line =~ s/\s+$//;
	$line =~ s/\s+/+/g;
	$line =~ s/\*1000/)\*1000/g;
	if (index($line, ')') != -1) {
		$line = '(' . $line;
	}

	my $number = eval $line;
	push @numbers, [($number, $originalLine)];
}

close DATA_NUMBERS;

# say Dumper \@numbers;

my @orderedNumbers = sort {$a->[0] <=> $b->[0]} @numbers;

print $_->[1], " => ", $_->[0], '<br>' foreach (@orderedNumbers);

print <<htmlcode;
	</body>
</html>
htmlcode