#!/usr/bin/perl

use v5.14;

use lib '..';
use CGI;
use CGI::Carp qw(warningsToBrowser fatalsToBrowser); 
use Data::Dumper;
use Figures::FiguresAppFactory;
use Helpers::View;
use Tools::Request;

# Get And Set Figure params
my %params = Tools::Request->getPostArrayData(("rectangle", "circle", "square", "triangle"));
$params{"imgWidth"} = 800;
$params{"imgHeight"} = 600;

my $view = Helpers::View->new();
$view->renderTop();

my $figure = Figures::FiguresAppFactory->new(%params);
$figure->drawFigure();
$figure->saveToFile('/var/www/html/imgs/figure.jpg');
$figure->saveToDB();

print "Figure Area: " . $figure->getArea();
print " - <a href='form.pl'>Return</a><br><br>";
print '<br>';
print "<img src='/imgs/figure.jpg' border='2'/>";

$view->renderBottom();
