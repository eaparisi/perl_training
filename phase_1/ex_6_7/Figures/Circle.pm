#!/usr/bin/perl

use v5.14;

use lib '..';
use Figures::Figure;

package Figures::Circle;
	our @ISA = "Figures::Figure";
	
	our $pi = 4 * atan2(1, 1);

	sub drawFigure {

		my $self = shift;
		my ($cx, $cy, $px, $py, $radius) = $self->calcInternalValues();
		my $val = 2 * $pi;

		$self->{cr}->arc($cx, $cy, $radius, 0, $val);
		$self->{cr}->set_source_rgb(rand(1), rand(1), rand(1));
		$self->{cr}->fill;

		$self->{cr}->arc($cx, $cy, 3, 0, $val);
		$self->{cr}->set_source_rgb(0, 0, 0);
		$self->{cr}->fill;

		$self->{cr}->arc($px, $py, 3, 0, $val);
		$self->{cr}->set_source_rgb(1, 1, 1);
		$self->{cr}->fill;
	}

	sub calcInternalValues {
		my $self = shift;
		my $cx = $self->{data}->{'circle'}{'center'}{'x'};
		my $cy = $self->{data}->{'circle'}{'center'}{'y'};
		my $px = $self->{data}->{'circle'}{'perimeter'}{'x'};
		my $py = $self->{data}->{'circle'}{'perimeter'}{'y'};
		my $xDif = $px - $cx;
		my $yDif = $py - $cy;
		$xDif = ($xDif < 0) ? -$xDif : $xDif;
		$yDif = ($yDif < 0) ? -$yDif : $yDif;
		my $radius = sqrt($xDif**2+$yDif**2);
		return ($cx, $cy, $px, $py, $radius);
	}
	
	sub getArea {
		my $self = shift;
		my ($cx, $cy, $px, $py, $radius) = $self->calcInternalValues();
		return $pi*($radius**2);
	}

	1;