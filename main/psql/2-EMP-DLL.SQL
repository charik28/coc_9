
-- [2025-09-02 12:16:36] completed in 16 ms on d08
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


-- alpassint.tb_com_prcs_stts_infm definition

-- Drop table

-- DROP TABLE alpassint.tb_com_prcs_stts_infm;

CREATE TABLE alpassint.tb_com_prcs_stts_infm (
	msg_id varchar(100) NOT NULL,
	rcpn_msg_id varchar(100) NULL,
	bsop_clsf_cd varchar(3) NULL,
	prcs_stts_cd varchar(3) NULL,
	dclr_doc_cd varchar(12) NULL,
	doc_sbmt_no varchar(50) NULL,
	cstm_acap_no varchar(100) NULL,
	infm_doc_cd varchar(12) NULL,
	infm_orgn_cd varchar(9) NULL,
	bsop_prcs_stts_cd varchar(3) NULL,
	bsop_prcs_stts_infm_cn varchar(512) NULL,
	infm_dttm timestamp NULL,
	pobx_id varchar(25) NULL,
	trsn_yn varchar(1) NULL,
	infm_cn_msg_cd varchar(13) NULL,
	infm_cn_prmt_val varchar(100) NULL,
	co_rqst_no varchar(31) NULL,
	mdfy_dgcnt numeric(5) NULL,
	trsn_tp_cd varchar(2) NULL,
	oths_reff_no1 varchar(50) NULL,
	oths_reff_no2 varchar(50) NULL,
	del_yn varchar(1) NOT NULL,
	frst_regst_id varchar(50) NOT NULL,
	frst_rgsr_dttm timestamp(6) NOT NULL,
	last_chpr_id varchar(50) NOT NULL,
	last_chg_dttm timestamp(6) NOT NULL,
	CONSTRAINT tb_com_prcs_stts_infm_pk PRIMARY KEY (msg_id)
);


-- alpassint.tb_com_psn_user_auth definition

-- Drop table

-- DROP TABLE alpassint.tb_com_psn_user_auth;

CREATE TABLE alpassint.tb_com_psn_user_auth (
	role_id varchar(30) NOT NULL,
	user_id varchar(50) NOT NULL,
	use_yn varchar(1) NULL,
	del_yn varchar(1) NULL,
	frst_regst_id varchar(50) NULL,
	frst_rgsr_dttm timestamp(6) NULL,
	last_chpr_id varchar(50) NULL,
	last_chg_dttm timestamp(6) NULL,
	CONSTRAINT tb_com_psn_user_auth_pk PRIMARY KEY (role_id, user_id)
);


-- alpassint.tb_com_temp_atch_file definition

-- Drop table

-- DROP TABLE alpassint.tb_com_temp_atch_file;

CREATE TABLE alpassint.tb_com_temp_atch_file (
	temp_atch_file_id varchar(60) NOT NULL,
	srbk_file_nm varchar(300) NULL,
	save_file_nm varchar(300) NULL,
	file_path_nm varchar(200) NULL,
	file_size numeric(22) NULL,
	bsop_clsf_cd varchar(3) NULL,
	del_yn varchar(1) NOT NULL,
	frst_regst_id varchar(50) NOT NULL,
	frst_rgsr_dttm timestamp(6) NOT NULL,
	last_chpr_id varchar(50) NOT NULL,
	last_chg_dttm timestamp(6) NOT NULL,
	file_desc_cn varchar(4000) NULL,
	CONSTRAINT tb_com_temp_atch_file_pk PRIMARY KEY (temp_atch_file_id)
);


-- alpassint.tb_com_user_acct definition

-- Drop table

-- DROP TABLE alpassint.tb_com_user_acct;

