#!/usr/bin/perl

use v5.14;
use Switch;
use Helpers::Env;
use HTML::TextToHTML;

package Helpers::View;

	sub new {
		my $invocant = shift;
		my $class = ref($invocant) || $invocant;
		my $self = {
			environment => Helpers::Env->getEnvironment(),
		};
		bless($self, $class);
		return $self;
	}

	sub renderTop {
		my $self = shift;
		switch($self->{environment}){
			case /$Helpers::Env::Console/ {
				print "Console Top\n"; 
			}
			case /$Helpers::Env::Web/ {
				my $top = "Content-type: text/html\n\n"; 
				$top .= "<?xml version='1.0' encoding='iso-8859-1'?>";
				$top .= "<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Strict//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd\">";
				$top .= "<html>";
				$top .= "<head>";
				$top .= "<title>Ex</title>";
				$top .= "</head>";
				$top .= "<body style='background-color: #ccc;'>";
				print $top; 
			}
		}
	}

	sub renderContent {
		my $self = shift;
		my @args = @_;
		my $text = $args[0];
		switch($self->{environment}){
			case /$Helpers::Env::Console/ {
				print $text."\n";
			}
			case /$Helpers::Env::Web/ {
				my $conv = new HTML::TextToHTML();
				my $converted = $conv->process_chunk($text);
				print $converted . '<br>';
			}
		}
	}

	sub renderBottom {
		my $self = shift;
		switch($self->{environment}){
			case /$Helpers::Env::Console/ {
				print "Console Bottom\n"; 
			}
			case /$Helpers::Env::Web/ {
				print "</body>";
				print "</html>";
			}
		}
	}

	1;