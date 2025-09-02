-- [2025-09-02 12:16:36] completed in 16 ms on d08


-- alpassint.tb_coc_amo definition

-- Drop table

-- DROP TABLE alpassint.tb_coc_amo;

CREATE TABLE alpassint.tb_coc_amo (
	amo_ref_no varchar(23) NOT NULL,
	amo_qty numeric(15) NOT NULL,
	amo_calb varchar(2) NOT NULL,
	orgn_cd varchar(20) NULL,
	del_yn varchar(1) NOT NULL,
	use_yn varchar(1) NOT NULL,
	frst_regst_id varchar(50) NOT NULL,
	frst_rgsr_dttm timestamp NOT NULL,
	last_chpr_id varchar(50) NOT NULL,
	last_chg_dttm timestamp NOT NULL,
	amo_mnfc_yy varchar(5) NULL,
	white_yn varchar(1) NULL,
	CONSTRAINT tb_coc_amo_pk PRIMARY KEY (amo_ref_no)
);


-- alpassint.tb_coc_arm definition

-- Drop table

-- DROP TABLE alpassint.tb_coc_arm;

CREATE TABLE alpassint.tb_coc_arm (
	arm_ref_no varchar(23) NOT NULL,
	arm_srno varchar(30) NULL,
	arm_mx_cp_ch numeric(10) NULL,
	arm_cd varchar(3) NULL,
	orgn_cd varchar(20) NULL,
	del_yn varchar(1) NOT NULL,
	use_yn varchar(1) NOT NULL,
	frst_regst_id varchar(50) NOT NULL,
	frst_rgsr_dttm timestamp NOT NULL,
	last_chpr_id varchar(50) NOT NULL,
	last_chg_dttm timestamp NOT NULL,
	arm_stts varchar(2) NULL,
	CONSTRAINT tb_coc_arm_pk PRIMARY KEY (arm_ref_no)
);


-- alpassint.tb_coc_brq definition

-- Drop table

-- DROP TABLE alpassint.tb_coc_brq;

CREATE TABLE alpassint.tb_coc_brq (
	brq_ref_no varchar(70) NOT NULL,
	sctr_cd varchar(20) NOT NULL,
	orgn_cd varchar(20) NOT NULL,
	brq_dt varchar(8) NOT NULL,
	dptm_cd varchar(20) NOT NULL,
	dptm_nm varchar(255) NOT NULL,
	inf_type varchar(200) NOT NULL,
	brq_dt_tm timestamp NULL,
	brq_post_cd varchar(20) NULL,
	brq_post_nm varchar(255) NULL,
	brq_post_nm_sup varchar(255) NULL,
	brq_tch_inf varchar(4000) NOT NULL,
	brq_dclr_no varchar(70) NULL,
	brq_prcd varchar(4000) NOT NULL,
	inry_dptr_port varchar(200) NULL,
	inry_arv_port varchar(200) NULL,
	inry_ship_nm varchar(200) NULL,
	inry_vyg_dt varchar(8) NULL,
	amnd_val numeric(40, 2) NOT NULL,
	amnd_jrdq_txt varchar(4000) NOT NULL,
	cmrc_regs_no varchar(20) NULL,
	nif_no varchar(20) NULL,
	del_yn varchar(1) NOT NULL,
	frst_regst_id varchar(50) NOT NULL,
	frst_rgsr_dttm timestamp NOT NULL,
	last_chpr_id varchar(50) NOT NULL,
	last_chg_dttm timestamp NOT NULL,
	brq_tp varchar(3) NOT NULL,
	brq_long numeric(10, 7) NULL,
	brq_lat numeric(10, 7) NULL,
	vldt_stts varchar(2) NULL,
	atch_file_id varchar(60) NULL,
	typ_vyg varchar(20) NULL,
	dlvr_regs_no varchar(8) NULL,
	cmpny_nm varchar(500) NULL,
	cmpny_typ varchar(10) NULL,
	cmpny_addr varchar(4000) NULL,
	curr_cd varchar(3) NULL,
	CONSTRAINT tb_coc_brq_pk PRIMARY KEY (brq_ref_no)
);
CREATE INDEX tb_coc_brq_ix01 ON alpassint.tb_coc_brq USING btree (brq_ref_no);
CREATE INDEX tb_coc_brq_ix02 ON alpassint.tb_coc_brq USING btree (sctr_cd);
CREATE INDEX tb_coc_brq_ix03 ON alpassint.tb_coc_brq USING btree (orgn_cd);
CREATE INDEX tb_coc_brq_ix04 ON alpassint.tb_coc_brq USING btree (brq_dt);
CREATE INDEX tb_coc_brq_ix05 ON alpassint.tb_coc_brq USING btree (brq_tp);

-- Table Triggers
/*
create trigger trigger_tb_coc_brq_update before
update
    on
    alpassint.tb_coc_brq for each row execute function alpassint.tb_coc_brq_update_history();

*/
-- alpassint.tb_coc_brq_cag_h definition

-- Drop table

-- DROP TABLE alpassint.tb_coc_brq_cag_h;

CREATE TABLE alpassint.tb_coc_brq_cag_h (
	hist_id serial4 NOT NULL,
	brq_cag_ref_no bigserial NOT NULL,
	brq_ref_no varchar(70) NOT NULL,
	cag_tp varchar(70) NULL,
	cag_qty numeric(22) NULL,
	cag_wg varchar(70) NULL,
	cag_frd_val_unit varchar(100) NULL,
	cag_frd_val_ttl varchar(100) NULL,
	cag_ctg varchar(5) NULL,
	update_by varchar(60) NULL,
	update_at timestamp DEFAULT now() NULL,
	curr_cd varchar(3) NULL,
	CONSTRAINT tb_coc_brq_cag_h_pkey PRIMARY KEY (hist_id)
);


-- alpassint.tb_coc_brq_emp_h definition

-- Drop table

