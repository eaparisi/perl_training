#!/usr/bin/perl

use v5.14;
use CGI;

package Tools::Request;

	sub getPostArrayData {
		shift;
		my $req = new CGI;
		my %data;
		foreach my $fig (@_) {
			for my $param_name ($req->param()) {
			   if (my ($level_1, $level_2) = $param_name =~ /^$fig\[(\w+)\]\[(\w+)\]\z/) {
			      $data{$fig}{$level_1}{$level_2} = $req->param($param_name);
			   }
			}
		}
		$data{'figure'} = $req->param('figure');
		$data{'figure'} =~ s/cont//;
		$data{'figure'} =~ s/Params//;
		return %data;
	}

	1;