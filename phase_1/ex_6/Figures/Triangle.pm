#!/usr/bin/perl

use v5.14;

use lib '..';
use Figures::Figure;

package Figures::Triangle;
	our @ISA = "Figures::Figure";

	sub drawFigure {
		my $self = shift;
		my ($pAx, $pAy, $pBx, $pBy, $pCx, $pCy) = $self->calcInternalValues();
		$self->{cr}->move_to($pAx, $pAy);
		$self->{cr}->line_to($pBx, $pBy);
		$self->{cr}->line_to($pCx, $pCy);
		$self->{cr}->close_path();
		$self->{cr}->set_source_rgb(0.4, 0.4, 0.4);
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