-- DROP TABLE alpassint.tb_coc_brq_emp_h;

CREATE TABLE alpassint.tb_coc_brq_emp_h (
	hist_id serial4 NOT NULL,
	brq_emp_ref_no bigserial NOT NULL,
	brq_ref_no varchar(70) NOT NULL,
	emp_pbsr_no varchar(70) NOT NULL,
	emp_fmnm varchar(70) NULL,
	emp_nm varchar(200) NULL,
	emp_fonc_nm varchar(70) NULL,
	emp_grd_nm varchar(70) NULL,
	update_at timestamp DEFAULT now() NULL,
	CONSTRAINT tb_coc_brq_emp_h_pkey PRIMARY KEY (hist_id)
);


-- alpassint.tb_coc_brq_h definition

-- Drop table

-- DROP TABLE alpassint.tb_coc_brq_h;

CREATE TABLE alpassint.tb_coc_brq_h (
	hist_id serial4 NOT NULL,
	brq_ref_no varchar(70) NOT NULL,
	sctr_cd varchar(20) NOT NULL,
	orgn_cd varchar(20) NOT NULL,
	brq_dt varchar(8) NOT NULL,
	dptm_cd varchar(20) NOT NULL,
	dptm_nm varchar(255) NOT NULL,
	inf_type varchar(200) NOT NULL,
	brq_dt_tm timestamp NULL,
	brq_post_cd varchar(20) NULL,
	brq_post_nm varchar(255) NULL,
	brq_post_nm_sup varchar(255) NULL,
	brq_tch_inf varchar(4000) NOT NULL,
	brq_dclr_no varchar(70) NULL,
	brq_prcd varchar(4000) NOT NULL,
	inry_dptr_port varchar(200) NULL,
	inry_arv_port varchar(200) NULL,
	inry_ship_nm varchar(200) NULL,
	inry_vyg_dt varchar(8) NULL,
	amnd_val numeric(40, 2) NOT NULL,
	amnd_jrdq_txt varchar(4000) NOT NULL,
	cmrc_regs_no varchar(20) NULL,
	nif_no varchar(20) NULL,
	del_yn varchar(1) NOT NULL,
	frst_regst_id varchar(50) NOT NULL,
	frst_rgsr_dttm timestamp NOT NULL,
	last_chpr_id varchar(50) NOT NULL,
	last_chg_dttm timestamp NOT NULL,
	brq_tp varchar(3) NOT NULL,
	brq_long numeric(10, 7) NULL,
	brq_lat numeric(10, 7) NULL,
	vldt_stts varchar(2) NULL,
	atch_file_id varchar(60) NULL,
	update_at timestamp DEFAULT now() NULL,
	update_by varchar(50) NULL,
	typ_vyg varchar(20) NULL,
	dlvr_regs_no varchar(8) NULL,
	curr_cd varchar(3) NULL,
	cmpny_addr varchar(4000) NULL,
	CONSTRAINT tb_coc_brq_h_pkey PRIMARY KEY (hist_id)
);


-- alpassint.tb_coc_brq_inc_acc definition

-- Drop table

-- DROP TABLE alpassint.tb_coc_brq_inc_acc;

CREATE TABLE alpassint.tb_coc_brq_inc_acc (
	inc_acc_ref_no varchar(70) NOT NULL,
	sctr_cd varchar(20) NOT NULL,
	orgn_cd varchar(20) NOT NULL,
	inc_acc_dt varchar(8) NOT NULL,
	dptm_cd varchar(20) NOT NULL,
	dptm_nm varchar(255) NOT NULL,
	inc_acc_sbjct varchar(200) NOT NULL,
	inc_acc_dt_tm timestamp NULL,
	inc_acc_dtl varchar(4000) NOT NULL,
	inc_acc_type varchar(3) NOT NULL,
	del_yn varchar(1) NOT NULL,
	frst_regst_id varchar(50) NOT NULL,
	frst_rgsr_dttm timestamp NOT NULL,
	last_chpr_id varchar(50) NOT NULL,
	last_chg_dttm timestamp NOT NULL,
	vldt_stts varchar(2) NULL,
	atch_file_id varchar(60) NULL,
	brq_lat numeric(10, 7) NULL,
	brq_long numeric(10, 7) NULL,
	CONSTRAINT tb_coc_brq_inc_acc_pk PRIMARY KEY (inc_acc_ref_no)
);
CREATE INDEX tb_coc_brq_inc_acc_ix01 ON alpassint.tb_coc_brq_inc_acc USING btree (inc_acc_ref_no);
CREATE INDEX tb_coc_brq_inc_acc_ix02 ON alpassint.tb_coc_brq_inc_acc USING btree (sctr_cd);
CREATE INDEX tb_coc_brq_inc_acc_ix03 ON alpassint.tb_coc_brq_inc_acc USING btree (orgn_cd);
CREATE INDEX tb_coc_brq_inc_acc_ix04 ON alpassint.tb_coc_brq_inc_acc USING btree (inc_acc_dt);
CREATE INDEX tb_coc_brq_inc_acc_ix05 ON alpassint.tb_coc_brq_inc_acc USING btree (inc_acc_type);

-- Table Triggers
/*
create trigger trigger_tb_coc_brq_inc_acc_update before
update
    on
    alpassint.tb_coc_brq_inc_acc for each row execute function alpassint.tb_coc_brq_inc_acc_update_history();
*/

-- alpassint.tb_coc_brq_inc_acc_h definition

-- Drop table

-- DROP TABLE alpassint.tb_coc_brq_inc_acc_h;