CREATE TABLE alpassint.tb_com_user_acct (
	user_id varchar(50) NOT NULL,
	pwd varchar(70) NULL,
	pwd_chg_dt varchar(8) NULL,
	pwd_intz_yn varchar(1) NULL,
	pwd_fail_ncnt numeric(10) NULL,
	acct_lcked_yn varchar(1) NULL,
	acct_lcked_rsn_cd varchar(2) NULL,
	acct_lcked_dt varchar(8) NULL,
	acct_lcked_rele_dt varchar(8) NULL,
	acct_puse_yn varchar(1) NULL,
	acct_puse_rsn_cd varchar(2) NULL,
	acct_puse_strt_dt varchar(8) NULL,
	acct_puse_end_dt varchar(8) NULL,
	user_ip varchar(15) NULL,
	del_yn varchar(1) NULL,
	frst_regst_id varchar(50) NULL,
	frst_rgsr_dttm timestamp(6) NULL,
	last_chpr_id varchar(50) NULL,
	last_chg_dttm timestamp(6) NULL,
	frst_lgn_yn varchar(1) NULL,
	last_lgn_dttm timestamp NULL,
	adit_crtf_cd varchar(2) NULL,
	user_clsf_cd varchar(1) NOT NULL,
	CONSTRAINT tb_com_user_acct_pk PRIMARY KEY (user_id, user_clsf_cd)
);


-- alpassint.tb_com_wrhs_jrsd_emp definition

-- Drop table

-- DROP TABLE alpassint.tb_com_wrhs_jrsd_emp;

CREATE TABLE alpassint.tb_com_wrhs_jrsd_emp (
	pbsr_no varchar(7) NOT NULL,
	nif varchar(20) NOT NULL,
	co_dclr_cd varchar(5) NOT NULL,
	del_yn varchar(1) NOT NULL,
	frst_regst_id varchar(50) NOT NULL,
	frst_rgsr_dttm timestamp(6) NOT NULL,
	last_chpr_id varchar(50) NOT NULL,
	last_chg_dttm timestamp(6) NOT NULL,
	CONSTRAINT tb_com_wrhs_jrsd_emp_pk PRIMARY KEY (pbsr_no, nif, co_dclr_cd)
);


-- alpassint.tb_pote_cntt_actv_mtr_cd_temp definition

-- Drop table

-- DROP TABLE alpassint.tb_pote_cntt_actv_mtr_cd_temp;

CREATE TABLE alpassint.tb_pote_cntt_actv_mtr_cd_temp (
	msg_id varchar(30) NULL,
	msg_prcs_stts_cd varchar(3) NULL,
	actv_mtr_cd varchar(6) NULL,
	actv_mtr_cd_nm varchar(300) NULL,
	del_yn varchar(1) NULL,
	frst_regst_id varchar(50) NULL,
	frst_rgsr_dttm timestamp NULL,
	last_chpr_id varchar(50) NULL,
	last_chg_dttm timestamp NULL,
	btch_prcc_yn varchar(1) NULL,
	code int4 NULL,
	libelle varchar(512) NULL
);


-- alpassint.tb_pote_cntt_cmrc_regs_actv_mtr_temp definition

-- Drop table

-- DROP TABLE alpassint.tb_pote_cntt_cmrc_regs_actv_mtr_temp;

CREATE TABLE alpassint.tb_pote_cntt_cmrc_regs_actv_mtr_temp (
	msg_id varchar(30) NULL,
	msg_prcs_stts_cd varchar(3) NULL,
	cmrc_regs_no varchar(14) NULL,
	actv_mtr_cd varchar(6) NULL,
	del_yn varchar(1) NULL,
	frst_regst_id varchar(50) NULL,
	frst_rgsr_dttm timestamp NULL,
	last_chpr_id varchar(50) NULL,
	last_chg_dttm timestamp NULL,
	btch_prcc_yn varchar(1) NULL,
	nrc varchar(50) NULL,
	code int4 NULL
);


-- alpassint.tb_pote_cntt_cmrc_regs_temp definition

-- Drop table

-- DROP TABLE alpassint.tb_pote_cntt_cmrc_regs_temp;

