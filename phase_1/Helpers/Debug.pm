#!/usr/bin/perl

use v5.14;

use Switch;

package Helpers::Debug;

	sub new {
		my $invocant = shift;
		my $class = ref($invocant) || $invocant;
		my $self = {};
		return bless $self, $class;
	}

	sub print {
		my $self = shift;
		use Data::Printer;
		p($_[0]);
		p($_[1]);
#		my $environment = $_[1];
#		if ($environment == 'Web') {
#			use Data::Dumper::HTML qw(dumper_html);
#			print dumper_html($_[0]);
#			return;
#		} else {
#			use Data::Printer;
#			p($_[0]);
#			return;
#		}
	}

	
	1;