CREATE TABLE alpassint.tb_coc_brq_inc_acc_h (
	hist_id serial4 NOT NULL,
	inc_acc_ref_no varchar(70) NOT NULL,
	sctr_cd varchar(20) NOT NULL,
	orgn_cd varchar(20) NOT NULL,
	inc_acc_dt varchar(8) NOT NULL,
	dptm_cd varchar(20) NOT NULL,
	dptm_nm varchar(255) NOT NULL,
	inc_acc_sbjct varchar(200) NOT NULL,
	inc_acc_dt_tm timestamp NULL,
	inc_acc_dtl varchar(4000) NOT NULL,
	inc_acc_type varchar(3) NOT NULL,
	del_yn varchar(1) NOT NULL,
	frst_regst_id varchar(50) NOT NULL,
	frst_rgsr_dttm timestamp NOT NULL,
	last_chpr_id varchar(50) NOT NULL,
	last_chg_dttm timestamp NOT NULL,
	vldt_stts varchar(2) NULL,
	atch_file_id varchar(60) NULL,
	update_by varchar(60) NULL,
	update_at timestamp DEFAULT now() NULL,
	brq_lat numeric(10, 7) NULL,
	brq_long numeric(10, 7) NULL,
	CONSTRAINT tb_coc_brq_inc_acc_h_pkey PRIMARY KEY (hist_id)
);


-- alpassint.tb_coc_brq_prsn_h definition

-- Drop table

-- DROP TABLE alpassint.tb_coc_brq_prsn_h;

CREATE TABLE alpassint.tb_coc_brq_prsn_h (
	hist_id serial4 NOT NULL,
	brq_prsn_ref_no bigserial NOT NULL,
	brq_ref_no varchar(70) NOT NULL,
	brq_prsn_tp_cd varchar(3) NOT NULL,
	prsn_nm varchar(200) NOT NULL,
	prsn_fm_nm varchar(200) NOT NULL,
	prsn_rgsr_no varchar(70) NULL,
	prsn_nat_nm varchar(100) NULL,
	prsn_post_cd varchar(70) NULL,
	prsn_post_nm varchar(200) NULL,
	prsn_post_nm_sup varchar(255) NULL,
	prsn_brdy varchar(8) NULL,
	prsn_age varchar(3) NULL,
	prsn_gndr varchar(1) NULL,
	typ_doc varchar(2) NULL,
	update_at timestamp DEFAULT now() NULL,
	dlv_dt varchar(8) NULL,
	dlv_agncy varchar(100) NULL,
	CONSTRAINT tb_coc_brq_prsn_h_pkey PRIMARY KEY (hist_id)
);


-- alpassint.tb_coc_brq_trnp_h definition

-- Drop table

-- DROP TABLE alpassint.tb_coc_brq_trnp_h;

CREATE TABLE alpassint.tb_coc_brq_trnp_h (
	hist_id serial4 NOT NULL,
	brq_trnp_ref_no bigserial NOT NULL,
	brq_ref_no varchar(70) NOT NULL,
	trnp_tp varchar(70) NULL,
	trnp_mt varchar(23) NULL,
	trnp_chss_no varchar(30) NULL,
	trnp_prtr varchar(100) NULL,
	trnp_val varchar(100) NULL,
	update_at timestamp DEFAULT now() NULL,
	curr_cd varchar(3) NULL,
	CONSTRAINT tb_coc_brq_trnp_h_pkey PRIMARY KEY (hist_id)
);


-- alpassint.tb_coc_brq_vldt definition

-- Drop table

-- DROP TABLE alpassint.tb_coc_brq_vldt;

CREATE TABLE alpassint.tb_coc_brq_vldt (
	brq_vldt_ref_no bigserial NOT NULL,
	brq_ref_no varchar(70) NOT NULL,
	id_user varchar(70) NOT NULL,
	pbsr_no varchar(70) NULL,
	emp_nm varchar(200) NULL,
	emp_fmnm varchar(200) NULL,
	sctr_cd varchar(70) NULL,
	sctr_nm varchar(70) NULL,
	frst_regst_id varchar(50) NOT NULL,
	frst_rgsr_dttm timestamp NOT NULL,
	last_chpr_id varchar(50) NOT NULL,
	last_chg_dttm timestamp NOT NULL,
	CONSTRAINT tb_coc_brq_vldt_pk PRIMARY KEY (brq_vldt_ref_no)
);


-- alpassint.tb_coc_eqip definition

-- Drop table

-- DROP TABLE alpassint.tb_coc_eqip;

CREATE TABLE alpassint.tb_coc_eqip (
	eqip_ref_no varchar(23) NOT NULL,
	eqip_invn_no varchar(50) NOT NULL,
	eqip_nm varchar(2) NULL,
	eqip_tp varchar(8) NULL,
	eqip_desc varchar(4000) NULL,
	eqip_stts varchar(2) NOT NULL,
	orgn_cd varchar(20) NULL,
	del_yn varchar(1) NOT NULL,
	use_yn varchar(1) NOT NULL,
	frst_regst_id varchar(50) NOT NULL,
	frst_rgsr_dttm timestamp NOT NULL,
	last_chpr_id varchar(50) NOT NULL,
	last_chg_dttm timestamp NOT NULL,
	CONSTRAINT tb_coc_eqip_pk PRIMARY KEY (eqip_ref_no)
);


-- alpassint.tb_coc_oprn definition

-- Drop table

-- DROP TABLE alpassint.tb_coc_oprn;

CREATE TABLE alpassint.tb_coc_oprn (
	oprn_ref_no varchar(23) NOT NULL,
	orgn_reff_no varchar(50) NULL,
	oprn_title varchar(400) NULL,
	oprn_stts varchar(2) NULL,
	oprn_tp varchar(2) NULL,
	oprn_addr varchar(255) NULL,
	oprn_dpt_dttm timestamp NULL,
	oprn_strt_dttm timestamp NULL,
	oprn_end_dttm timestamp NULL,
	oprn_bck_dttm timestamp NULL,
	oprn_lat numeric(10, 7) NULL,
	oprn_long numeric(10, 7) NULL,
	del_yn varchar(1) NOT NULL,
	use_yn varchar(1) NOT NULL,
	frst_regst_id varchar(50) NOT NULL,
	frst_rgsr_dttm timestamp NOT NULL,
	last_chpr_id varchar(50) NOT NULL,
	last_chg_dttm timestamp NOT NULL,
	orgn_cd varchar(20) NULL,
	colab_nm varchar NULL,
	oprn_st varchar(2) NULL,
	oprn_cncl_rsn varchar NULL,
	CONSTRAINT tb_coc_oprn_pk PRIMARY KEY (oprn_ref_no)
);

