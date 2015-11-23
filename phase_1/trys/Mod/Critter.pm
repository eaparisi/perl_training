#!/usr/bin/perl

package Mod::Critter;

sub spawn {
	my $invocant = shift; 	
	my $class = ref($invocant) || $invocant;	# Object or class name
	my $self = {}; 								# Reference to an empty anonymous hash
	bless($self, $class);						# Bless the reference into that package
	return $self; 								# Return the freshly generated Critter
}

1;