CREATE TABLE alpassint.tb_pote_cntt_cmrc_regs_temp (
	msg_id varchar(30) NULL,
	msg_prcs_stts_cd varchar(3) NULL,
	cmrc_regs_no varchar(14) NULL,
	ents_cd varchar(2) NULL,
	wly_cd varchar(2) NULL,
	nif_cd varchar(15) NULL,
	nif_srno varchar(5) NULL,
	conm varchar(120) NULL,
	addr varchar(140) NULL,
	cmrc_regs_stts_cd varchar(1) NULL,
	atr_dt varchar(8) NULL,
	used_strt_dt varchar(8) NULL,
	beex_dt varchar(8) NULL,
	del_yn varchar(1) NULL,
	frst_regst_id varchar(50) NULL,
	frst_rgsr_dttm timestamp NULL,
	last_chpr_id varchar(50) NULL,
	last_chg_dttm timestamp NULL,
	commune varchar(14) NULL,
	trsm_dt varchar(8) NULL,
	invg_dt varchar(8) NULL,
	btch_prcc_yn varchar(1) NULL,
	nif varchar(15) NULL,
	commune_nm varchar(14) NULL,
	etat int8 NULL,
	code_fiscal int8 NULL,
	nordre int8 NULL,
	nrc varchar(50) NULL,
	code_ets int8 NULL,
	code_wilaya int8 NULL,
	reg_comm varchar(50) NULL,
	adresse varchar(256) NULL,
	rs varchar(128) NULL,
	date_modif varchar(50) NULL,
	date_dexpl varchar(50) NULL,
	date_radiat varchar(50) NULL,
	stts_cd int4 NULL,
	frst_rgst_dttm varchar(50) NULL,
	commue varchar(50) NULL
);


-- alpassint.tb_pote_cntt_nif_temp definition

-- Drop table

-- DROP TABLE alpassint.tb_pote_cntt_nif_temp;

CREATE TABLE alpassint.tb_pote_cntt_nif_temp (
	msg_id varchar(35) NULL,
	msg_prcs_stts_cd varchar(5) NULL,
	potx_cd varchar(20) NULL,
	potx_srno varchar(10) NULL,
	conm varchar(250) NULL,
	co_addr varchar(240) NULL,
	wly_nm varchar(50) NULL,
	post_cd varchar(10) NULL,
	nif_stts_cd varchar(1) NULL,
	btch_prcc_yn varchar(1) NULL,
	del_yn varchar(1) NULL,
	frst_regst_id varchar(50) NULL,
	frst_rgsr_dttm timestamp(6) NULL,
	last_chpr_id varchar(50) NULL,
	last_chg_dttm timestamp(6) NULL,
	co_rgsr_dt timestamp NULL,
	rs varchar(328) NULL,
	code_fiscal int8 NULL,
	ordre int4 NULL,
	adr varchar(256) NULL,
	wilaya varchar(50) NULL,
	code_postal varchar(60) NULL,
	situation varchar(50) NULL,
	date_suivi varchar(50) NULL
);


-- alpassint.tb_pote_cntt_prsn_regs_temp definition

-- Drop table

-- DROP TABLE alpassint.tb_pote_cntt_prsn_regs_temp;

CREATE TABLE alpassint.tb_pote_cntt_prsn_regs_temp (
	msg_id varchar(30) NULL,
	msg_prcs_stts_cd varchar(3) NULL,
	cmrc_regs_no varchar(14) NULL,
	ents_cd varchar(2) NULL,
	wly_cd varchar(2) NULL,
	nif_cd varchar(15) NULL,
	nif_srno varchar(5) NULL,
	addr varchar(140) NULL,
	pobs_addr varchar(140) NULL,
	pobs_owr_nm varchar(50) NULL,
	bthp_nm varchar(50) NULL,
	birt_dt varchar(8) NULL,
	nat_nm varchar(50) NULL,
	cmrc_regs_stts_cd varchar(1) NULL,
	atr_dt varchar(8) NULL,
	used_strt_dt varchar(8) NULL,
	beex_dt varchar(8) NULL,
	del_yn varchar(1) NULL,
	frst_regst_id varchar(50) NULL,
	frst_rgsr_dttm timestamp NULL,
	last_chpr_id varchar(50) NULL,
	last_chg_dttm timestamp NULL,
	commune varchar(14) NULL,
	fmnm_nm varchar(20) NULL,
	gvnm_nm varchar(20) NULL,
	trsm_dt varchar(8) NULL,
	invg_dt varchar(8) NULL,
	btch_prcc_yn varchar(1) NULL,
	nif varchar(15) NULL,
	commune_nm varchar(14) NULL,
	etat int4 NULL,
	code_fiscal varchar(50) NULL,
	nordre varchar(50) NULL,
	nrc varchar(50) NULL,
	code_ets int4 NULL,
	code_wilaya int4 NULL,
	reg_comm varchar(50) NULL,
	nom varchar(50) NULL,
	prenom varchar(50) NULL,
	adr_commer varchar(256) NULL,
	adr_local varchar(256) NULL,
	propri_local varchar(50) NULL,
	nationalite varchar(50) NULL,
	date_naiss varchar(50) NULL,
	lieu_naiss varchar(50) NULL,
	date_modif varchar(50) NULL,
	date_dexpl varchar(50) NULL,
	date_radiat varchar(50) NULL
);


