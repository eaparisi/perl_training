#!/usr/bin/perl

use v5.14;

use lib '..';
use Figures::Figure;

package Figures::Rectangle;
	our @ISA = "Figures::Figure";

	our $pi = 4 * atan2(1, 1);

	sub drawFigure {
		my $self = shift;
		my ($pAx, $pAy, $pBx, $pBy, $width, $height) = $self->calcInternalValues();
		my $val = 2 * $pi;

		$self->{cr}->rectangle($pAx, $pAy, $width, $height);
		$self->{cr}->set_source_rgb(rand(1), rand(1), rand(1));
		$self->{cr}->fill;

		$self->{cr}->arc($pAx, $pAy, 3, 0, $val);
		$self->{cr}->set_source_rgb(0, 0, 0);
		$self->{cr}->fill;

		$self->{cr}->arc($pBx, $pBy, 3, 0, $val);
		$self->{cr}->set_source_rgb(1, 1, 1);
		$self->{cr}->fill;
	}

	sub calcInternalValues {
		my $self = shift;
		my $pAx = $self->{data}->{'rectangle'}{'pointA'}{'x'};
		my $pAy = $self->{data}->{'rectangle'}{'pointA'}{'y'};
		my $pBx = $self->{data}->{'rectangle'}{'pointB'}{'x'};
		my $pBy = $self->{data}->{'rectangle'}{'pointB'}{'y'};
		my $width = $pBx - $pAx;
		my $height = $pBy - $pAy;
		return ($pAx, $pAy, $pBx, $pBy, $width, $height);
	}

	sub getArea {
		my $self = shift;
		my ($pAx, $pAy, $pBx, $pBy, $width, $height) = $self->calcInternalValues();
		my $area = $width * $height;
		return $area;
	}

	1;