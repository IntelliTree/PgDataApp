package PgDataApp::Model::DB;
use Moo;
extends 'Catalyst::Model::DBIC::Schema';
with 'RapidApp::Util::Role::ModelDBIC';

use strict;
use warnings;

use Path::Class qw(file);
use RapidApp::Util ':all';
my $db_path = file( RapidApp::Util::find_app_home('PgDataApp'), 'pgdataapp.db' );
sub _sqlt_db_path { "$db_path" };    # exposed for use by the regen devel script

__PACKAGE__->config(
  schema_class => 'PgDataApp::DB',

  connect_info => {
    dsn             => "dbi:SQLite:$db_path",
    user            => '',
    password        => '',
    quote_names     => q{1},
    sqlite_unicode  => q{1},
    on_connect_call => q{use_foreign_keys},
  },

  # Configs for the RapidApp::RapidDbic Catalyst Plugin:
  RapidDbic => {

    # use only the relationship column of a foreign-key and hide the
    # redundant literal column when the names are different:
    hide_fk_columns => 1,

    # The grid_class is used to automatically setup a module for each source in the
    # navtree with the grid_params for each source supplied as its options.
    grid_class  => 'PgDataApp::Module::GridBase',
    grid_params => {
      # The special '*defaults' key applies to all sources at once
      '*defaults' => {
        include_colspec => ['*'],    #<-- default already ['*']
        ## uncomment these lines to turn on editing in all grids
        #updatable_colspec   => ['*'],
        #creatable_colspec   => ['*'],
        #destroyable_relspec => ['*'],
        extra_extconfig => {
          store_button_cnf => {
            save => { showtext => 1 },
            undo => { showtext => 1 }
          }
        }
      }
    },

    # TableSpecs define extra RapidApp-specific metadata for each source
    # and is used/available to all modules which interact with them
    TableSpecs => {
      Complaint => {
        display_column => 'id',
        title          => 'Complaint',
        title_multi    => 'Complaint Rows',
        iconCls        => 'ra-icon-pg',
        multiIconCls   => 'ra-icon-pg-multi',
        columns        => {
          id => {
            allow_add => 0,
            header    => 'id',
            #width => 100,
            #renderer => 'RA.ux.App.someJsFunc',
            #profiles => [],
          },
          initial_receipt_date => {
            header => 'initial_receipt_date',
            #width => 100,
            #renderer => 'RA.ux.App.someJsFunc',
            #profiles => [],
          },
          case_contact_method => {
            header => 'case_contact_method',
            #width => 100,
            #renderer => 'RA.ux.App.someJsFunc',
            #profiles => [],
          },
          summary => {
            header => 'summary',
            #width => 100,
            #renderer => 'RA.ux.App.someJsFunc',
            #profiles => [],
          },
          case_region => {
            header => 'case_region',
            #width => 100,
            #renderer => 'RA.ux.App.someJsFunc',
            #profiles => [],
          },
          case_country => {
            header => 'case_country',
            #width => 100,
            #renderer => 'RA.ux.App.someJsFunc',
            #profiles => [],
          },
          sector => {
            header => 'sector',
            #width => 100,
            #renderer => 'RA.ux.App.someJsFunc',
            #profiles => [],
          },
          sub_sector => {
            header => 'sub_sector',
            #width => 100,
            #renderer => 'RA.ux.App.someJsFunc',
            #profiles => [],
          },
          category => {
            header => 'category',
            #width => 100,
            #renderer => 'RA.ux.App.someJsFunc',
            #profiles => [],
          },
          brand => {
            header => 'brand',
            #width => 100,
            #renderer => 'RA.ux.App.someJsFunc',
            #profiles => [],
          },
          segment => {
            header => 'segment',
            #width => 100,
            #renderer => 'RA.ux.App.someJsFunc',
            #profiles => [],
          },
          sub_brand => {
            header => 'sub_brand',
            #width => 100,
            #renderer => 'RA.ux.App.someJsFunc',
            #profiles => [],
          },
          product_form_detail => {
            header => 'product_form_detail',
            #width => 100,
            #renderer => 'RA.ux.App.someJsFunc',
            #profiles => [],
          },
          flavor_scent_detail => {
            header => 'flavor_scent_detail',
            #width => 100,
            #renderer => 'RA.ux.App.someJsFunc',
            #profiles => [],
          },
          collection => {
            header => 'collection',
            #width => 100,
            #renderer => 'RA.ux.App.someJsFunc',
            #profiles => [],
          },
          version => {
            header => 'version',
            #width => 100,
            #renderer => 'RA.ux.App.someJsFunc',
            #profiles => [],
          },
          consumer_benefit_1 => {
            header => 'consumer_benefit_1',
            #width => 100,
            #renderer => 'RA.ux.App.someJsFunc',
            #profiles => [],
          },
          consumer_benefit_2 => {
            header => 'consumer_benefit_2',
            #width => 100,
            #renderer => 'RA.ux.App.someJsFunc',
            #profiles => [],
          },
          consumer_benefit_3 => {
            header => 'consumer_benefit_3',
            #width => 100,
            #renderer => 'RA.ux.App.someJsFunc',
            #profiles => [],
          },
          consumer_benefit_4 => {
            header => 'consumer_benefit_4',
            #width => 100,
            #renderer => 'RA.ux.App.someJsFunc',
            #profiles => [],
          },
          product_size => {
            header => 'product_size',
            #width => 100,
            #renderer => 'RA.ux.App.someJsFunc',
            #profiles => [],
          },
          unit_size => {
            header => 'unit_size',
            #width => 100,
            #renderer => 'RA.ux.App.someJsFunc',
            #profiles => [],
          },
          production_code => {
            header => 'production_code',
            #width => 100,
            #renderer => 'RA.ux.App.someJsFunc',
            #profiles => [],
          },
          manufacturing_plant => {
            header => 'manufacturing_plant',
            #width => 100,
            #renderer => 'RA.ux.App.someJsFunc',
            #profiles => [],
          },
          manufacturing_date => {
            header => 'manufacturing_date',
            #width => 100,
            #renderer => 'RA.ux.App.someJsFunc',
            #profiles => [],
          },
          manufacturing_line => {
            header => 'manufacturing_line',
            #width => 100,
            #renderer => 'RA.ux.App.someJsFunc',
            #profiles => [],
          },
          city => {
            header => 'city',
            #width => 100,
            #renderer => 'RA.ux.App.someJsFunc',
            #profiles => [],
          },
          state_province => {
            header => 'state_province',
            #width => 100,
            #renderer => 'RA.ux.App.someJsFunc',
            #profiles => [],
          },
          global_comment_path => {
            header => 'global_comment_path',
            #width => 100,
            #renderer => 'RA.ux.App.someJsFunc',
            #profiles => [],
          },
          l1_comment_code_comment_type => {
            header => 'l1_comment_code_comment_type',
            #width => 100,
            #renderer => 'RA.ux.App.someJsFunc',
            #profiles => [],
          },
          l2_comment_code_comment_category => {
            header => 'l2_comment_code_comment_category',
            #width => 100,
            #renderer => 'RA.ux.App.someJsFunc',
            #profiles => [],
          },
          l3_comment_code_comment_description => {
            header => 'l3_comment_code_comment_description',
            #width => 100,
            #renderer => 'RA.ux.App.someJsFunc',
            #profiles => [],
          },
          comment_criticality => {
            header => 'comment_criticality',
            #width => 100,
            #renderer => 'RA.ux.App.someJsFunc',
            #profiles => [],
          },
          conclusion_code => {
            header => 'conclusion_code',
            #width => 100,
            #renderer => 'RA.ux.App.someJsFunc',
            #profiles => [],
          },
          store_of_purchase => {
            header => 'store_of_purchase',
            #width => 100,
            #renderer => 'RA.ux.App.someJsFunc',
            #profiles => [],
          },
          complaint_metric => {
            header => 'complaint_metric',
            #width => 100,
            #renderer => 'RA.ux.App.someJsFunc',
            #profiles => [],
          },
        },
      },
      ContactMethod => {
        display_column => 'method',
        title          => 'ContactMethod',
        title_multi    => 'ContactMethod Rows',
        iconCls        => 'ra-icon-pg',
        multiIconCls   => 'ra-icon-pg-multi',
        columns        => {
          method => {
            header => 'method',
            #width => 100,
            #renderer => 'RA.ux.App.someJsFunc',
            #profiles => [],
          },
          complaints => {
            header => 'complaints',
            #width => 100,
            #sortable => 1,
            #renderer => 'RA.ux.App.someJsFunc',
            #profiles => [],
          },
        },
      },
    },
  },

);

## ------
## Uncomment these lines to have the schema auto-deployed during
## application startup when the sqlite db file is missing:
#before 'setup' => sub {
#  my $self = shift;
#  return if (-f $db_path);
#  $self->schema_class->connect($self->connect_info->{dsn})->deploy;
#};
## ------

=head1 NAME

PgDataApp::Model::DB - Catalyst/RapidApp DBIC Schema Model

=head1 SYNOPSIS

See L<PgDataApp>

=head1 DESCRIPTION

L<Catalyst::Model::DBIC::Schema> Model using schema L<PgDataApp::DB>

=head1 GENERATED BY

Catalyst::Helper::Model::DBIC::Schema::ForRapidDbic - 0.65

=head1 AUTHOR

Henry Van Styn

=head1 LICENSE

This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