-- Table Triggers
/*
create trigger column_update_trigger after
update
    of oprn_st on
    alpassint.tb_coc_oprn for each row execute function alpassint.notify_oprn_update();
create trigger oprn_st_update_trigger after
update
    of oprn_st on
    alpassint.tb_coc_oprn for each row execute function alpassint.notify_oprn_st_change();
*/

-- alpassint.tb_coc_rprt definition

-- Drop table

-- DROP TABLE alpassint.tb_coc_rprt;

CREATE TABLE alpassint.tb_coc_rprt (
	rprt_ref_no varchar(23) NOT NULL,
	rprt_tp_cd varchar(3) NOT NULL,
	orgn_cd varchar(25) NOT NULL,
	rprt_inf_ntr varchar(255) NOT NULL,
	rprt_inf_dttm timestamp NOT NULL,
	rprt_inf_plc varchar(255) NOT NULL,
	rprt_inf_tch varchar(4000) NOT NULL,
	dclr_no varchar(255) NULL,
	rprt_inf_prcd varchar(4000) NOT NULL,
	rprt_inf_amd varchar(20) NOT NULL,
	curr_cd varchar(3) NOT NULL,
	rprt_inf_jrdq_txt varchar(4000) NOT NULL,
	atch_file_id varchar(60) NULL,
	cag_val_ttl numeric(40, 2) NULL,
	oprn_ref_no varchar(23) NULL,
	del_yn varchar(1) NOT NULL,
	use_yn varchar(1) NOT NULL,
	frst_regst_id varchar(50) NOT NULL,
	frst_rgsr_dttm timestamp NOT NULL,
	last_chpr_id varchar(50) NOT NULL,
	last_chg_dttm timestamp NOT NULL,
	rprt_lat numeric(10, 7) NULL,
	rprt_long numeric(10, 7) NULL,
	vldt_stts varchar(2) NULL,
	unknown_yn varchar(1) NULL,
	chng_yn varchar(1) NULL,
	chng_rsn varchar(4000) NULL,
	CONSTRAINT tb_coc_rprt_pk PRIMARY KEY (rprt_ref_no)
);

-- Table Triggers

create trigger trigger_tb_coc_rprt_update before
update
    on
    alpassint.tb_coc_rprt for each row execute function alpassint.tb_coc_rprt_update_history();


-- alpassint.tb_coc_rprt_h definition

-- Drop table

-- DROP TABLE alpassint.tb_coc_rprt_h;

CREATE TABLE alpassint.tb_coc_rprt_h (
	hist_id serial4 NOT NULL,
	rprt_ref_no varchar(23) NOT NULL,
	rprt_tp_cd varchar(3) NOT NULL,
	orgn_cd varchar(25) NOT NULL,
	rprt_inf_ntr varchar(255) NOT NULL,
	rprt_inf_dttm timestamp NOT NULL,
	rprt_inf_plc varchar(255) NOT NULL,
	rprt_inf_tch varchar(4000) NOT NULL,
	dclr_no varchar(255) NULL,
	rprt_inf_prcd varchar(4000) NOT NULL,
	rprt_inf_amd varchar(20) NOT NULL,
	curr_cd varchar(3) NOT NULL,
	rprt_inf_jrdq_txt varchar(4000) NOT NULL,
	atch_file_id varchar(60) NULL,
	cag_val_ttl numeric(40, 2) NULL,
	oprn_ref_no varchar(23) NULL,
	del_yn varchar(1) NOT NULL,
	use_yn varchar(1) NOT NULL,
	frst_regst_id varchar(50) NOT NULL,
	frst_rgsr_dttm timestamp NOT NULL,
	last_chpr_id varchar(50) NOT NULL,
	last_chg_dttm timestamp NOT NULL,
	rprt_lat numeric(10, 7) NULL,
	rprt_long numeric(10, 7) NULL,
	vldt_stts varchar(2) NULL,
	unknown_yn varchar(1) NULL,
	chng_yn varchar(1) NULL,
	chng_rsn varchar(4000) NULL,
	update_at timestamp DEFAULT now() NULL,
	update_by varchar(50) NULL,
	CONSTRAINT tb_coc_rprt_h_pkey PRIMARY KEY (hist_id)
);


-- alpassint.tb_coc_rprt_inc definition

-- Drop table

-- DROP TABLE alpassint.tb_coc_rprt_inc;

CREATE TABLE alpassint.tb_coc_rprt_inc (
	rprt_inc_ref_no varchar(23) NOT NULL,
	orgn_cd varchar(25) NOT NULL,
	rprt_inc_tp_cd varchar(3) NOT NULL,
	rprt_inc_dttm timestamp NOT NULL,
	rprt_inc_ttl varchar(255) NOT NULL,
	rprt_inc_desc varchar(4000) NOT NULL,
	atch_file_id varchar(60) NULL,
	oprn_ref_no varchar(23) NULL,
	del_yn varchar(1) NOT NULL,
	use_yn varchar(1) NOT NULL,
	frst_regst_id varchar(50) NOT NULL,
	frst_rgsr_dttm timestamp NOT NULL,
	last_chpr_id varchar(50) NOT NULL,
	last_chg_dttm timestamp NOT NULL,
	CONSTRAINT tb_coc_rprt_inc_pk PRIMARY KEY (rprt_inc_ref_no)
);


-- alpassint.tb_coc_rprt_vyg_h definition

-- Drop table

-- DROP TABLE alpassint.tb_coc_rprt_vyg_h;

