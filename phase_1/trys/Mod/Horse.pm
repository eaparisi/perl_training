#!/usr/bin/perl

package Mod::Horse;

sub new {
	my $invocant = shift;
	my $class = ref($invocant) || $invocant;
	my $self = {
		color => "bay",
		legs => 4,
		owner => undef,
		@_, # Override previous attributes
	};
	return bless $self, $class;
}

sub clone {
	my $model = shift;
	my $self = $model->new(%$model, @_);
	return $self; # Previously blessed by –>new
}

1;