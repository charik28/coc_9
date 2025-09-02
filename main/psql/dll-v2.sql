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


-- alpassint.tb_coc_vhcl_oprn_rel definition

-- Drop table

-- DROP TABLE alpassint.tb_coc_vhcl_oprn_rel;

CREATE TABLE alpassint.tb_coc_vhcl_oprn_rel (
                                                oprn_ref_no varchar(23) NOT NULL,
                                                vhcl_ref_no varchar(23) NULL,
                                                CONSTRAINT tb_coc_oprn_fk FOREIGN KEY (oprn_ref_no) REFERENCES alpassint.tb_coc_oprn(oprn_ref_no),
                                                CONSTRAINT tb_coc_vhcl_fk FOREIGN KEY (vhcl_ref_no) REFERENCES alpassint.tb_coc_vhcl(vhcl_ref_no)
);