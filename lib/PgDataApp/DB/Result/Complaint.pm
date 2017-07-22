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
  { data_type => "date", is_nullable => 1 },
  "case_contact_method",
  { data_type => "varchar", is_foreign_key => 1, is_nullable => 1 },
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
  "pc_invalid",
  { data_type => "boolean", is_nullable => 1 },
  "pc_timestamp",
  { data_type => "datetime", is_nullable => 1 },
  "pc_plant_code",
  { data_type => "varchar", is_nullable => 1 },
  "pc_line_number",
  { data_type => "varchar", is_nullable => 1 },
);
__PACKAGE__->set_primary_key("id");
__PACKAGE__->belongs_to(
  "case_contact_method",
  "PgDataApp::DB::Result::ContactMethod",
  { method => "case_contact_method" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "CASCADE",
    on_update     => "CASCADE",
  },
);


# Created by DBIx::Class::Schema::Loader v0.07045 @ 2017-07-22 19:31:48
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:jKhZ8LQL931iVAuEaiiAdg

use PgDataApp::Util ':all';

sub schema { (shift)->result_source->schema }

sub insert {
	my ($self, $columns) = @_;
	$self->set_inflated_columns($columns) if ($columns);
	
	if(my $method = $self->get_column('case_contact_method')) {
		$self->schema->resultset('ContactMethod')->find_or_create({ method => $method });
	}
	
	my $invalid_pc = undef;
	if (my $pc = $self->get_column('production_code')) {
		
		my $pc_meta = PgDataApp::Util->parse_prod_code( $pc );
		$invalid_pc = $pc_meta ? 0 : 1;
		
		unless($invalid_pc) {
			$self->pc_timestamp  ( $pc_meta->{datetime} );
			$self->pc_plant_code ( $pc_meta->{plant}    );
			$self->pc_line_number( $pc_meta->{line_no}  );
		}
	}
	
	$self->pc_invalid($invalid_pc);
	
	$self->next::method
}


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
