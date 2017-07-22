#!/usr/bin/env perl

use strict;
use warnings;

$| = 1;

use RapidApp::Util ':all';
#use Path::Class qw/file dir/;

use FindBin;
use lib "$FindBin::Bin/../lib";

use PgDataApp::Util;

my $pc = $ARGV[0];

scream(
	PgDataApp::Util->parse_prod_code( $pc )
)


