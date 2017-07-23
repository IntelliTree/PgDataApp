package PgDataApp::Template::Access;

use strict;
use warnings;

use RapidApp::Util qw(:all);

use Moo;

extends 'RapidApp::Template::Access';

around 'get_template_vars' => sub {
  my ($orig,$self,@args) = @_;

  my $vars = $self->$orig(@args);
  
  # Return with special/extra vars:
  return { 
    %$vars, 
    line_chart_data_json => encode_json_utf8( $self->_line_chart_data )
  };
};


sub _line_chart_data {
	my $self = shift;
	
	my $c = RapidApp->active_request_context;
	
	my @rows = $c
		->model('DB::MakerStreamDayAvg')
		->search_rs(undef,{
			result_class => 'DBIx::Class::ResultClass::HashRefInflator'
		})
		->all;
		
		return \@rows
}

1;