-- alpassint.tb_poti_co_emp definition

-- Drop table

-- DROP TABLE alpassint.tb_poti_co_emp;

CREATE TABLE alpassint.tb_poti_co_emp (
	pbsr_no varchar(7) NOT NULL,
	emp_nm varchar(200) NULL,
	emp_stts_cd varchar(2) NULL,
	inhb_rgsr_no varchar(23) NULL,
	eml varchar(50) NOT NULL,
	brdy varchar(8) NULL,
	gndr_cd varchar(1) NULL,
	mobl_no varchar(50) NULL,
	dept_tlph_no varchar(50) NULL,
	emp_addr varchar(140) NULL,
	phto_imge_cn bytea NULL,
	wrkp_asn_dt varchar(8) NULL,
	enco_dt varchar(8) NULL,
	emp_bwrk_stts_cd varchar(2) NULL,
	bsop_clsf_cd varchar(50) NULL,
	emp_fmnm varchar(70) NULL,
	far_nm varchar(200) NULL,
	mor_fmnm varchar(70) NULL,
	mor_nm varchar(200) NULL,
	emp_post_cd varchar(255) NULL,
	grd_cd varchar(3) NULL,
	fonc_cd varchar(3) NULL,
	atch_file_id varchar(60) NULL,
	now_fonc_strt_dt varchar(8) NULL,
	temp_brdy varchar(1) NULL,
	del_yn varchar(1) NOT NULL,
	frst_regst_id varchar(50) NOT NULL,
	frst_rgsr_dttm timestamp NOT NULL,
	last_chpr_id varchar(50) NOT NULL,
	last_chg_dttm timestamp NOT NULL,
	bld_tp_cd varchar(4) NULL,
	orgn_cd varchar(20) NULL,
	CONSTRAINT tb_poti_co_emp_pk PRIMARY KEY (pbsr_no)
);


-- alpassint.tb_poti_emp definition

-- Drop table

-- DROP TABLE alpassint.tb_poti_emp;

CREATE TABLE alpassint.tb_poti_emp (
	pbsr_no varchar(7) NOT NULL,
	orgn_mgmt_cd varchar(10) NOT NULL,
	emp_nm varchar(200) NULL,
	cstm_emp_no varchar(5) NULL,
	emp_stts_cd varchar(2) NULL,
	ctgy_cd varchar(3) NULL,
	gd_cd varchar(3) NULL,
	clps_cd varchar(3) NULL,
	clas_cd varchar(3) NULL,
	frtg_expo varchar(5) NULL,
	inhb_rgsr_no varchar(23) NULL,
	eml varchar(50) NOT NULL,
	brdy varchar(8) NULL,
	gndr_cd varchar(1) NULL,
	mobl_no varchar(50) NULL,
	dept_tlph_no varchar(50) NULL,
	emp_addr varchar(140) NULL,
	phto_imge_cn bytea NULL,
	wrkp_asn_dt varchar(8) NULL,
	enco_dt varchar(8) NULL,
	rtmn_dt varchar(8) NULL,
	xtrn_emp_yn varchar(1) NULL,
	eml_rcpn_yn varchar(1) NULL,
	sms_rcpn_yn varchar(1) NULL,
	del_yn varchar(1) DEFAULT NULL::character varying NOT NULL,
	frst_regst_id varchar(50) NOT NULL,
	frst_rgsr_dttm timestamp(6) NOT NULL,
	last_chpr_id varchar(50) NOT NULL,
	last_chg_dttm timestamp(6) NOT NULL,
	sctr_mgmt_cd varchar(10) NULL,
	cstm_mgmt_cd varchar(10) NULL,
	dept_mgmt_cd varchar(10) NULL,
	blng_itt_cd varchar(5) NULL,
	emp_bwrk_stts_cd varchar(2) NULL,
	bsop_clsf_cd varchar(50) NULL,
	emp_fmnm varchar(70) NULL,
	far_nm varchar(200) NULL,
	mor_fmnm varchar(70) NULL,
	mor_nm varchar(200) NULL,
	vtlt_yn varchar(1) NULL,
	bthp varchar(100) NULL,
	emp_post_cd varchar(255) NULL,
	emp_post_nm varchar(255) NULL,
	grd_cd varchar(3) NULL,
	fonc_cd varchar(3) NULL,
	bf_wrkp_asn_end_dt varchar(8) NULL,
	atch_file_id varchar(60) NULL,
	orgn_chg_rsn_cd varchar(1) NULL,
	bwrk_end_pv_no varchar(60) NULL,
	bwrk_strt_pv_no varchar(60) NULL,
	now_fonc_strt_dt varchar(8) NULL,
	fonc_stts_cd varchar(1) NULL,
	apot_dt varchar(8) NULL,
	apot_no varchar(60) NULL,
	apot_atch_file_id varchar(60) NULL,
	temp_brdy varchar(1) NULL,
	CONSTRAINT tb_poti_emp_pk PRIMARY KEY (pbsr_no)
);


