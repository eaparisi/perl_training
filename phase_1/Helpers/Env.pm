#!/usr/bin/perl

use v5.14;

use Switch;

package Helpers::Env;

	our $Console = 'Console';
	our $Web = 'Web';

	sub new {
		my $invocant = shift;
		my $class = ref($invocant) || $invocant;
		my $environment = $Console;
		if ($ENV{HTTP_HOST}) {
			$environment = $Web;
		}
		my $self = {
			environment => $environment,
			@_, # Override previous attributes
		};
		return bless $self, $class;
	}
	
	1;