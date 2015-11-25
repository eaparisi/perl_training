#!/usr/bin/perl

use v5.14;

use lib '..';
use DBI;
use Helpers::View;
use Helpers::Debug;
use CGI;
use CGI::Carp qw(warningsToBrowser fatalsToBrowser); 


my $debug = Helpers::Debug->new();
my $view = Helpers::View->new();
$view->renderTop();

print "<a href='form.pl'>Return</a><br><br>";

my $dbh = DBI->connect('DBI:mysql:training;host=mysql', 'root', 'mydb1234', { RaiseError => 1 } );

my $sth = $dbh->prepare('drop table if exists figures;');
$sth->execute();
$dbh->disconnect();

print 'Done!';

$view->renderBottom();