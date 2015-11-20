#!/usr/bin/perl

use v5.14;
use PadWalker;
use Data::Dumper qw(Dumper);

open(DATA_NODES, "<:utf8", "data/ex_5_data.txt") || die "Can't open data: $!\n";

my $firstLine = <DATA_NODES>;
my ($startNode, $endNode) = split(/ /, $firstLine);
chomp ($endNode);

# Prepare Graph
my %nodesGraph;
while (my $line = <DATA_NODES>) {

	my ($source, $target) = split(/ /, $line);
	chomp($target);
	if (exists $nodesGraph{$source}) {
		push($nodesGraph{$source}, $target);
	} else {
		$nodesGraph{$source} = [$target];
	}
}

my @stackNodes = ();
push (@stackNodes, {node => $startNode, path => [$startNode]});
my @allPaths = ();

# Compute all Paths
while (@stackNodes > 0) {
	my $nodeS = pop (@stackNodes);
	my $actualNode = $nodeS->{node};
	my $actualPath = $nodeS->{path};
	if (exists $nodesGraph{$actualNode}) {
		my $nextArr = $nodesGraph{$actualNode};
		for my $nextNode (@$nextArr) {
			my @nextPath = @$actualPath;
			push (@nextPath, $nextNode);
			push (@stackNodes, {node => $nextNode, path => \@nextPath});
			push (@allPaths, \@nextPath);
		}
	}
}

# Search path with less steps
my $minSteps = 999999;
my @lessPath;
for my $path (@allPaths) {
	my $pathSetps = @$path;
	my $firstStep = $path->[0];
	my $lastStep = $path->[$pathSetps-1];
	if ($pathSetps < $minSteps && $firstStep eq $startNode && $lastStep eq $endNode) {
		@lessPath = @$path;
		$minSteps = $pathSetps;
	}
	my $dum = 1;
}

# Display Results
if (@lessPath) {
	say Dumper \@lessPath;
	print STDOUT 2;
} else {
	print STDOUT -1;
}
