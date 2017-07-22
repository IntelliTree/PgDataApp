use utf8;
package PgDataApp::DB::Result::ContactMethod;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';
__PACKAGE__->load_components("InflateColumn::DateTime");
__PACKAGE__->table("contact_method");
__PACKAGE__->add_columns("method", { data_type => "varchar", is_nullable => 0 });
__PACKAGE__->set_primary_key("method");
__PACKAGE__->has_many(
  "complaints",
  "PgDataApp::DB::Result::Complaint",
  { "foreign.case_contact_method" => "self.method" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07045 @ 2017-07-22 18:10:26
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:mta2uNtQp/8jlPfij+bqog


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
