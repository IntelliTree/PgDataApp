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
CREATE INDEX [complaint_receipt_date] ON [complaint] ([initial_receipt_date]);


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
  [tank_7_f] decimal,
	[day] date
);
CREATE INDEX [maker_dt] ON [maker_stream] ([datetime]);
CREATE INDEX [maker_day] ON [maker_stream] ([day]);

DROP TABLE IF EXISTS [maker_stream_day_avg];
CREATE TABLE [maker_stream_day_avg] (
  [id] INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  [day] date,
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
CREATE INDEX [maker_day_avg_day] ON [maker_stream_day_avg] ([day]);

DROP TABLE IF EXISTS [packaging_downtime];
CREATE TABLE [packaging_downtime] (
  [id] INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  [start_time] datetime,
  [line] varchar,
  [machine] varchar,
  [downtime] decimal,
  [uptime] decimal,
  [brandcode] varchar,
  [team] varchar,
  [shift] varchar,
  [master_line_state] varchar,
  [line_state] varchar,
  [line_substate] varchar,
  [is_constraint] varchar,
  [cause_levels_1_name] varchar,
  [cause_levels_2_name] varchar,
  [cause_levels_3_name] varchar,
  [cause_levels_4_name] varchar,
  [entered_cause] varchar,
  [auto_cause] varchar,
  [lost_production] decimal,
  [processor_speed] varchar,
  [is_excluded] varchar,
  [operator_comment] varchar,
  [prod_log_is_excluded] varchar,
  [scheduled_time] decimal,
  [actual_rate] varchar,
  [is_blocked_starved] varchar,
  [is_blocked] varchar,
  [is_starved] varchar,
  [is_closed] varchar,
  [sequence_number] varchar,
  [is_edited] varchar,
  [auto_cause_levels_1] varchar,
  [auto_cause_levels_2] varchar,
  [auto_cause_levels_3] varchar,
  [auto_cause_levels_4] varchar,
  [plc_code] varchar,
  [cause_group_1] varchar,
  [cause_group_2] varchar,
  [cause_group_3] varchar,
  [cause_group_4] varchar,
  [impact] varchar,
  [line_stops] varchar,
  [is_stop] varchar,
  [spare_1] varchar,
  [spare_2] varchar,
  [spare_3] varchar,
  [spare_4] varchar,
  [brandcode2] varchar,
  [brandname] varchar,
  [department] varchar,
  [size] varchar,
  [production_unit_of_measure] varchar,
  [scrap_unit_of_measure] varchar,
  [stat_case_conversion] varchar,
  [scrap_to_production_factor] varchar,
  [is_active] varchar,
  [is_new] varchar,
  [mod_date] varchar,
  [country] varchar,
  [units_per_case] varchar,
  [weight_range] varchar,
  [upc_code] varchar,
  [num_size] varchar,
  [bom_key] varchar,
  [plc_code2] varchar,
  [brandgroup] varchar,
  [sap_material_no] varchar,
  [formula] varchar,
  [can_supplier] varchar,
  [case_supplier] varchar,
  [tray_supplier] varchar,
  [bottle_supplier] varchar,
  [carton_supplier] varchar,
  [labels_supplier] varchar,
  [caps_supplier] varchar,
  [sprayer_supplier] varchar,
  [glue_supplier] varchar,
  [spout_supplier] varchar,
  [sap_uom] varchar,
  [sap_uom_conversion] varchar,
  [dollars_per_case] varchar,
  [mavcontainerwt] varchar,
  [markedcontainerwt] varchar,
  [lab_formula] varchar,
  [lab_formula_gcas] varchar,
  [cont_supplier] varchar,
  [scoop_supplier] varchar,
  [image_file] varchar,
  [brandfamily] varchar,
  [gpd_node_id] varchar,
  [weight_check_uom] varchar,
  [maxmarkedvolume] varchar,
  [business_unit] varchar,
  [department_bc] varchar
);
CREATE INDEX [downtime_start_time_dt] ON [packaging_downtime] ([start_time]);
CREATE INDEX [downtime_downtime] ON [packaging_downtime] ([downtime]);
CREATE INDEX [downtime_uptime] ON [packaging_downtime] ([uptime]);

DROP TABLE IF EXISTS [quality_window];
CREATE TABLE [quality_window] (
  [id] INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
--  [date_yyyy_mm_dd] varchar,
--  [time_hh_mm_ss] varchar,
  [datetime] datetime,
  [sample_date] date,
  [sample_time] varchar,
  [analyst] varchar,
  [line] varchar,
  [flavor] varchar,
  [odor_grade] varchar,
  [appearance] varchar,
  [koralone_bit] varchar,
  [density_sg] varchar,
  [color_l] varchar,
  [color_c] varchar,
  [color_h] varchar,
  [delta_e2000_abt] varchar,
  [delta_e2000_m_amp_r] varchar,
  [delta_e2000_lv] varchar,
  [delta_e2000_ha_ts] varchar,
  [delta_e2000_gfw_nz] varchar,
  [delta_e2000_go] varchar,
  [delta_e2000_mlb_wd] varchar,
  [ph] varchar,
  [active_matter_ni] varchar,
  [comments] varchar
);
CREATE INDEX [qw_dt] ON [quality_window] ([datetime]);
CREATE INDEX [qw_sample_date] ON [quality_window] ([sample_date]);


