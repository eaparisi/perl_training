#!/usr/bin/perl

use v5.14;

use lib '..';
use Figures::Figure;

package Figures::Triangle;
	our @ISA = "Figures::Figure";

	our $pi = 4 * atan2(1, 1);

	sub drawFigure {

		my $self = shift;
		my ($pAx, $pAy, $pBx, $pBy, $pCx, $pCy) = $self->calcInternalValues();
		my $val = 2 * $pi;

		$self->{cr}->move_to($pAx, $pAy);
		$self->{cr}->line_to($pBx, $pBy);
		$self->{cr}->line_to($pCx, $pCy);
		$self->{cr}->close_path();
		$self->{cr}->set_source_rgb(rand(1), rand(1), rand(1));
		$self->{cr}->fill;

		$self->{cr}->arc($pAy, $pAy, 3, 0, $val);
		$self->{cr}->set_source_rgb(0, 0, 0);
		$self->{cr}->fill;

		$self->{cr}->arc($pBx, $pBy, 3, 0, $val);
		$self->{cr}->set_source_rgb(1, 1, 1);
		$self->{cr}->fill;

		$self->{cr}->arc($pCx, $pCy, 3, 0, $val);
		$self->{cr}->set_source_rgb(0.5, 0.5, 0.5);
		$self->{cr}->fill;
	}

	sub calcInternalValues {
		my $self = shift;
		my $pAx = $self->{data}->{'triangle'}{'pointA'}{'x'};
		my $pAy = $self->{data}->{'triangle'}{'pointA'}{'y'};
		my $pBx = $self->{data}->{'triangle'}{'pointB'}{'x'};
		my $pBy = $self->{data}->{'triangle'}{'pointB'}{'y'};
		my $pCx = $self->{data}->{'triangle'}{'pointC'}{'x'};
		my $pCy = $self->{data}->{'triangle'}{'pointC'}{'y'};
		return ($pAx, $pAy, $pBx, $pBy, $pCx, $pCy);
	}

	sub getArea {
		my $self = shift;
		my ($pAx, $pAy, $pBx, $pBy, $pCx, $pCy) = $self->calcInternalValues();
		my $area = ($pAx*$pBy + $pBx*$pCy + $pCx*$pAy - $pAy*$pBx - $pBy*$pCx - $pCy*$pAx) / 2;
		$area = ($area < 0) ? -$area : $area;
		return $area;
	}

	1;