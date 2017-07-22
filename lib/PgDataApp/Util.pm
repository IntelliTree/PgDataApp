package PgDataApp::Util;

use strict;
use warnings;

use DateTime;
use RapidApp::Util ':all';

my $now_dt = DateTime->now( time_zone => 'local' );
my $cur_year = $now_dt->year . '';

my $cur_y      = substr($cur_year,3,1);
my $cur_y_pfx  = substr($cur_year,0,3);
my $prev_y_pfx = $cur_y_pfx - 1;

# PgDataApp::Util->parse_prod_code( 71071731051626 )

sub parse_prod_code {
	$_[0] && $_[0] eq __PACKAGE__ and shift;
	my $pc = shift or return undef;
	
	# invalid
	return -1 unless (
		($pc =~ /^\d+$/)
		&& length($pc) == 14
	);
	
	my $meta = {
		y_code  => substr($pc,0,1),
		jul     => substr($pc,1,3),
		plant   => substr($pc,4,4),
		line_no => substr($pc,8,2),
		hour    => substr($pc,10,2),
		minute  => substr($pc,12,2)
	};
	
	$meta->{year} = $meta->{y_code} <= $cur_y 
	  ? join('',$cur_y_pfx,$meta->{y_code})
		: join('',$prev_y_pfx,$meta->{y_code});
	
	my $dt = DateTime
		->new( year => $meta->{year}, month => 1, day => 1 )
		->add( days => ($meta->{jul} - 1)); 
	
	$meta->{datetime} = join(' ', $dt->ymd('-'),join(':',$meta->{hour},$meta->{minute},'00'));
		
	return $meta;
}


1;
