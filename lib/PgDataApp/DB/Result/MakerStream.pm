use utf8;
package PgDataApp::DB::Result::MakerStream;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';
__PACKAGE__->load_components("InflateColumn::DateTime");
__PACKAGE__->table("maker_stream");
__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "datetime",
  { data_type => "datetime", is_nullable => 1 },
  "a_kg_hr",
  { data_type => "decimal", is_nullable => 1 },
  "b_kg_hr",
  { data_type => "decimal", is_nullable => 1 },
  "c_kg_hr",
  { data_type => "decimal", is_nullable => 1 },
  "d_kg_hr",
  { data_type => "decimal", is_nullable => 1 },
  "e_kg_hr",
  { data_type => "decimal", is_nullable => 1 },
  "f_kg_hr",
  { data_type => "decimal", is_nullable => 1 },
  "g_kg_hr",
  { data_type => "decimal", is_nullable => 1 },
  "h_kg_hr",
  { data_type => "decimal", is_nullable => 1 },
  "i_kg_hr",
  { data_type => "decimal", is_nullable => 1 },
  "j_kg_hr",
  { data_type => "decimal", is_nullable => 1 },
  "k_kg_hr",
  { data_type => "decimal", is_nullable => 1 },
  "l_kg_hr",
  { data_type => "decimal", is_nullable => 1 },
  "m_kg_hr",
  { data_type => "decimal", is_nullable => 1 },
  "n_kg_hr",
  { data_type => "decimal", is_nullable => 1 },
  "o_kg_hr",
  { data_type => "decimal", is_nullable => 1 },
  "p_kg_hr",
  { data_type => "decimal", is_nullable => 1 },
  "q_kg_hr",
  { data_type => "decimal", is_nullable => 1 },
  "r_kg_hr",
  { data_type => "decimal", is_nullable => 1 },
  "s_kg_hr",
  { data_type => "decimal", is_nullable => 1 },
  "t_lbs_min",
  { data_type => "decimal", is_nullable => 1 },
  "u_lbs_min",
  { data_type => "decimal", is_nullable => 1 },
  "v_lbs_min",
  { data_type => "decimal", is_nullable => 1 },
  "w_lbs_min",
  { data_type => "decimal", is_nullable => 1 },
  "x_lbs_min",
  { data_type => "decimal", is_nullable => 1 },
  "y_lbs_min",
  { data_type => "decimal", is_nullable => 1 },
  "tank_1_f",
  { data_type => "decimal", is_nullable => 1 },
  "tank_2_f",
  { data_type => "decimal", is_nullable => 1 },
  "tank_3_f",
  { data_type => "decimal", is_nullable => 1 },
  "tank_4_f",
  { data_type => "decimal", is_nullable => 1 },
  "tank_5_c",
  { data_type => "decimal", is_nullable => 1 },
  "tank_6_f",
  { data_type => "decimal", is_nullable => 1 },
  "tank_7_f",
  { data_type => "decimal", is_nullable => 1 },
);
__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.07045 @ 2017-07-22 23:12:48
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Tcbh+yTA0CnIixJXWOnzGw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
