#!/usr/bin/perl

use v5.14;

use Helpers::View;
use Helpers::Debug;

my $view = Helpers::View->new();
my $debug = Helpers::Debug->new();

$view->renderTop();

my $content = "Hola\n";
$content .= "Juan";
$view->renderContent($content);
$debug->print($view);

$view->renderBottom();