CREATE TABLE alpassint.tb_coc_rprt_vyg_h (
	hist_id serial4 NOT NULL,
	rprt_vyg_id bigserial NOT NULL,
	rprt_vyg_dptr varchar(200) NOT NULL,
	rprt_vyg_dstn varchar(200) NOT NULL,
	rprt_vyg_trnp_nm varchar(255) NULL,
	rprt_vyg_dt varchar(8) NOT NULL,
	rprt_ref_no varchar(23) NOT NULL,
	rprt_vyg_tp varchar(7) NULL,
	del_yn varchar(1) NULL,
	CONSTRAINT tb_coc_rprt_vyg_h_pk PRIMARY KEY (hist_id)
);


-- alpassint.tb_coc_vhcl definition

-- Drop table

-- DROP TABLE alpassint.tb_coc_vhcl;

CREATE TABLE alpassint.tb_coc_vhcl (
	vhcl_ref_no varchar(23) NOT NULL,
	vhcl_knd_cd varchar(2) NULL,
	vhcl_rgsr_no varchar(20) NULL,
	vhcl_chss_no varchar(30) NULL,
	vhcl_mnfc_yy varchar(4) NULL,
	vhcl_mdl_cd varchar(10) NULL,
	vhcl_brnd_cd varchar(10) NULL,
	vhcl_stts varchar(2) NOT NULL,
	orgn_cd varchar(20) NULL,
	del_yn varchar(1) NOT NULL,
	use_yn varchar(1) NOT NULL,
	frst_regst_id varchar(50) NOT NULL,
	frst_rgsr_dttm timestamp NOT NULL,
	last_chpr_id varchar(50) NOT NULL,
	last_chg_dttm timestamp NOT NULL,
	vhcl_cnd_cd varchar(2) NULL,
	CONSTRAINT tb_coc_vhcl_pk PRIMARY KEY (vhcl_ref_no)
);


-- alpassint.tb_com_coc_vhcl_mdl definition

-- Drop table

-- DROP TABLE alpassint.tb_com_coc_vhcl_mdl;

CREATE TABLE alpassint.tb_com_coc_vhcl_mdl (
	vhcl_mdl_cd varchar(9) NOT NULL,
	vhcl_mdl_nm varchar(255) NOT NULL,
	vhcl_mnur_cd varchar(4) NOT NULL,
	del_yn varchar(1) NOT NULL,
	frst_regst_id varchar(50) NOT NULL,
	frst_rgsr_dttm timestamp(6) NOT NULL,
	last_chpr_id varchar(50) NOT NULL,
	last_chg_dttm timestamp(6) NOT NULL
);


-- alpassint.tb_com_coc_vhcl_mnur definition

-- Drop table

-- DROP TABLE alpassint.tb_com_coc_vhcl_mnur;

CREATE TABLE alpassint.tb_com_coc_vhcl_mnur (
	vhcl_mnur_cd varchar(4) NOT NULL,
	vhcl_mnur_nm varchar(255) NOT NULL,
	del_yn varchar(1) NOT NULL,
	frst_regst_id varchar(50) NOT NULL,
	frst_rgsr_dttm timestamp(6) NOT NULL,
	last_chpr_id varchar(50) NOT NULL,
	last_chg_dttm timestamp(6) NOT NULL
);


-- alpassint.tb_coc_amo_oprn_rel definition

-- Drop table

-- DROP TABLE alpassint.tb_coc_amo_oprn_rel;

CREATE TABLE alpassint.tb_coc_amo_oprn_rel (
	oprn_ref_no varchar(23) NOT NULL,
	amo_qty numeric(15) NULL,
	amo_ref_no varchar(23) NULL,
	CONSTRAINT tb_coc_amo_fk FOREIGN KEY (amo_ref_no) REFERENCES alpassint.tb_coc_amo(amo_ref_no),
	CONSTRAINT tb_coc_oprn_fk FOREIGN KEY (oprn_ref_no) REFERENCES alpassint.tb_coc_oprn(oprn_ref_no)
);


-- alpassint.tb_coc_arm_oprn_rel definition

-- Drop table

-- DROP TABLE alpassint.tb_coc_arm_oprn_rel;

CREATE TABLE alpassint.tb_coc_arm_oprn_rel (
	oprn_ref_no varchar(23) NOT NULL,
	arm_ref_no varchar(23) NULL,
	CONSTRAINT tb_coc_arm_fk FOREIGN KEY (arm_ref_no) REFERENCES alpassint.tb_coc_arm(arm_ref_no),
	CONSTRAINT tb_coc_oprn_fk FOREIGN KEY (oprn_ref_no) REFERENCES alpassint.tb_coc_oprn(oprn_ref_no)
);


-- alpassint.tb_coc_brq_cag definition

-- Drop table

-- DROP TABLE alpassint.tb_coc_brq_cag;

CREATE TABLE alpassint.tb_coc_brq_cag (
	brq_cag_ref_no bigserial NOT NULL,
	brq_ref_no varchar(70) NOT NULL,
	cag_tp varchar(70) NULL,
	cag_qty numeric(22) NULL,
	cag_wg varchar(70) NULL,
	cag_frd_val_unit numeric(40, 2) NULL,
	cag_frd_val_ttl numeric(40, 2) NULL,
	cag_ctg varchar(5) NULL,
	curr_cd varchar(3) NULL,
	CONSTRAINT tb_coc_brq_cag_pk PRIMARY KEY (brq_cag_ref_no),
	CONSTRAINT tb_coc_brq_cag_fk FOREIGN KEY (brq_ref_no) REFERENCES alpassint.tb_coc_brq(brq_ref_no)
);
CREATE INDEX tb_coc_brq_cag_ix01 ON alpassint.tb_coc_brq_cag USING btree (brq_ref_no, brq_cag_ref_no);

-- Table Triggers

create trigger trigger_tb_coc_brq_cag_delete before
delete
    on
    alpassint.tb_coc_brq_cag for each row execute function alpassint.tb_coc_brq_cag_update_history();


