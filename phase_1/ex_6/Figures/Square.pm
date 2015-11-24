#!/usr/bin/perl

use v5.14;

use lib '..';
use Figures::Figure;

package Figures::Square;
	our @ISA = "Figures::Figure";

	sub drawFigure {
		my $self = shift;
		my $pAx = $self->{data}->{'square'}{'pointA'}{'x'};
		my $pAy = $self->{data}->{'square'}{'pointA'}{'y'};
		my $width = $self->{data}->{'square'}{'width'}{'x'};
		$self->{cr}->rectangle($pAx, $pAy, $width, $width);
		$self->{cr}->set_source_rgb(0.4, 0.4, 0.4);
		$self->{cr}->fill;
	}

	1;