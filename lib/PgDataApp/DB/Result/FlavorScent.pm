use utf8;
package PgDataApp::DB::Result::FlavorScent;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';
__PACKAGE__->load_components("InflateColumn::DateTime");
__PACKAGE__->table("flavor_scent");
__PACKAGE__->add_columns("name", { data_type => "varchar", is_nullable => 0 });
__PACKAGE__->set_primary_key("name");
__PACKAGE__->has_many(
  "complaints",
  "PgDataApp::DB::Result::Complaint",
  { "foreign.flavor_scent_detail" => "self.name" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07045 @ 2017-07-22 20:08:58
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:CWUn4Bn2Sy6LWZXIA6lKXQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
