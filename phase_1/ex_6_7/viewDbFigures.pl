#!/usr/bin/perl

use v5.14;

use lib '..';
use DBI;
use Helpers::View;
use Helpers::Debug;
use CGI;
use CGI::Carp qw(warningsToBrowser fatalsToBrowser); 
use Storable qw(freeze thaw);
use Figures::FiguresAppFactory;


my $debug = Helpers::Debug->new();
my $view = Helpers::View->new();
$view->renderTop();

print "<a href='form.pl'>Return</a><br><br>";

my $dbh = DBI->connect('DBI:mysql:training;host=mysql', 'root', 'mydb1234', { RaiseError => 1 } );

my $sth = $dbh->prepare('
	SELECT COUNT(*)
	FROM information_schema.tables 
	WHERE table_schema = \'training\' 
	AND table_name = \'figures\';
');
$sth->execute();
my @resultTB = $sth->fetchrow_array();
my $existsDB = $resultTB[0];

if ($existsDB == 1) {
	$sth = $dbh->prepare('SELECT * FROM figures');
	# my $sth = $dbh->prepare('SELECT * FROM figures WHERE figure=\'Circle\'');
	$sth->execute();
	
	while (my @result = $sth->fetchrow_array()) {
		my $params = Storable::thaw($result[2]);
		my $filename = 'figure' . rand(10000) . '.jpg';
		my $sysPathfilename = '/var/www/html/imgs/' . $filename;
		my $webPathfilename = '/imgs/' . $filename;
		my $figure = Figures::FiguresAppFactory->new(%{$params});
		$figure->drawFigure();
		$figure->saveToFile($sysPathfilename);
		print "Id: " . $result[0] . ' ';
		print "<img src='$webPathfilename' widht='80' height='60' border='2' style = 'vertical-align: middle; margin: 5px;'/>";
		print " - Figure: " . $result[1];
		print " - Area: " . $figure->getArea();;
		print '<br>';
	}
} else {
	print 'DB not exists!';
}

$dbh->disconnect();

$view->renderBottom();