-- alpassint.tb_poti_emp_acct definition

-- Drop table

-- DROP TABLE alpassint.tb_poti_emp_acct;

CREATE TABLE alpassint.tb_poti_emp_acct (
	pbsr_no varchar(7) NOT NULL,
	pwd varchar(70) NULL,
	pwd_chg_dt varchar(8) NULL,
	pwd_intz_yn varchar(1) NULL,
	pwd_fail_ncnt numeric(10) NULL,
	acct_lcked_yn varchar(1) NULL,
	acct_lcked_rsn_cd varchar(2) NULL,
	acct_lcked_dt varchar(12) NULL,
	acct_lcked_rele_dt varchar(12) NULL,
	acct_puse_yn varchar(1) NULL,
	acct_puse_rsn_cd varchar(2) NULL,
	acct_puse_strt_dt varchar(12) NULL,
	acct_puse_end_dt varchar(12) NULL,
	emp_ip varchar(15) NULL,
	del_yn varchar(1) NULL,
	frst_regst_id varchar(50) NULL,
	frst_rgsr_dttm timestamp(6) NULL,
	last_chpr_id varchar(50) NULL,
	last_chg_dttm timestamp(6) NULL,
	frst_lgn_yn varchar(1) NULL,
	last_lgn_dttm timestamp NULL,
	adit_crtf_cd varchar(2) NULL,
	CONSTRAINT tb_poti_emp_acct_pk PRIMARY KEY (pbsr_no)
);


-- alpassint.tb_poti_emp_auth_h definition

-- Drop table

-- DROP TABLE alpassint.tb_poti_emp_auth_h;

CREATE TABLE alpassint.tb_poti_emp_auth_h (
	pbsr_no varchar(7) NOT NULL,
	role_id varchar(30) NOT NULL,
	srno numeric(22) NOT NULL,
	auth_athz_cd varchar(2) NOT NULL,
	wrkr varchar(200) NOT NULL,
	wkng_dttm timestamp NOT NULL,
	del_yn varchar(1) NOT NULL,
	frst_regst_id varchar(50) NOT NULL,
	frst_rgsr_dttm timestamp(6) NOT NULL,
	last_chpr_id varchar(50) NOT NULL,
	last_chg_dttm timestamp(6) NOT NULL,
	CONSTRAINT tb_poti_emp_auth_h_pk PRIMARY KEY (pbsr_no, role_id, srno)
);


-- alpassint.tb_poti_emp_bak definition

-- Drop table

-- DROP TABLE alpassint.tb_poti_emp_bak;

