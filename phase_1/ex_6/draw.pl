#!/usr/bin/perl

use v5.14;

use lib '..';
use CGI;
use CGI::Carp qw(warningsToBrowser fatalsToBrowser); 
use Data::Dumper;
use Figures::FiguresAppFactory;
use Helpers::View;
use Helpers::Debug;
use Tools::Request;

my $debug = Helpers::Debug->new();
my %data = Tools::Request->getPostArrayData(("rectangle", "circle", "square", "triangle"));

my $view = Helpers::View->new();
$view->renderTop();

my $figure = Figures::FiguresAppFactory->new(%data);

my $result1 = $figure->drawFigure();
my $result2 = $figure->saveToFile('/var/www/html/imgs/figure.jpg');

#if ($result->{'status'} eq 'ok') {

#	print "Figure Type: " . $figure->{type} . '<br>';
	print "Figure Area: " . $figure->getArea() . '<br>';
#	print "Figure Draw: <br>";
	print "<img src='/imgs/figure.jpg' border='2'/>";

#} else {

#	print '<br>';
#	print "Errors where found !<br>";
#	print "Validations: <br>";
#	print Dumper $result->{'errors'};

#}

#my $rectAPointX = $data{'rectangle'}{'pointA'}{'x'};
#print Dumper $rectAPointX;
#print '<br><br>';

$view->renderBottom();
