#!/usr/bin/perl

use v5.14;

use Cairo;
use Data::Dumper qw(Dumper);
use Data::Dumper::HTML qw(dumper_html);
use Data::TreeDumper;
use Data::TreeDumper::Renderer::DHTML;

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

my $arRef = [
	[1,2,3],
	[4,5,6],
	[7,8,9],
];

my $style ;
my $body = DumpTree (
	$arRef,
	'Tree',
	DISPLAY_ROOT_ADDRESS => 0,
	DISPLAY_PERL_ADDRESS => 1,
	DISPLAY_PERL_SIZE => 0,
	RENDERER => {
		NAME => 'DHTML',
		STYLE => \$style,
		BUTTON => {
			COLLAPSE_EXPAND => 1,
			SEARCH => 1,
		},
	},
);

# ---------------------------------------------- VIEW ---------------------------------------

print "Content-type: text/html\n\n";
print <<htmlcode;
<?xml version="1.0" encoding="iso-8859-1"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
	<head>
		<title>Ex</title>
		$style
	</head>
	<body style='background-color: #ccc;'>
htmlcode

print $body;

print qq{<div style="font-family: monospace">\n};
print dumper_html($arRef);
print "\n</div>\n";
 
print '<br>';
print Dumper $arRef;
print '<br>';

print "<img src='/imgs/output.jpg'/>";

print <<htmlcode;
	</body>
</html>
htmlcode