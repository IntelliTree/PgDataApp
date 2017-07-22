#!/usr/bin/env perl

use strict;
use warnings;

$| = 1;

use RapidApp::Util ':all';
#use Path::Class qw/file dir/;

my $dir = join(' ',@ARGV)  or die "missing input dir argument\n";
#my $Dir = dir($dir)->resolve;

use Spreadsheet::XLSX;

use FindBin;
use lib "$FindBin::Bin/../lib";

use PgDataApp;

for my $File (glob("$dir/*.xlsx")) {
	next unless (-f $File && "$File" =~ /\.xlsx$/);
	&_do_populate($File);
}


sub _do_populate {
	my $fn = shift;

  my $size = &_file_size($fn);

	print "Loading $fn ($size)... ";
	my $excel = Spreadsheet::XLSX->new($fn) or die "failed to open $fn excel file";
	print "done.\n";
	
	my @sheets = @{$excel->{Worksheet}};
	die "only support single sheets currently" unless (scalar(@sheets) == 1);
	my $sheet = $sheets[0];

  $sheet->{MaxCol} ||= $sheet->{MinCol};  
	$sheet->{MaxRow} ||= $sheet->{MinRow}; # copied from libs synopsis
	print "  $sheet->{Name} - MaxCol: $sheet->{MaxCol}, MaxRow: $sheet->{MaxRow} \n";
	
	my @columns;
	
	foreach my $col ($sheet->{MinCol} .. $sheet->{MaxCol}) {
		my $cell = $sheet->{Cells}[$sheet->{MinRow}][$col];
		my $header = $cell->{Val};
		my $column_name = lc($header);
		$column_name =~ s/\W+/_/g;
		
		push @columns, $column_name;
	}
	
	
	my @rows = (\@columns);
	
	foreach my $row (($sheet->{MinRow}+1) .. $sheet->{MaxRow}) {
	  my @cols;
		
	  $sheet->{MaxCol} ||= $sheet->{MinCol};            
		foreach my $col ($sheet->{MinCol} ..  $sheet->{MaxCol}) {   
		  my $cell = $sheet->{Cells}[$row][$col];
			my $val = $cell->{Val};
      push @cols, $val;
		}
		
		die "mismatch column count!" unless (scalar(@columns) == scalar(@cols));
		
		push @rows, \@cols;
	}
	
	my $ret = PgDataApp->model('DB::Complaint')->populate(\@rows);
	
}

sub _file_size {
	my $fn = shift;
	my ($dev,$ino,$mode,$nlink,$uid,$gid,$rdev,$size, $atime,$mtime,$ctime,$blksize,$blocks) = stat($fn);
	my $kb = int($size/1024);
	$kb > 1024 ? int($kb/1024) . 'M' : $kb . 'K' 
}


