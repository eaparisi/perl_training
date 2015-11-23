#!/usr/bin/perl

use v5.14;

use Switch;

package Helpers::View;

	our $Console = 'Console';
	our $Web = 'Web';

	sub new {
		my $invocant = shift;
		my $class = ref($invocant) || $invocant;
		my $self = {
			environment => $Console,
			@_, # Override previous attributes
		};
		return bless $self, $class;
	}

	sub setEnvironment {
		my $self = shift;
		my $environment = $Console;
		if ($ENV{HTTP_HOST}) {
			$environment = $Web;
		}
		$self->{environment} = $environment;
	}

	sub renderTop {
		my $self = shift;
		switch($self->{environment}){
			case /$Console/ {
				print "Console Top\n"; 
			}
			case /$Web/ {
				print "Content-type: text/html\n\n"; 
				print "<?xml version='1.0' encoding='iso-8859-1'?>";
				print "<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Strict//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd\">";
				print "<html>";
				print "<head>";
				print "<title>Ex</title>";
				print "</head>";
				print "<body style='background-color: #ccc;'>";
			}
		}
	}

	sub renderContent {
		my $self = shift;
		my @args = @_;
		switch($self->{environment}){
			case /$Console/ {
				print $args[0]."\n";
				return;
			}
			case /$Web/ {
				print $args[0].'<br>';
				return;
			}
		}
	}

	sub renderBottom {
		my $self = shift;
		switch($self->{environment}){
			case /$Console/ {
				print "Console Bottom\n"; 
			}
			case /$Web/ {
				print "</body>";
				print "</html>";
			}
		}
	}

	1;