#!/usr/bin/perl

use v5.14;

use Data::Printer;
use Mod::Cl1;

print 'Hola';
my $bestiary = Mod::Cl1->new;

print "Animal is ", $bestiary->camel(), " has weight ", $bestiary->weight(), "\n\n";

p $bestiary;


