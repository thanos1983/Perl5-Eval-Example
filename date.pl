#!/usr/bin/perl
use strict;
use warnings;
use DateTime;
use feature 'say';

foreach my $d (2012, 2013, 2014) {
    eval {
	my $dt = DateTime->new(
	    year   => $d,
	    month  => 10,
	    day    => 20,
	    hour   => 12,
	    time_zone => "America/Sao_Paulo"
	    );

	$dt->set_time_zone("floating");

	$dt->truncate( to => "day" );
	my $ymd = $dt->ymd;
	say $ymd;
        1;
    } or do {
        my $error = $@ || 'Unknown failure';
        warn "Could not parse '$d' - $error";
    };
}

__END__

$ perl date.pl
2012-10-20
2013-10-20
2014-10-20
