use utf8;
package PgDataApp::DB::Result::Complaint;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';
__PACKAGE__->load_components("InflateColumn::DateTime");
__PACKAGE__->table("complaint");
__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "initial_receipt_date",
  { data_type => "varchar", is_nullable => 1 },
  "case_contact_method",
  { data_type => "varchar", is_nullable => 1 },
  "summary",
  { data_type => "varchar", is_nullable => 1 },
  "case_region",
  { data_type => "varchar", is_nullable => 1 },
  "case_country",
  { data_type => "varchar", is_nullable => 1 },
  "sector",
  { data_type => "varchar", is_nullable => 1 },
  "sub_sector",
  { data_type => "varchar", is_nullable => 1 },
  "category",
  { data_type => "varchar", is_nullable => 1 },
  "brand",
  { data_type => "varchar", is_nullable => 1 },
  "segment",
  { data_type => "varchar", is_nullable => 1 },
  "sub_brand",
  { data_type => "varchar", is_nullable => 1 },
  "product_form_detail",
  { data_type => "varchar", is_nullable => 1 },
  "flavor_scent_detail",
  { data_type => "varchar", is_nullable => 1 },
  "collection",
  { data_type => "varchar", is_nullable => 1 },
  "version",
  { data_type => "varchar", is_nullable => 1 },
  "consumer_benefit_1",
  { data_type => "varchar", is_nullable => 1 },
  "consumer_benefit_2",
  { data_type => "varchar", is_nullable => 1 },
  "consumer_benefit_3",
  { data_type => "varchar", is_nullable => 1 },
  "consumer_benefit_4",
  { data_type => "varchar", is_nullable => 1 },
  "product_size",
  { data_type => "varchar", is_nullable => 1 },
  "unit_size",
  { data_type => "varchar", is_nullable => 1 },
  "production_code",
  { data_type => "varchar", is_nullable => 1 },
  "manufacturing_plant",
  { data_type => "varchar", is_nullable => 1 },
  "manufacturing_date",
  { data_type => "varchar", is_nullable => 1 },
  "manufacturing_line",
  { data_type => "varchar", is_nullable => 1 },
  "city",
  { data_type => "varchar", is_nullable => 1 },
  "state_province",
  { data_type => "varchar", is_nullable => 1 },
  "global_comment_path",
  { data_type => "varchar", is_nullable => 1 },
  "l1_comment_code_comment_type",
  { data_type => "varchar", is_nullable => 1 },
  "l2_comment_code_comment_category",
  { data_type => "varchar", is_nullable => 1 },
  "l3_comment_code_comment_description",
  { data_type => "varchar", is_nullable => 1 },
  "comment_criticality",
  { data_type => "varchar", is_nullable => 1 },
  "conclusion_code",
  { data_type => "varchar", is_nullable => 1 },
  "store_of_purchase",
  { data_type => "varchar", is_nullable => 1 },
  "complaint_metric",
  { data_type => "varchar", is_nullable => 1 },
);
__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.07045 @ 2017-07-22 16:59:37
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:odmp7f+0QBeSyS8yB3Sodg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