CREATE TABLE alpassint.tb_poti_emp_bak (
	pbsr_no varchar(7) NULL,
	orgn_mgmt_cd varchar(10) NULL,
	emp_nm varchar(200) NULL,
	cstm_emp_no varchar(5) NULL,
	emp_stts_cd varchar(2) NULL,
	ctgy_cd varchar(3) NULL,
	gd_cd varchar(3) NULL,
	clps_cd varchar(3) NULL,
	clas_cd varchar(3) NULL,
	frtg_expo varchar(5) NULL,
	inhb_rgsr_no varchar(23) NULL,
	eml varchar(50) NULL,
	brdy varchar(8) NULL,
	gndr_cd varchar(1) NULL,
	mobl_no varchar(50) NULL,
	dept_tlph_no varchar(50) NULL,
	emp_addr varchar(140) NULL,
	phto_imge_cn bytea NULL,
	wrkp_asn_dt varchar(8) NULL,
	enco_dt varchar(8) NULL,
	rtmn_dt varchar(8) NULL,
	xtrn_emp_yn varchar(1) NULL,
	eml_rcpn_yn varchar(1) NULL,
	sms_rcpn_yn varchar(1) NULL,
	del_yn varchar(1) NULL,
	frst_regst_id varchar(50) NULL,
	frst_rgsr_dttm timestamp(6) NULL,
	last_chpr_id varchar(50) NULL,
	last_chg_dttm timestamp(6) NULL,
	sctr_mgmt_cd varchar(10) NULL,
	cstm_mgmt_cd varchar(10) NULL,
	dept_mgmt_cd varchar(10) NULL,
	blng_itt_cd varchar(5) NULL,
	emp_bwrk_stts_cd varchar(2) NULL,
	bsop_clsf_cd varchar(50) NULL,
	emp_fmnm varchar(70) NULL,
	far_nm varchar(200) NULL,
	mor_fmnm varchar(70) NULL,
	mor_nm varchar(200) NULL,
	vtlt_yn varchar(1) NULL,
	bthp varchar(100) NULL,
	emp_post_cd varchar(255) NULL,
	emp_post_nm varchar(255) NULL,
	grd_cd varchar(3) NULL,
	fonc_cd varchar(3) NULL
);


-- alpassint.tb_poti_emp_bwrk_stts_hist definition

-- Drop table

-- DROP TABLE alpassint.tb_poti_emp_bwrk_stts_hist;

CREATE TABLE alpassint.tb_poti_emp_bwrk_stts_hist (
	pbsr_no varchar(7) NOT NULL,
	hist_srno numeric(5) NOT NULL,
	emp_stts_cd varchar(2) NULL,
	emp_stts_chg_rsn_cn varchar(4000) NULL,
	aply_strt_dt varchar(12) NULL,
	aply_end_dt varchar(12) NULL,
	del_yn varchar(1) NULL,
	frst_regst_id varchar(50) NULL,
	frst_rgsr_dttm timestamp NULL,
	last_chpr_id varchar(50) NULL,
	last_chg_dttm timestamp NULL,
	fonc_cd varchar(3) NULL,
	grd_cd varchar(3) NULL,
	atch_file_id varchar(60) NULL,
	absn_rsn_cd varchar(3) NULL,
	cmbk_rsn_cd varchar(2) NULL,
	absn_strt_dt varchar(12) NULL,
	absn_end_dt varchar(12) NULL,
	cmbk_strt_dt varchar(12) NULL,
	cmbk_end_dt varchar(12) NULL,
	xtns_rsn_cn varchar(4000) NULL,
	xtns_yn varchar(1) NULL,
	CONSTRAINT tb_poti_emp_bwrk_stts_hist_pk PRIMARY KEY (pbsr_no, hist_srno)
);


-- alpassint.tb_poti_emp_fonc_hist definition

-- Drop table

-- DROP TABLE alpassint.tb_poti_emp_fonc_hist;

CREATE TABLE alpassint.tb_poti_emp_fonc_hist (
	pbsr_no varchar(6) NOT NULL,
	srno numeric(5) NOT NULL,
	fonc_cd varchar(3) NULL,
	bf_fonc_cd varchar(3) NULL,
	bf_grd_cd varchar(3) NULL,
	fonc_stts_cd varchar(1) NULL,
	apot_dt varchar(8) NULL,
	apot_no varchar(60) NULL,
	apot_atch_file_id varchar(60) NULL,
	del_yn varchar(1) NULL,
	frst_regst_id varchar(50) NULL,
	frst_rgsr_dttm timestamp(6) NULL,
	last_chpr_id varchar(50) NULL,
	last_chg_dttm timestamp(6) NULL,
	aprv_id varchar(23) NULL,
	prcs_stts_cd varchar(3) NULL,
	CONSTRAINT tb_poti_emp_fonc_hist_pk PRIMARY KEY (pbsr_no, srno)
);


