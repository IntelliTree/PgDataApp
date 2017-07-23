#!/usr/bin/env perl

use strict;
#use warnings;

$| = 1;

use Spreadsheet::XLSX;
use Path::Class qw/file dir/;

use RapidApp::Util ':all';

## time find raw_data/ -name *.xlsx -exec devel/xls_to_tsv.pl {} \;

#my $fn = $ARGV[0] or die "missing input file argument\n";
my $fn = join(' ',@ARGV)  or die "missing input file argument\n";


&_dump_tsv($fn);


################################

sub _dump_tsv {
	my $fn = shift;

  my $size = &_file_size($fn);

	print "Loading $fn ($size)... ";
	my $excel = Spreadsheet::XLSX->new($fn) or die "failed to open $fn excel file";
	print "done.\n";
	
	my $tsvfn = &_get_tsv_filename($fn);
	open (my $fh, ">", "$tsvfn") or die "cannot open > $tsvfn: $!";
	
	print "Opened $tsvfn for writing...\n";
	
	my @sheets = @{$excel->{Worksheet}};
	
	for my $sheet (@sheets) {
	
	$sheet->{MaxRow} ||= $sheet->{MinRow}; # copied from libs synopsis
	print "  $sheet->{Name} - MaxCol: $sheet->{MaxCol}, MaxRow: $sheet->{MaxRow} \n";

	foreach my $row ($sheet->{MinRow} .. $sheet->{MaxRow}) {
	  my @cols;
		
	  $sheet->{MaxCol} ||= $sheet->{MinCol};            
		foreach my $col ($sheet->{MinCol} ..  $sheet->{MaxCol}) {   
		  my $cell = $sheet->{Cells}[$row][$col];
			
			my $val = $cell->{Val};
			
			# just in case the data has a tab:
			$val =~ s/\t/   /g;
      
      # or a newline:
      $val =~ s/\r?\n/\v/g;
      push @cols, $val;
		}
		
		print $fh join("\t",@cols) . "\n";
	}
  }
	
	close $fh;
}





sub _get_tsv_filename {
	my $fn = shift;
	
	$fn =~ /\.xlsx$/ or die "not an xlsx file";
	
	my $tsvfn = $fn;
	$tsvfn =~ s/\.xlsx$/\.tsv/;
	
	$tsvfn
}

sub _file_size {
	my $fn = shift;
	my ($dev,$ino,$mode,$nlink,$uid,$gid,$rdev,$size, $atime,$mtime,$ctime,$blksize,$blocks) = stat($fn);
	my $kb = int($size/1024);
	$kb > 1024 ? int($kb/1024) . 'M' : $kb . 'K' 
}