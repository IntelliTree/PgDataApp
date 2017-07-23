#!/usr/bin/env perl

use strict;
use warnings;

$| = 1;

## time find raw_data/ -name *.tsv -exec devel/load_maker_streams.pl {} \;

use RapidApp::Util ':all';
use DateTime;

my $dt1900 = DateTime->new(
  year => 1900, day => 1, month => 1,
	hour => 0, minute => 0, second => 1
);

my $file = join(' ',@ARGV)  or die "missing input file argument\n";

die "not tsv" unless ($file =~ /\.tsv$/);

use FindBin;
use lib "$FindBin::Bin/../lib";

use PgDataApp;

&_do_populate($file);



sub _do_populate {
	my $fn = shift;

	open (my $fh, "<", "$fn") or die "cannot open > $fn: $!";
	
	my $topline = $fh->getline;
	
	my @columns = map {
		$_ =~ s/\W+/_/g;
		$_ =~ s/\_$//;
		lc($_)
	} split(/\t/,$topline);
	
	push @columns, 'day';
	
	my @rows = (\@columns);
	
	while (my $line = $fh->getline) {
		my @cols = map {
			($_ && $_ eq '(null)') ? undef : $_
		} split(/\t/,$line);

		$cols[0] = &_decode_xls_date($cols[0]);
		
		# day column:
		push @cols, substr($cols[0],0,10);
		
		die "mismatch column count!" unless (scalar(@columns) == scalar(@cols));
		
		push @rows, \@cols;
	}
	
	PgDataApp->model('DB::MakerStream')->populate(\@rows);
}

sub _decode_xls_date {
	my $str = shift;
	
	my ($days,$frac) = split(/\./,$str,2);
	
	my $dt = $dt1900->clone->add( days => $days );
	
	if($frac) {
		my $secs = int(24*60*60*('0.'.$frac));
		$dt = $dt->add( seconds => $secs );
	}
	
	my $date = join(' ',$dt->ymd('-'),$dt->hms(':'));
	
	return $date
}


sub _file_size {
	my $fn = shift;
	my ($dev,$ino,$mode,$nlink,$uid,$gid,$rdev,$size, $atime,$mtime,$ctime,$blksize,$blocks) = stat($fn);
	my $kb = int($size/1024);
	$kb > 1024 ? int($kb/1024) . 'M' : $kb . 'K' 
}


