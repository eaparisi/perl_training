#!/usr/bin/perl

use v5.14;

use Cairo;
use Helpers::View;

my $surface = Cairo::ImageSurface->create ('argb32', 600, 600);
my $cr = Cairo::Context->create ($surface);
 
$cr->rectangle(10, 10, 100, 100);
$cr->set_source_rgb(0, 0, 0);
$cr->fill;
 
$cr->rectangle(100, 100, 150, 40);
$cr->set_source_rgb(1, 1, 1);
$cr->fill;
 
$cr->rectangle(100, 200, 450, 90);
$cr->set_source_rgb(0.1,0.2,0.9);
$cr->fill;
 
$cr->show_page;
 
$surface->write_to_png ('/var/www/html/imgs/output.jpg');

# ---------------------------------------------- VIEW ---------------------------------------

my $view = Helpers::View->new();
$view->renderTop();

print "<img src='/imgs/output.jpg'/>";

$view->renderBottom();