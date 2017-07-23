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
	
	my $Rs = $c
		->model('DB::MakerStreamDayAvg')
		->search_rs(undef,{
			result_class => 'DBIx::Class::ResultClass::HashRefInflator',
			columns => [qw/day a_kg_hr b_kg_hr c_kg_hr d_kg_hr e_kg_hr complaints all_comments/],
			order_by => { -asc => 'me.day' }
		});
		
	if (my $after = $c->req->params->{after}) {
		$Rs = $Rs->search_rs({ 'me.day' => { '>=' => $after }})
	}
	
	if (my $before = $c->req->params->{before}) {
		$Rs = $Rs->search_rs({ 'me.day' => { '<=' => $before }})
	}
	
	[ $Rs->all ];

}

1;
