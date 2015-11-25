#!/usr/bin/perl

use v5.14;

use lib '..';
use Figures::Figure;

package Figures::Rectangle;
	our @ISA = "Figures::Figure";

	sub drawFigure {
		my $self = shift;
		my $pAx = $self->{data}->{'rectangle'}{'pointA'}{'x'};
		my $pAy = $self->{data}->{'rectangle'}{'pointA'}{'y'};
		my $pBx = $self->{data}->{'rectangle'}{'pointB'}{'x'};
		my $pBy = $self->{data}->{'rectangle'}{'pointB'}{'y'};
		my $width = $pBx - $pAx;
		my $height = $pBy - $pAy;
		$self->{cr}->rectangle($pAx, $pAy, $width, $height);
		$self->{cr}->set_source_rgb(0.4, 0.4, 0.4);
		$self->{cr}->fill;
	}

	1;