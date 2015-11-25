#!/usr/bin/perl

use v5.14;
use strict;

use lib '..';
use Figures::Rectangle;
use Figures::Square;
use Figures::Circle;
use Figures::Triangle;

package Figures::FiguresAppFactory;

	sub new {
		shift;
		my %data = @_;
		my $className = 'Figures::'.$data{'figure'};
		my $figure = $className->new(@_);
		return $figure;
	}

	1;