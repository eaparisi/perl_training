#!/usr/bin/perl

use v5.14;
use Switch;

package Helpers::Env;

	our $Console = 'Console';
	our $Web = 'Web';

	sub getEnvironment  {
		my $environment = $Console;
		if ($ENV{HTTP_HOST}) {
			$environment = $Web;
		}
		return $environment;
	}

	1;