--------------------------------------------------------------------------------
--   *** sql/pgdataapp.sql  --  DO NOT MOVE OR RENAME THIS FILE ***
-- 
-- Add your DDL here (i.e. CREATE TABLE statements)
-- 
-- To (re)initialize your SQLite database (pgdataapp.db) and (re)generate
-- your DBIC schema classes and update your base TableSpec configs, run this command
-- from your app home directory:
-- 
--    perl devel/model_DB_updater.pl --from-ddl --cfg --go
-- 
--------------------------------------------------------------------------------


CREATE TABLE [contact_method] (
	[method] varchar PRIMARY KEY NOT NULL
);

CREATE TABLE [country] (
	[name] varchar PRIMARY KEY NOT NULL
);

CREATE TABLE [flavor_scent] (
	[name] varchar PRIMARY KEY NOT NULL
);

CREATE TABLE [store] (
	[name] varchar PRIMARY KEY NOT NULL
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
	
	[pc_invalid] boolean,
	[pc_timestamp] datetime,
	[pc_plant_code] varchar,
	[pc_line_number] varchar,
	
	FOREIGN KEY ([case_contact_method]) REFERENCES [contact_method] ([method]) ON DELETE RESTRICT ON UPDATE CASCADE,
	FOREIGN KEY ([case_country])        REFERENCES [country] ([name])          ON DELETE RESTRICT ON UPDATE CASCADE,
	FOREIGN KEY ([flavor_scent_detail]) REFERENCES [flavor_scent] ([name])     ON DELETE RESTRICT ON UPDATE CASCADE,
	FOREIGN KEY ([store_of_purchase])   REFERENCES [store] ([name])            ON DELETE RESTRICT ON UPDATE CASCADE
	
);


CREATE TABLE [maker_stream] (
  [id] INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  [datetime] datetime,
  [a_kg_hr] decimal,
  [b_kg_hr] decimal,
  [c_kg_hr] decimal,
  [d_kg_hr] decimal,
  [e_kg_hr] decimal,
  [f_kg_hr] decimal,
  [g_kg_hr] decimal,
  [h_kg_hr] decimal,
  [i_kg_hr] decimal,
  [j_kg_hr] decimal,
  [k_kg_hr] decimal,
  [l_kg_hr] decimal,
  [m_kg_hr] decimal,
  [n_kg_hr] decimal,
  [o_kg_hr] decimal,
  [p_kg_hr] decimal,
  [q_kg_hr] decimal,
  [r_kg_hr] decimal,
  [s_kg_hr] decimal,
  [t_lbs_min] decimal,
  [u_lbs_min] decimal,
  [v_lbs_min] decimal,
  [w_lbs_min] decimal,
  [x_lbs_min] decimal,
  [y_lbs_min] decimal,
  [tank_1_f] decimal,
  [tank_2_f] decimal,
  [tank_3_f] decimal,
  [tank_4_f] decimal,
  [tank_5_c] decimal,
  [tank_6_f] decimal,
  [tank_7_f] decimal
);


