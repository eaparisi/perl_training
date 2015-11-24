#!/usr/bin/perl

use v5.14;

use lib '..';
use Figures::Surface;

package Figures::Figure;
	our @ISA = "Figures::Surface";

	1;