-- alpassint.tb_coc_brq_emp definition

-- Drop table

-- DROP TABLE alpassint.tb_coc_brq_emp;

CREATE TABLE alpassint.tb_coc_brq_emp (
	brq_emp_ref_no bigserial NOT NULL,
	brq_ref_no varchar(70) NOT NULL,
	emp_pbsr_no varchar(70) NOT NULL,
	emp_fmnm varchar(70) NULL,
	emp_nm varchar(200) NULL,
	emp_fonc_nm varchar(70) NULL,
	emp_grd_nm varchar(70) NULL,
	CONSTRAINT tb_coc_brq_emp_pk PRIMARY KEY (brq_emp_ref_no),
	CONSTRAINT tb_coc_brq_emp_fk FOREIGN KEY (brq_ref_no) REFERENCES alpassint.tb_coc_brq(brq_ref_no)
);
CREATE INDEX tb_coc_brq_emp_ix01 ON alpassint.tb_coc_brq_emp USING btree (brq_ref_no, brq_emp_ref_no);
CREATE INDEX tb_coc_brq_emp_ix02 ON alpassint.tb_coc_brq_emp USING btree (emp_pbsr_no);
CREATE INDEX tb_coc_brq_emp_ix03 ON alpassint.tb_coc_brq_emp USING btree (emp_fmnm, emp_nm);

-- Table Triggers

create trigger trigger_tb_coc_brq_emp_update before
delete
    on
    alpassint.tb_coc_brq_emp for each row execute function alpassint.tb_coc_brq_emp_update_history();


-- alpassint.tb_coc_brq_prsn definition

-- Drop table

-- DROP TABLE alpassint.tb_coc_brq_prsn;

CREATE TABLE alpassint.tb_coc_brq_prsn (
	brq_prsn_ref_no bigserial NOT NULL,
	brq_ref_no varchar(70) NOT NULL,
	brq_prsn_tp_cd varchar(3) NOT NULL,
	prsn_nm varchar(200) NOT NULL,
	prsn_fm_nm varchar(200) NOT NULL,
	prsn_rgsr_no varchar(70) NULL,
	prsn_nat_nm varchar(100) NULL,
	prsn_post_cd varchar(70) NULL,
	prsn_post_nm varchar(200) NULL,
	prsn_post_nm_sup varchar(255) NULL,
	prsn_brdy varchar(8) NULL,
	prsn_age varchar(3) NULL,
	prsn_gndr varchar(1) NULL,
	typ_doc varchar(2) NULL,
	dlv_dt varchar(8) NULL,
	dlv_agncy varchar(100) NULL,
	CONSTRAINT tb_coc_brq_prsn_pk PRIMARY KEY (brq_prsn_ref_no),
	CONSTRAINT tb_coc_brq_prsn_fk FOREIGN KEY (brq_ref_no) REFERENCES alpassint.tb_coc_brq(brq_ref_no)
);
CREATE INDEX tb_coc_brq_prsn_ix01 ON alpassint.tb_coc_brq_prsn USING btree (brq_ref_no, brq_prsn_ref_no);
CREATE INDEX tb_coc_brq_prsn_ix02 ON alpassint.tb_coc_brq_prsn USING btree (prsn_rgsr_no);
CREATE INDEX tb_coc_brq_prsn_ix03 ON alpassint.tb_coc_brq_prsn USING btree (prsn_fm_nm, prsn_nm);

-- Table Triggers

create trigger trigger_tb_coc_brq_prsn_update before
delete
    on
    alpassint.tb_coc_brq_prsn for each row execute function alpassint.tb_coc_brq_prsn_update_history();


-- alpassint.tb_coc_brq_trnp definition

-- Drop table

-- DROP TABLE alpassint.tb_coc_brq_trnp;

CREATE TABLE alpassint.tb_coc_brq_trnp (
	brq_trnp_ref_no bigserial NOT NULL,
	brq_ref_no varchar(70) NOT NULL,
	trnp_tp varchar(70) NULL,
	trnp_mt varchar(23) NULL,
	trnp_chss_no varchar(30) NULL,
	trnp_prtr varchar(100) NULL,
	trnp_val varchar(100) NULL,
	curr_cd varchar(3) NULL,
	CONSTRAINT tb_coc_brq_trnp_pk PRIMARY KEY (brq_trnp_ref_no),
	CONSTRAINT tb_coc_brq_trnp_fk FOREIGN KEY (brq_ref_no) REFERENCES alpassint.tb_coc_brq(brq_ref_no)
);
CREATE INDEX tb_coc_brq_trnp_ix01 ON alpassint.tb_coc_brq_trnp USING btree (brq_ref_no, brq_trnp_ref_no);

-- Table Triggers

create trigger trigger_tb_coc_brq_trnp_update before
delete
    on
    alpassint.tb_coc_brq_trnp for each row execute function alpassint.tb_coc_brq_trnp_update_history();


-- alpassint.tb_coc_colab_oprn_rel definition

-- Drop table

-- DROP TABLE alpassint.tb_coc_colab_oprn_rel;

CREATE TABLE alpassint.tb_coc_colab_oprn_rel (
	oprn_ref_no varchar(23) NOT NULL,
	colab_cd varchar(7) NULL,
	CONSTRAINT tb_coc_oprn_fk FOREIGN KEY (oprn_ref_no) REFERENCES alpassint.tb_coc_oprn(oprn_ref_no)
);


-- alpassint.tb_coc_eqip_oprn_rel definition

-- Drop table

-- DROP TABLE alpassint.tb_coc_eqip_oprn_rel;

CREATE TABLE alpassint.tb_coc_eqip_oprn_rel (
	oprn_ref_no varchar(23) NOT NULL,
	eqip_ref_no varchar(23) NULL,
	CONSTRAINT tb_coc_eqip_fk FOREIGN KEY (eqip_ref_no) REFERENCES alpassint.tb_coc_eqip(eqip_ref_no),
	CONSTRAINT tb_coc_oprn_fk FOREIGN KEY (oprn_ref_no) REFERENCES alpassint.tb_coc_oprn(oprn_ref_no)
);


