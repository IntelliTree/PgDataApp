use utf8;
package PgDataApp::DB::Result::PackagingDowntime;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';
__PACKAGE__->load_components("InflateColumn::DateTime");
__PACKAGE__->table("packaging_downtime");
__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "start_time",
  { data_type => "datetime", is_nullable => 1 },
  "line",
  { data_type => "varchar", is_nullable => 1 },
  "machine",
  { data_type => "varchar", is_nullable => 1 },
  "downtime",
  { data_type => "decimal", is_nullable => 1 },
  "uptime",
  { data_type => "decimal", is_nullable => 1 },
  "brandcode",
  { data_type => "varchar", is_nullable => 1 },
  "team",
  { data_type => "varchar", is_nullable => 1 },
  "shift",
  { data_type => "varchar", is_nullable => 1 },
  "master_line_state",
  { data_type => "varchar", is_nullable => 1 },
  "line_state",
  { data_type => "varchar", is_nullable => 1 },
  "line_substate",
  { data_type => "varchar", is_nullable => 1 },
  "is_constraint",
  { data_type => "varchar", is_nullable => 1 },
  "cause_levels_1_name",
  { data_type => "varchar", is_nullable => 1 },
  "cause_levels_2_name",
  { data_type => "varchar", is_nullable => 1 },
  "cause_levels_3_name",
  { data_type => "varchar", is_nullable => 1 },
  "cause_levels_4_name",
  { data_type => "varchar", is_nullable => 1 },
  "entered_cause",
  { data_type => "varchar", is_nullable => 1 },
  "auto_cause",
  { data_type => "varchar", is_nullable => 1 },
  "lost_production",
  { data_type => "decimal", is_nullable => 1 },
  "processor_speed",
  { data_type => "varchar", is_nullable => 1 },
  "is_excluded",
  { data_type => "varchar", is_nullable => 1 },
  "operator_comment",
  { data_type => "varchar", is_nullable => 1 },
  "prod_log_is_excluded",
  { data_type => "varchar", is_nullable => 1 },
  "scheduled_time",
  { data_type => "decimal", is_nullable => 1 },
  "actual_rate",
  { data_type => "varchar", is_nullable => 1 },
  "is_blocked_starved",
  { data_type => "varchar", is_nullable => 1 },
  "is_blocked",
  { data_type => "varchar", is_nullable => 1 },
  "is_starved",
  { data_type => "varchar", is_nullable => 1 },
  "is_closed",
  { data_type => "varchar", is_nullable => 1 },
  "sequence_number",
  { data_type => "varchar", is_nullable => 1 },
  "is_edited",
  { data_type => "varchar", is_nullable => 1 },
  "auto_cause_levels_1",
  { data_type => "varchar", is_nullable => 1 },
  "auto_cause_levels_2",
  { data_type => "varchar", is_nullable => 1 },
  "auto_cause_levels_3",
  { data_type => "varchar", is_nullable => 1 },
  "auto_cause_levels_4",
  { data_type => "varchar", is_nullable => 1 },
  "plc_code",
  { data_type => "varchar", is_nullable => 1 },
  "cause_group_1",
  { data_type => "varchar", is_nullable => 1 },
  "cause_group_2",
  { data_type => "varchar", is_nullable => 1 },
  "cause_group_3",
  { data_type => "varchar", is_nullable => 1 },
  "cause_group_4",
  { data_type => "varchar", is_nullable => 1 },
  "impact",
  { data_type => "varchar", is_nullable => 1 },
  "line_stops",
  { data_type => "varchar", is_nullable => 1 },
  "is_stop",
  { data_type => "varchar", is_nullable => 1 },
  "spare_1",
  { data_type => "varchar", is_nullable => 1 },
  "spare_2",
  { data_type => "varchar", is_nullable => 1 },
  "spare_3",
  { data_type => "varchar", is_nullable => 1 },
  "spare_4",
  { data_type => "varchar", is_nullable => 1 },
  "brandcode2",
  { data_type => "varchar", is_nullable => 1 },
  "brandname",
  { data_type => "varchar", is_nullable => 1 },
  "department",
  { data_type => "varchar", is_nullable => 1 },
  "size",
  { data_type => "varchar", is_nullable => 1 },
  "production_unit_of_measure",
  { data_type => "varchar", is_nullable => 1 },
  "scrap_unit_of_measure",
  { data_type => "varchar", is_nullable => 1 },
  "stat_case_conversion",
  { data_type => "varchar", is_nullable => 1 },
  "scrap_to_production_factor",
  { data_type => "varchar", is_nullable => 1 },
  "is_active",
  { data_type => "varchar", is_nullable => 1 },
  "is_new",
  { data_type => "varchar", is_nullable => 1 },
  "mod_date",
  { data_type => "varchar", is_nullable => 1 },
  "country",
  { data_type => "varchar", is_nullable => 1 },
  "units_per_case",
  { data_type => "varchar", is_nullable => 1 },
  "weight_range",
  { data_type => "varchar", is_nullable => 1 },
  "upc_code",
  { data_type => "varchar", is_nullable => 1 },
  "num_size",
  { data_type => "varchar", is_nullable => 1 },
  "bom_key",
  { data_type => "varchar", is_nullable => 1 },
  "plc_code2",
  { data_type => "varchar", is_nullable => 1 },
  "brandgroup",
  { data_type => "varchar", is_nullable => 1 },
  "sap_material_no",
  { data_type => "varchar", is_nullable => 1 },
  "formula",
  { data_type => "varchar", is_nullable => 1 },
  "can_supplier",
  { data_type => "varchar", is_nullable => 1 },
  "case_supplier",
  { data_type => "varchar", is_nullable => 1 },
  "tray_supplier",
  { data_type => "varchar", is_nullable => 1 },
  "bottle_supplier",
  { data_type => "varchar", is_nullable => 1 },
  "carton_supplier",
  { data_type => "varchar", is_nullable => 1 },
  "labels_supplier",
  { data_type => "varchar", is_nullable => 1 },
  "caps_supplier",
  { data_type => "varchar", is_nullable => 1 },
  "sprayer_supplier",
  { data_type => "varchar", is_nullable => 1 },
  "glue_supplier",
  { data_type => "varchar", is_nullable => 1 },
  "spout_supplier",
  { data_type => "varchar", is_nullable => 1 },
  "sap_uom",
  { data_type => "varchar", is_nullable => 1 },
  "sap_uom_conversion",
  { data_type => "varchar", is_nullable => 1 },
  "dollars_per_case",
  { data_type => "varchar", is_nullable => 1 },
  "mavcontainerwt",
  { data_type => "varchar", is_nullable => 1 },
  "markedcontainerwt",
  { data_type => "varchar", is_nullable => 1 },
  "lab_formula",
  { data_type => "varchar", is_nullable => 1 },
  "lab_formula_gcas",
  { data_type => "varchar", is_nullable => 1 },
  "cont_supplier",
  { data_type => "varchar", is_nullable => 1 },
  "scoop_supplier",
  { data_type => "varchar", is_nullable => 1 },
  "image_file",
  { data_type => "varchar", is_nullable => 1 },
  "brandfamily",
  { data_type => "varchar", is_nullable => 1 },
  "gpd_node_id",
  { data_type => "varchar", is_nullable => 1 },
  "weight_check_uom",
  { data_type => "varchar", is_nullable => 1 },
  "maxmarkedvolume",
  { data_type => "varchar", is_nullable => 1 },
  "business_unit",
  { data_type => "varchar", is_nullable => 1 },
  "department_bc",
  { data_type => "varchar", is_nullable => 1 },
);
__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.07045 @ 2017-07-23 03:27:34
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Pz/Izrnpwrrw3hTURKScpA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