-- alpassint.tb_poti_emp_h definition

-- Drop table

-- DROP TABLE alpassint.tb_poti_emp_h;

CREATE TABLE alpassint.tb_poti_emp_h (
	pbsr_no varchar(7) NOT NULL,
	col_nm varchar(150) NOT NULL,
	chg_hist_srno numeric(22) NOT NULL,
	bfch_cn varchar(750) NULL,
	afch_cn varchar(750) NULL,
	del_yn varchar(1) NULL,
	frst_regst_id varchar(50) NULL,
	frst_rgsr_dttm timestamp(6) NULL,
	last_chpr_id varchar(50) NULL,
	last_chg_dttm timestamp(6) NULL,
	chg_ctgy varchar(100) NULL,
	chg_tp_cd varchar(2) NULL,
	CONSTRAINT tb_poti_emp_h_pk PRIMARY KEY (col_nm, chg_hist_srno, pbsr_no)
);


-- alpassint.tb_poti_impv_opin definition

-- Drop table

-- DROP TABLE alpassint.tb_poti_impv_opin;

CREATE TABLE alpassint.tb_poti_impv_opin (
	impv_opin_srno numeric(22) NOT NULL,
	app_clsf_cd varchar(3) NULL,
	impv_opin_tp_cd varchar(2) NULL,
	impv_opin_ttle varchar(300) NULL,
	impv_opin_cn varchar(4000) NULL,
-- 	impv_opin_lqty_cn sys."clob" NULL,
	mdpn_id varchar(50) NULL,
	inqt_cnt numeric(10) NULL,
	atch_file_id varchar(60) NULL,
	prcs_stts_cd varchar(3) NULL,
	del_yn varchar(1) NOT NULL,
	frst_regst_id varchar(50) NOT NULL,
	frst_rgsr_dttm timestamp(6) NOT NULL,
	last_chpr_id varchar(50) NOT NULL,
	last_chg_dttm timestamp(6) NOT NULL,
	orgn_mgmt_cd varchar(10) NULL,
	make_dttm timestamp NULL,
	bsop_ctgy_cd varchar(3) NULL,
	pbsr_no varchar(7) NULL,
	CONSTRAINT tb_poti_impv_opin_pk PRIMARY KEY (impv_opin_srno)
);


-- alpassint.tb_poti_emp_auth definition

-- Drop table

-- DROP TABLE alpassint.tb_poti_emp_auth;

CREATE TABLE alpassint.tb_poti_emp_auth (
	pbsr_no varchar(7) NOT NULL,
	role_id varchar(30) NOT NULL,
	mn_role_yn varchar(1) NULL,
	auth_vald_strt_dt varchar(8) NULL,
	auth_vald_end_dt varchar(8) NULL,
	auth_rgsr_dt varchar(8) NULL,
	auth_wdrw_yn varchar(1) NULL,
	auth_wdrw_dt varchar(8) NULL,
	auth_wdrw_rsn_cd varchar(2) NULL,
	use_yn varchar(1) NULL,
	del_yn varchar(1) NULL,
	frst_regst_id varchar(50) NULL,
	frst_rgsr_dttm timestamp(6) NULL,
	last_chpr_id varchar(50) NULL,
	last_chg_dttm timestamp(6) NULL,
	orgn_cd varchar(10) NULL,
	CONSTRAINT tb_poti_emp_auth_pk PRIMARY KEY (pbsr_no, role_id)
-- 	CONSTRAINT tb_poti_emp_auth_fk1 FOREIGN KEY (pbsr_no) REFERENCES alpassint.tb_poti_emp_acct(pbsr_no)
);


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
	CONSTRAINT tb_coc_brq_emp_pk PRIMARY KEY (brq_emp_ref_no)
);
CREATE INDEX tb_coc_brq_emp_ix01 ON alpassint.tb_coc_brq_emp USING btree (brq_ref_no, brq_emp_ref_no);
CREATE INDEX tb_coc_brq_emp_ix02 ON alpassint.tb_coc_brq_emp USING btree (emp_pbsr_no);
CREATE INDEX tb_coc_brq_emp_ix03 ON alpassint.tb_coc_brq_emp USING btree (emp_fmnm, emp_nm);