-- alpassint.tb_coc_oprn_tp_rel definition

-- Drop table

-- DROP TABLE alpassint.tb_coc_oprn_tp_rel;

CREATE TABLE alpassint.tb_coc_oprn_tp_rel (
	oprn_ref_no varchar(23) NOT NULL,
	oprn_tp_cd varchar(7) NULL,
	CONSTRAINT tb_coc_oprn_fk FOREIGN KEY (oprn_ref_no) REFERENCES alpassint.tb_coc_oprn(oprn_ref_no)
);


-- alpassint.tb_coc_rprt_cag definition

-- Drop table

-- DROP TABLE alpassint.tb_coc_rprt_cag;

CREATE TABLE alpassint.tb_coc_rprt_cag (
	rprt_cag_id bigserial NOT NULL,
	rprt_cag_ctg_cd varchar(3) NULL,
	rprt_cag_nm varchar(255) NULL,
	rprt_cag_qty numeric(40, 2) NULL,
	unit_cd varchar(20) NULL,
	rprt_cag_unit_val numeric(40, 2) NULL,
	rprt_cag_ttl_val numeric(40, 2) NULL,
	curr_cd varchar(3) NULL,
	rprt_ref_no varchar(23) NOT NULL,
	del_yn varchar(1) NULL,
	CONSTRAINT tb_coc_rprt_cag_pk PRIMARY KEY (rprt_cag_id),
	CONSTRAINT tb_coc_rprt_fk FOREIGN KEY (rprt_ref_no) REFERENCES alpassint.tb_coc_rprt(rprt_ref_no)
);


-- alpassint.tb_coc_rprt_cmpny definition

-- Drop table

-- DROP TABLE alpassint.tb_coc_rprt_cmpny;

CREATE TABLE alpassint.tb_coc_rprt_cmpny (
	rprt_cmpny_id bigserial NOT NULL,
	rprt_cmpny_tp_cd varchar(3) NULL,
	rprt_cmpny_nm varchar(200) NULL,
	rprt_cmpny_addr varchar(255) NULL,
	rprt_cmpny_cmrc_regs_no varchar(255) NULL,
	rprt_cmpny_nif_no varchar(255) NULL,
	rprt_cmpny_dlv_dt varchar(8) NULL,
	rprt_ref_no varchar(23) NOT NULL,
	del_yn varchar(1) NULL,
	CONSTRAINT tb_coc_rprt_cmpny_pk PRIMARY KEY (rprt_cmpny_id),
	CONSTRAINT tb_coc_rprt_fk FOREIGN KEY (rprt_ref_no) REFERENCES alpassint.tb_coc_rprt(rprt_ref_no)
);


-- alpassint.tb_coc_rprt_prsn definition

-- Drop table

-- DROP TABLE alpassint.tb_coc_rprt_prsn;

CREATE TABLE alpassint.tb_coc_rprt_prsn (
	rprt_prsn_id bigserial NOT NULL,
	rprt_prsn_tp_cd varchar(3) NOT NULL,
	rprt_prsn_nm varchar(200) NOT NULL,
	rprt_prsn_fmnm varchar(200) NOT NULL,
	rprt_prsn_typ_doc varchar(2) NULL,
	rprt_prsn_rgsr_no varchar(70) NULL,
	rprt_prsn_dlv_dt varchar(8) NULL,
	rprt_prsn_dlv_agncy varchar(100) NULL,
	rprt_prsn_nat_cd varchar(20) NULL,
	rprt_prsn_addr varchar(255) NULL,
	rprt_prsn_brdy varchar(8) NULL,
	prsn_gndr varchar(1) NOT NULL,
	rprt_ref_no varchar(23) NOT NULL,
	rprt_prsn_nin varchar(20) NULL,
	rprt_prsn_nm_fr varchar(200) NOT NULL,
	rprt_prsn_fmnm_fr varchar(200) NOT NULL,
	rprt_prsn_temp_brdy varchar(1) NULL,
	del_yn varchar(1) NULL,
	CONSTRAINT tb_coc_rprt_prsn_pk PRIMARY KEY (rprt_prsn_id),
	CONSTRAINT tb_coc_rprt_fk FOREIGN KEY (rprt_ref_no) REFERENCES alpassint.tb_coc_rprt(rprt_ref_no)
);


-- alpassint.tb_coc_rprt_trnp definition

-- Drop table

-- DROP TABLE alpassint.tb_coc_rprt_trnp;

CREATE TABLE alpassint.tb_coc_rprt_trnp (
	rprt_trnp_id bigserial NOT NULL,
	rprt_trnp_mdl_cd varchar(255) NOT NULL,
	rprt_trnp_brnd_cd varchar(10) NOT NULL,
	rprt_trnp_rgsr_no varchar(20) NOT NULL,
	rprt_trnp_chss_no varchar(30) NOT NULL,
	rprt_trnp_owvh varchar(255) NULL,
	rprt_trnp_unit_val numeric(40, 2) NOT NULL,
	curr_cd varchar(3) NOT NULL,
	rprt_ref_no varchar(23) NOT NULL,
	rprt_trnp_tp_cd varchar(2) NULL,
	del_yn varchar(1) NULL,
	CONSTRAINT tb_coc_rprt_trnp_pk PRIMARY KEY (rprt_trnp_id),
	CONSTRAINT tb_coc_rprt_fk FOREIGN KEY (rprt_ref_no) REFERENCES alpassint.tb_coc_rprt(rprt_ref_no)
);


-- alpassint.tb_coc_rprt_vyg definition

-- Drop table

-- DROP TABLE alpassint.tb_coc_rprt_vyg;

