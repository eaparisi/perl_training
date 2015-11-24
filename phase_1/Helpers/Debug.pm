#!/usr/bin/perl

use v5.14;

use Helpers::Env;
use Data::Printer;

package Helpers::Debug;

	sub new {
		my $invocant = shift;
		my $class = ref($invocant) || $invocant;
		my $self = {
			environment => Helpers::Env->getEnvironment(),
		};
		return bless $self, $class;
	}

	sub print {
		my $self = shift;
		if ($self->{environment} eq $Helpers::Env::Web) {
			my $text = Data::Printer::np($_[0], colored => 0)."\n";
			print "<PRE>";
			print $text;
			print "</PRE>";
		} else {
			print "\n";
			my $result = \&Data::Printer::p($_[0], colored => 1);
			print "\n";
			return;
		}
	}

	
	1;