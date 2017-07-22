--------------------------------------------------------------------------------
--   *** sql/pgdataapp.sql  --  DO NOT MOVE OR RENAME THIS FILE ***
-- 
-- Add your DDL here (i.e. CREATE TABLE statements)
-- 
-- To (re)initialize your SQLite database (pgdataapp.db) and (re)generate
-- your DBIC schema classes and update your base TableSpec configs, run this command
-- from your app home directory:
-- 
--    perl devel/model_DB_updater.pl --from-ddl --cfg
-- 
--------------------------------------------------------------------------------


CREATE TABLE [contact_method] (
	[method] varchar PRIMARY KEY NOT NULL
);

CREATE TABLE [complaint] (
  [id] INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  [initial_receipt_date] date,
  [case_contact_method] varchar,
  [summary] varchar,
  [case_region] varchar,
  [case_country] varchar,
  [sector] varchar,
  [sub_sector] varchar,
  [category] varchar,
  [brand] varchar,
  [segment] varchar,
  [sub_brand] varchar,
  [product_form_detail] varchar,
  [flavor_scent_detail] varchar,
  [collection] varchar,
  [version] varchar,
  [consumer_benefit_1] varchar,
  [consumer_benefit_2] varchar,
  [consumer_benefit_3] varchar,
  [consumer_benefit_4] varchar,
  [product_size] varchar,
  [unit_size] varchar,
  [production_code] varchar,
  [manufacturing_plant] varchar,
  [manufacturing_date] varchar,
  [manufacturing_line] varchar,
  [city] varchar,
  [state_province] varchar,
  [global_comment_path] varchar,
  [l1_comment_code_comment_type] varchar,
  [l2_comment_code_comment_category] varchar,
  [l3_comment_code_comment_description] varchar,
  [comment_criticality] varchar,
  [conclusion_code] varchar,
  [store_of_purchase] varchar,
  [complaint_metric] varchar,
	
	FOREIGN KEY ([case_contact_method]) REFERENCES [contact_method] ([method]) ON DELETE CASCADE ON UPDATE CASCADE
);

