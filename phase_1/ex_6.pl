#!/usr/bin/perl

use v5.14;

# use CGI qw(:standard);
# use CGI::Carp qw(warningsToBrowser fatalsToBrowser);
use Helpers::View;
use Data::Dumper::HTML qw(dumper_html);

my $view = Helpers::View->new();

$view->setEnvironment();
$view->renderTop();
$view->renderContent('Hola');

$view->renderBottom();
