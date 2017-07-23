use utf8;
package PgDataApp::DB::Result::QualityWindow;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';
__PACKAGE__->load_components("InflateColumn::DateTime");
__PACKAGE__->table("quality_window");
__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "datetime",
  { data_type => "datetime", is_nullable => 1 },
  "sample_date",
  { data_type => "date", is_nullable => 1 },
  "sample_time",
  { data_type => "varchar", is_nullable => 1 },
  "analyst",
  { data_type => "varchar", is_nullable => 1 },
  "line",
  { data_type => "varchar", is_nullable => 1 },
  "flavor",
  { data_type => "varchar", is_nullable => 1 },
  "odor_grade",
  { data_type => "varchar", is_nullable => 1 },
  "appearance",
  { data_type => "varchar", is_nullable => 1 },
  "koralone_bit",
  { data_type => "varchar", is_nullable => 1 },
  "density_sg",
  { data_type => "varchar", is_nullable => 1 },
  "color_l",
  { data_type => "varchar", is_nullable => 1 },
  "color_c",
  { data_type => "varchar", is_nullable => 1 },
  "color_h",
  { data_type => "varchar", is_nullable => 1 },
  "delta_e2000_abt",
  { data_type => "varchar", is_nullable => 1 },
  "delta_e2000_m_amp_r",
  { data_type => "varchar", is_nullable => 1 },
  "delta_e2000_lv",
  { data_type => "varchar", is_nullable => 1 },
  "delta_e2000_ha_ts",
  { data_type => "varchar", is_nullable => 1 },
  "delta_e2000_gfw_nz",
  { data_type => "varchar", is_nullable => 1 },
  "delta_e2000_go",
  { data_type => "varchar", is_nullable => 1 },
  "delta_e2000_mlb_wd",
  { data_type => "varchar", is_nullable => 1 },
  "ph",
  { data_type => "varchar", is_nullable => 1 },
  "active_matter_ni",
  { data_type => "varchar", is_nullable => 1 },
  "comments",
  { data_type => "varchar", is_nullable => 1 },
);
__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.07045 @ 2017-07-23 05:11:12
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:bP27oMG2y4HNdRgdaYzA+Q


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
