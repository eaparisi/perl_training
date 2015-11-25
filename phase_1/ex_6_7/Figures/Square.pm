#!/usr/bin/perl

use v5.14;

use lib '..';
use Figures::Figure;

package Figures::Square;
	our @ISA = "Figures::Figure";

	our $pi = 4 * atan2(1, 1);

	sub drawFigure {

		my $self = shift;
		my ($pAx, $pAy, $width) = $self->calcInternalValues();
		my $val = 2 * $pi;

		$self->{cr}->rectangle($pAx, $pAy, $width, $width);
		$self->{cr}->set_source_rgb(rand(1), rand(1), rand(1));
		$self->{cr}->fill;

		$self->{cr}->arc($pAx, $pAy, 3, 0, $val);
		$self->{cr}->set_source_rgb(0, 0, 0);
		$self->{cr}->fill;

		my $pBx = $pAx + $width;
		my $pBy = $pAy;
		$self->{cr}->set_line_width(2);
		$self->{cr}->move_to($pAx, $pAy);
		$self->{cr}->line_to($pBx, $pBy);
		$self->{cr}->close_path();
		$self->{cr}->set_source_rgb(1, 0, 0);
		$self->{cr}->stroke;
		}

	sub calcInternalValues {
		my $self = shift;
		my $pAx = $self->{data}->{'square'}{'pointA'}{'x'};
		my $pAy = $self->{data}->{'square'}{'pointA'}{'y'};
		my $width = $self->{data}->{'square'}{'width'}{'x'};
		return ($pAx, $pAy, $width);
	}

	sub getArea {
		my $self = shift;
		my ($pAx, $pAy, $width) = $self->calcInternalValues();
		my $area = $width**2;
	}

	1;