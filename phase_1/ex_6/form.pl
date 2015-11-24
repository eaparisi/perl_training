#!/usr/bin/perl

use v5.14;

use lib '..';
use Helpers::View;

my $view = Helpers::View->new();

$view->renderTop();

print <<HTML;

	<br>
	<div><b>Figure type:</b></div>

	<form action ="draw.pl" method="post">
		<input type="radio" name="figure" value="contRectangleParams" checked>Rectangle<br>
		<input type="radio" name="figure" value="contSquareParams" checked>Square<br>
		<input type="radio" name="figure" value="contCircleParams" checked>Circle<br>
		<input type="radio" name="figure" value="contTriangleParams" checked>Triangle<br>
	
		<br><br>
	
		<div id="contRectangleParams" style="display:none">
			<div><b>Rectangle Params:</b></div>
			<input type="text" name="rectangle[pointA][x]" placeholder="Point A, X Coord"><input type="text" name="rectangle[pointA][y]" placeholder="Point A, Y Coord">Point A<br>
			<input type="text" name="rectangle[pointB][x]" placeholder="Point B, X Coord"><input type="text" name="rectangle[pointB][y]" placeholder="Point B, Y Coord">Point B<br>
		</div>
	
		<div id="contSquareParams" style="display:none">
			<div><b>Square Params:</b></div>
			<input type="text" name="square[pointA][x]" placeholder="Point A, X Coord"><input type="text" name="square[pointA][y]" placeholder="Point A, Y Coord">Point A<br>
			<input type="text" name="square[width][x]" placeholder="Width">Width<br>
		</div>
	
		<div id="contCircleParams" style="display:none">
			<div><b>Circle Params:</b></div>
			<input type="text" name="circle[center][x]" placeholder="Center Point, X Coord"><input type="text" name="circle[center][y]" placeholder="Center Point, Y Coord">Center Point<br>
			<input type="text" name="circle[perimeter][x]" placeholder="Perimeter Point, X Coord"><input type="text" name="circle[perimeter][y]" placeholder="Perimeter Point, Y Coord">Perimeter Point<br>
		</div>
	
		<div id="contTriangleParams" style="display:none">
			<div><b>Triangle Params:</b></div>
			<input type="text" name="triangle[pointA][x]" placeholder="Point A, X Coord"><input type="text" name="triangle[pointA][y]" placeholder="Point A, Y Coord">Point A<br>
			<input type="text" name="triangle[pointB][x]" placeholder="Point B, X Coord"><input type="text" name="triangle[pointB][y]" placeholder="Point B, Y Coord">Point B<br>
			<input type="text" name="triangle[pointC][x]" placeholder="Point C, X Coord"><input type="text" name="triangle[pointC][y]" placeholder="Point C, Y Coord">Point C<br>
		</div>
		
		<br><br>
		<input id="submitButton" type="submit" value="Submit" style="display:none">

	</form>
	
HTML

require 'inline_js.pl';

$view->renderBottom();