-- Table Triggers

create trigger trigger_tb_coc_brq_emp_update before
delete
    on
    alpassint.tb_coc_brq_emp for each row execute function alpassint.tb_coc_brq_emp_update_history();


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


-- alpassint.tb_coc_brq_emp foreign keys

ALTER TABLE alpassint.tb_coc_brq_emp ADD CONSTRAINT tb_coc_brq_emp_fk FOREIGN KEY (brq_ref_no) REFERENCES alpassint.tb_coc_brq(brq_ref_no);


-- alpassint.tb_coc_emp_oprn_rel foreign keys

ALTER TABLE alpassint.tb_coc_emp_oprn_rel ADD CONSTRAINT tb_coc_oprn_fk FOREIGN KEY (oprn_ref_no) REFERENCES alpassint.tb_coc_oprn(oprn_ref_no);
ALTER TABLE alpassint.tb_coc_emp_oprn_rel ADD CONSTRAINT tb_poti_co_emp_fk FOREIGN KEY (co_emp_ref_no) REFERENCES alpassint.tb_poti_co_emp(pbsr_no);


-- alpassint.tb_coc_emp_rprt_rel foreign keys

ALTER TABLE alpassint.tb_coc_emp_rprt_rel ADD CONSTRAINT tb_coc_rprt_fk FOREIGN KEY (rprt_ref_no) REFERENCES alpassint.tb_coc_rprt(rprt_ref_no);
ALTER TABLE alpassint.tb_coc_emp_rprt_rel ADD CONSTRAINT tb_poti_co_emp_fk FOREIGN KEY (co_emp_ref_no) REFERENCES alpassint.tb_poti_co_emp(pbsr_no);


-- alpassint.tb_poti_orgn definition

-- Drop table

-- DROP TABLE alpassint.tb_poti_orgn;

CREATE TABLE alpassint.tb_poti_orgn (
	orgn_mgmt_cd varchar(10) NOT NULL,
	orgn_cd varchar(20) NULL,
	orgn_tp_cd varchar(10) NULL,
	orgn_nm varchar(200) NULL,
	orgn_desc varchar(500) NULL,
	orgn_regn_cd varchar(10) NULL,
	orgn_addr varchar(140) NULL,
	rprs_tlph_no varchar(50) NULL,
	rprs_fax_no varchar(50) NULL,
	hsrk_orgn_mgmt_cd varchar(10) NULL,
	upr_orgn_mgmt_cd varchar(10) NULL,
	orgn_stts_cd varchar(2) NULL,
	del_yn varchar(1) NULL,
	frst_regst_id varchar(50) NULL,
	frst_rgsr_dttm timestamp(6) NULL,
	last_chpr_id varchar(50) NULL,
	last_chg_dttm timestamp(6) NULL,
	orgn_eng_nm varchar(200) NULL,
	post_cd varchar(5) NULL,
	admn_cd varchar(6) NULL,
	acnt_cd varchar(8) NULL,
	lttd numeric(10, 7) NULL,
	lngt numeric(10, 7) NULL,
	vrtl_orgn_yn varchar(1) NULL,
	sort_ordr varchar(10) NULL,
	dphd_id varchar(7) NULL,
	orgn_ar_nm varchar(200) NULL,
	blng_orgn_mgmt_cd varchar(10) NULL,
	eml varchar(200) NULL,
	orgn_auth varchar(1) NULL,
	dgd_cd varchar(9) NULL,
	actv_cstm_cd varchar(200) NULL,
	ccp_ac_no varchar(35) NULL,
	rit_ac_no varchar(35) NULL,
	CONSTRAINT tb_poti_orgn_pk PRIMARY KEY (orgn_mgmt_cd),
	CONSTRAINT tb_poti_orgn_unique01 UNIQUE (orgn_cd)
);