CREATE TABLE alpassint.tb_coc_rprt_vyg (
	rprt_vyg_id bigserial NOT NULL,
	rprt_vyg_dptr varchar(200) NOT NULL,
	rprt_vyg_dstn varchar(200) NOT NULL,
	rprt_vyg_trnp_nm varchar(255) NULL,
	rprt_vyg_dt varchar(8) NOT NULL,
	rprt_ref_no varchar(23) NOT NULL,
	rprt_vyg_tp varchar(7) NULL,
	del_yn varchar(1) NULL,
	CONSTRAINT tb_coc_rprt_vyg_pk PRIMARY KEY (rprt_vyg_id),
	CONSTRAINT tb_coc_rprt_fk FOREIGN KEY (rprt_ref_no) REFERENCES alpassint.tb_coc_rprt(rprt_ref_no)
);

-- Table Triggers

create trigger trigger_tb_coc_rprt_vyg_update before
update
    on
    alpassint.tb_coc_rprt_vyg for each row execute function alpassint.tb_coc_rprt_vyg_update_history();


-- alpassint.tb_coc_vhcl_oprn_rel definition

-- Drop table

-- DROP TABLE alpassint.tb_coc_vhcl_oprn_rel;

CREATE TABLE alpassint.tb_coc_vhcl_oprn_rel (
	oprn_ref_no varchar(23) NOT NULL,
	vhcl_ref_no varchar(23) NULL,
	CONSTRAINT tb_coc_oprn_fk FOREIGN KEY (oprn_ref_no) REFERENCES alpassint.tb_coc_oprn(oprn_ref_no),
	CONSTRAINT tb_coc_vhcl_fk FOREIGN KEY (vhcl_ref_no) REFERENCES alpassint.tb_coc_vhcl(vhcl_ref_no)
);


-- alpassint.tb_coc_cnn definition

-- Drop table

-- DROP TABLE alpassint.tb_coc_cnn;

CREATE TABLE alpassint.tb_coc_cnn (
	cnn_ref_no varchar(23) NOT NULL,
	cnn_nm varchar(255) NULL,
	cnn_age numeric(2) NULL,
	cnn_tp varchar(255) NULL,
	cnn_bld varchar(3) NULL,
	cnn_spcl varchar(255) NULL,
	cnn_rc varchar(2) NULL,
	cnn_img varchar(255) NULL,
	orgn_cd varchar(20) NULL,
	del_yn varchar(1) NOT NULL,
	use_yn varchar(1) NOT NULL,
	pbsr_no varchar(7) NOT NULL,
	frst_regst_id varchar(50) NOT NULL,
	frst_rgsr_dttm timestamp NOT NULL,
	last_chpr_id varchar(50) NOT NULL,
	last_chg_dttm timestamp NOT NULL,
	CONSTRAINT tb_coc_cnn_pk PRIMARY KEY (cnn_ref_no)
);


-- alpassint.tb_coc_cnn_oprn_rel definition

-- Drop table

-- DROP TABLE alpassint.tb_coc_cnn_oprn_rel;

CREATE TABLE alpassint.tb_coc_cnn_oprn_rel (
	oprn_ref_no varchar(23) NOT NULL,
	cnn_ref_no varchar(23) NULL
);


-- alpassint.tb_coc_emp_oprn_rel definition

-- Drop table

-- DROP TABLE alpassint.tb_coc_emp_oprn_rel;

CREATE TABLE alpassint.tb_coc_emp_oprn_rel (
	oprn_ref_no varchar(23) NOT NULL,
	co_emp_ref_no varchar(7) NULL
);


-- alpassint.tb_coc_emp_rprt_rel definition

-- Drop table

-- DROP TABLE alpassint.tb_coc_emp_rprt_rel;

CREATE TABLE alpassint.tb_coc_emp_rprt_rel (
	rprt_ref_no varchar(23) NOT NULL,
	co_emp_ref_no varchar(7) NULL,
	del_yn varchar(1) NULL
);


-- alpassint.tb_coc_cnn foreign keys

ALTER TABLE alpassint.tb_coc_cnn ADD CONSTRAINT tb_coc_cnn_fk FOREIGN KEY (pbsr_no)
    REFERENCES alpassint.tb_poti_co_emp(pbsr_no);


-- alpassint.tb_coc_cnn_oprn_rel foreign keys

ALTER TABLE alpassint.tb_coc_cnn_oprn_rel ADD CONSTRAINT tb_coc_cnn_fk FOREIGN KEY (cnn_ref_no) REFERENCES alpassint.tb_coc_cnn(cnn_ref_no);
ALTER TABLE alpassint.tb_coc_cnn_oprn_rel ADD CONSTRAINT tb_coc_oprn_fk FOREIGN KEY (oprn_ref_no) REFERENCES alpassint.tb_coc_oprn(oprn_ref_no);


-- alpassint.tb_coc_emp_oprn_rel foreign keys

ALTER TABLE alpassint.tb_coc_emp_oprn_rel ADD CONSTRAINT tb_coc_oprn_fk FOREIGN KEY (oprn_ref_no) REFERENCES alpassint.tb_coc_oprn(oprn_ref_no);
ALTER TABLE alpassint.tb_coc_emp_oprn_rel ADD CONSTRAINT tb_poti_co_emp_fk FOREIGN KEY (co_emp_ref_no) REFERENCES alpassint.tb_poti_co_emp(pbsr_no);


-- alpassint.tb_coc_emp_rprt_rel foreign keys

ALTER TABLE alpassint.tb_coc_emp_rprt_rel ADD CONSTRAINT tb_coc_rprt_fk FOREIGN KEY (rprt_ref_no) REFERENCES alpassint.tb_coc_rprt(rprt_ref_no);
ALTER TABLE alpassint.tb_coc_emp_rprt_rel ADD CONSTRAINT tb_poti_co_emp_fk FOREIGN KEY (co_emp_ref_no) REFERENCES alpassint.tb_poti_co_emp(pbsr_no);