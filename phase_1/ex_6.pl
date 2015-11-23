#!/usr/bin/perl

use v5.14;

# use CGI qw(:standard);
# use CGI::Carp qw(warningsToBrowser fatalsToBrowser);
# use Data::Dumper::HTML qw(dumper_html);

use Helpers::View;
use Helpers::Debug;

my $view = Helpers::View->new();
my $debug = Helpers::Debug->new();

$view->setEnvironment();
$view->renderTop();

$view->renderContent('Hola');
$debug->print($view, $view->{environment});

$view->renderBottom();
