#!/usr/bin/perl

use v5.14;
use Cairo;

package Figures::Surface;

	sub new {
		my $invocant = shift;
		my $class = ref($invocant) || $invocant;
		my $surface = Cairo::ImageSurface->create('argb32', 800, 600);
		my $cr = Cairo::Context->create($surface);
		my %data = @_;
		# print $data{'rectangle'}{'pointA'}{'x'} . ':------------<br>';
		my $self = {
			surface => $surface,
			cr => $cr,
			data => \%data,
		};
		bless($self, $class);
		return $self;		
	}

	sub saveToFile {
		my $self = shift;
		my $file = $_[0];
		$self->{cr}->show_page;
		$self->{surface}->write_to_png ($file);
	}

	1;