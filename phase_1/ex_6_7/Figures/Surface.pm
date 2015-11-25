#!/usr/bin/perl

use v5.14;

use Cairo;
use DBI;
use Storable qw(freeze thaw);

package Figures::Surface;

	sub new {
		my $invocant = shift;
		my $class = ref($invocant) || $invocant;
		my %data = @_;
		my $surface = Cairo::ImageSurface->create('argb32', $data{"imgWidth"}, $data{"imgHeight"});
		my $cr = Cairo::Context->create($surface);
		my $self = {
			surface => $surface,
			cr => $cr,
			data => \%data,
		};
		bless($self, $class);
		return $self;		
	}

	sub saveToFile {
		my $self = shift;
		my $file = $_[0];
		$self->{cr}->show_page;
		$self->{surface}->write_to_png($file);
	}

	sub saveToDB {

		my $self = shift;

		my $dbh = DBI->connect('DBI:mysql:training;host=mysql', 'root', 'mydb1234', { RaiseError => 1 } );
		$dbh->do('
			CREATE TABLE IF NOT EXISTS figures (
				`id` int(11) NOT NULL AUTO_INCREMENT, 
				`figure` VARCHAR(50) NOT NULL, 
				`params` TEXT NOT NULL,
				PRIMARY KEY (`id`)
			);
		');
		my $serialized_data = Storable::freeze($self->{data});
		my $figure = $self->{data}->{'figure'};
		$dbh->do('INSERT INTO `figures` (`figure`, `params`) VALUES (?, ?)', undef, $figure, $serialized_data);
	}

	1;