#!/usr/bin/perl

use v5.14;

use Switch;
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
			print "<PRE>";
			print "Server Name:       $ENV{SERVER_NAME}\n";
			print "Listening on Port: $ENV{SERVER_PORT}\n";
			print "Server Software:   $ENV{SERVER_SOFTWARE}\n";
			print "Server Protocol:   $ENV{SERVER_PROTOCOL}\n";
			print "CGI Version:       $ENV{GATEWAY_INTERFACE}\n";
			print "</PRE>";
		} else {
			my $result = \&Data::Printer::p($_[0], colored => 1);
			print "\n";
			return;
		}
	}

	
	1;