#!/usr/bin/perl

use v5.14;

use Data::Printer;
use Mod::Critter;
use Mod::Horse;

my $pet = Mod::Critter->spawn;
my $horse = Mod::Horse->new(color => "black", legs => 10);
my $horse2 = $horse->clone(owner => 'Francisco');

my $allObj = [
	$pet,
	$horse,
	$horse2
];

p $allObj;