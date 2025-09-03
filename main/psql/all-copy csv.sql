--loaded 1 of 72 file
select count(*)
FROM alpassint.tb_coc_amo;
COPY alpassint.tb_coc_1amo ("amo_ref_no", "amo_qty", "amo_calb", "orgn_cd", "del_yn", "use_yn", "frst_regst_id",
                           "frst_rgsr_dttm", "last_chpr_id", "last_chg_dttm", "amo_mnfc_yy",
                           "white_yn") FROM 'C:\wrk\dzGeo\cocDb\csv\tb_coc_amo_202509020829.csv' DELIMITER ',' CSV HEADER;
select count(*)
FROM alpassint.tb_coc_amo_oprn_rel;
COPY alpassint.tb_coc_amo_oprn_rel ("oprn_ref_no", "amo_qty", "amo_ref_no") FROM 'C:\wrk\dzGeo\cocDb\csv\tb_coc_amo_oprn_rel_202509020829.csv' DELIMITER ',' CSV HEADER;
/*select count(*)
FROM alpassint.tb_coc_arm;
COPY alpassint.tb_coc_arm ("arm_ref_no", "arm_srno", "arm_mx_cp_ch", "arm_cd", "orgn_cd", "del_yn", "use_yn",
                           "frst_regst_id", "frst_rgsr_dttm", "last_chpr_id", "last_chg_dttm",
                           "arm_stts") FROM 'C:\wrk\dzGeo\cocDb\csv\tb_coc_arm_202509020829.csv' DELIMITER ',' CSV HEADER;
*/select count(*)
FROM alpassint.tb_coc_arm_oprn_rel;
COPY alpassint.tb_coc_arm_oprn_rel ("oprn_ref_no", "arm_ref_no") FROM 'C:\wrk\dzGeo\cocDb\csv\tb_coc_arm_oprn_rel_202509020829.csv' DELIMITER ',' CSV HEADER;
/*select count(*)
FROM alpassint.tb_coc_brq;
COPY alpassint.tb_coc_brq ("brq_ref_no", "sctr_cd", "orgn_cd", "brq_dt", "dptm_cd", "dptm_nm", "inf_type", "brq_dt_tm",
                           "brq_post_cd", "brq_post_nm", "brq_post_nm_sup", "brq_tch_inf", "brq_dclr_no", "brq_prcd",
                           "inry_dptr_port", "inry_arv_port", "inry_ship_nm", "inry_vyg_dt", "amnd_val",
                           "amnd_jrdq_txt", "cmrc_regs_no", "nif_no", "del_yn", "frst_regst_id", "frst_rgsr_dttm",
                           "last_chpr_id", "last_chg_dttm", "brq_tp", "brq_long", "brq_lat", "vldt_stts",
                           "atch_file_id", "typ_vyg", "dlvr_regs_no", "cmpny_nm", "cmpny_typ", "cmpny_addr",
                           "curr_cd") FROM 'C:\wrk\dzGeo\cocDb\csv\tb_coc_brq_202509020829.csv' DELIMITER ',' CSV HEADER;
*/
select count(*)
FROM alpassint.tb_coc_brq_cag;
COPY alpassint.tb_coc_brq_cag ("brq_cag_ref_no", "brq_ref_no", "cag_tp", "cag_qty", "cag_wg", "cag_frd_val_unit",
                               "cag_frd_val_ttl", "cag_ctg",
                               "curr_cd") FROM 'C:\wrk\dzGeo\cocDb\csv\tb_coc_brq_cag_202509020829.csv' DELIMITER ',' CSV HEADER;
select count(*)
FROM alpassint.tb_coc_brq_cag_h;
COPY alpassint.tb_coc_brq_cag_h ("hist_id", "brq_cag_ref_no", "brq_ref_no", "cag_tp", "cag_qty", "cag_wg",
                                 "cag_frd_val_unit", "cag_frd_val_ttl", "cag_ctg", "update_by", "update_at",
                                 "curr_cd") FROM 'C:\wrk\dzGeo\cocDb\csv\tb_coc_brq_cag_h_202509020829.csv' DELIMITER ',' CSV HEADER;
select count(*)
FROM alpassint.tb_coc_brq_emp;
COPY alpassint.tb_coc_brq_emp ("brq_emp_ref_no", "brq_ref_no", "emp_pbsr_no", "emp_fmnm", "emp_nm", "emp_fonc_nm",
                               "emp_grd_nm") FROM 'C:\wrk\dzGeo\cocDb\csv\tb_coc_brq_emp_202509020829.csv' DELIMITER ',' CSV HEADER;
select count(*)
FROM alpassint.tb_coc_brq_emp;
COPY alpassint.tb_coc_brq_emp ("brq_emp_ref_no", "brq_ref_no", "emp_pbsr_no", "emp_fmnm", "emp_nm", "emp_fonc_nm",
                               "emp_grd_nm") FROM 'C:\wrk\dzGeo\cocDb\csv\tb_coc_brq_emp_202509020835.csv' DELIMITER ',' CSV HEADER;
select count(*)
FROM alpassint.tb_coc_brq_emp_h;
COPY alpassint.tb_coc_brq_emp_h ("hist_id", "brq_emp_ref_no", "brq_ref_no", "emp_pbsr_no", "emp_fmnm", "emp_nm",
                                 "emp_fonc_nm", "emp_grd_nm",
                                 "update_at") FROM 'C:\wrk\dzGeo\cocDb\csv\tb_coc_brq_emp_h_202509020829.csv' DELIMITER ',' CSV HEADER;
select count(*)
FROM alpassint.tb_coc_brq_emp_h;
COPY alpassint.tb_coc_brq_emp_h ("hist_id", "brq_emp_ref_no", "brq_ref_no", "emp_pbsr_no", "emp_fmnm", "emp_nm",
                                 "emp_fonc_nm", "emp_grd_nm",
                                 "update_at") FROM 'C:\wrk\dzGeo\cocDb\csv\tb_coc_brq_emp_h_202509020835.csv' DELIMITER ',' CSV HEADER;
select count(*)
FROM alpassint.tb_coc_brq_h;
COPY alpassint.tb_coc_brq_h ("hist_id", "brq_ref_no", "sctr_cd", "orgn_cd", "brq_dt", "dptm_cd", "dptm_nm", "inf_type",
                             "brq_dt_tm", "brq_post_cd", "brq_post_nm", "brq_post_nm_sup", "brq_tch_inf", "brq_dclr_no",
                             "brq_prcd", "inry_dptr_port", "inry_arv_port", "inry_ship_nm", "inry_vyg_dt", "amnd_val",
                             "amnd_jrdq_txt", "cmrc_regs_no", "nif_no", "del_yn", "frst_regst_id", "frst_rgsr_dttm",
                             "last_chpr_id", "last_chg_dttm", "brq_tp", "brq_long", "brq_lat", "vldt_stts",
                             "atch_file_id", "update_at", "update_by", "typ_vyg", "dlvr_regs_no", "curr_cd",
                             "cmpny_addr") FROM 'C:\wrk\dzGeo\cocDb\csv\tb_coc_brq_h_202509020829.csv' DELIMITER ',' CSV HEADER;
select count(*)
FROM alpassint.tb_coc_brq_inc_acc;
COPY alpassint.tb_coc_brq_inc_acc ("inc_acc_ref_no", "sctr_cd", "orgn_cd", "inc_acc_dt", "dptm_cd", "dptm_nm",
                                   "inc_acc_sbjct", "inc_acc_dt_tm", "inc_acc_dtl", "inc_acc_type", "del_yn",
                                   "frst_regst_id", "frst_rgsr_dttm", "last_chpr_id", "last_chg_dttm", "vldt_stts",
                                   "atch_file_id", "brq_lat",
                                   "brq_long") FROM 'C:\wrk\dzGeo\cocDb\csv\tb_coc_brq_inc_acc_202509020829.csv' DELIMITER ',' CSV HEADER;
select count(*)
FROM alpassint.tb_coc_brq_inc_acc_h;
COPY alpassint.tb_coc_brq_inc_acc_h ("hist_id", "inc_acc_ref_no", "sctr_cd", "orgn_cd", "inc_acc_dt", "dptm_cd",
                                     "dptm_nm", "inc_acc_sbjct", "inc_acc_dt_tm", "inc_acc_dtl", "inc_acc_type",
                                     "del_yn", "frst_regst_id", "frst_rgsr_dttm", "last_chpr_id", "last_chg_dttm",
                                     "vldt_stts", "atch_file_id", "update_by", "update_at", "brq_lat",
                                     "brq_long") FROM 'C:\wrk\dzGeo\cocDb\csv\tb_coc_brq_inc_acc_h_202509020829.csv' DELIMITER ',' CSV HEADER;
select count(*)
FROM alpassint.tb_coc_brq_prsn;
COPY alpassint.tb_coc_brq_prsn ("brq_prsn_ref_no", "brq_ref_no", "brq_prsn_tp_cd", "prsn_nm", "prsn_fm_nm",
                                "prsn_rgsr_no", "prsn_nat_nm", "prsn_post_cd", "prsn_post_nm", "prsn_post_nm_sup",
                                "prsn_brdy", "prsn_age", "prsn_gndr", "typ_doc", "dlv_dt",
                                "dlv_agncy") FROM 'C:\wrk\dzGeo\cocDb\csv\tb_coc_brq_prsn_202509020829.csv' DELIMITER ',' CSV HEADER;
select count(*)
FROM alpassint.tb_coc_brq_prsn_h;
COPY alpassint.tb_coc_brq_prsn_h ("hist_id", "brq_prsn_ref_no", "brq_ref_no", "brq_prsn_tp_cd", "prsn_nm", "prsn_fm_nm",
                                  "prsn_rgsr_no", "prsn_nat_nm", "prsn_post_cd", "prsn_post_nm", "prsn_post_nm_sup",
                                  "prsn_brdy", "prsn_age", "prsn_gndr", "typ_doc", "update_at", "dlv_dt",
                                  "dlv_agncy") FROM 'C:\wrk\dzGeo\cocDb\csv\tb_coc_brq_prsn_h_202509020829.csv' DELIMITER ',' CSV HEADER;
select count(*)
FROM alpassint.tb_coc_brq_trnp;
COPY alpassint.tb_coc_brq_trnp ("brq_trnp_ref_no", "brq_ref_no", "trnp_tp", "trnp_mt", "trnp_chss_no", "trnp_prtr",
                                "trnp_val",
                                "curr_cd") FROM 'C:\wrk\dzGeo\cocDb\csv\tb_coc_brq_trnp_202509020829.csv' DELIMITER ',' CSV HEADER;
select count(*)
FROM alpassint.tb_coc_brq_trnp_h;
COPY alpassint.tb_coc_brq_trnp_h ("hist_id", "brq_trnp_ref_no", "brq_ref_no", "trnp_tp", "trnp_mt", "trnp_chss_no",
                                  "trnp_prtr", "trnp_val", "update_at",
                                  "curr_cd") FROM 'C:\wrk\dzGeo\cocDb\csv\tb_coc_brq_trnp_h_202509020829.csv' DELIMITER ',' CSV HEADER;
select count(*)
FROM alpassint.tb_coc_brq_vldt;
COPY alpassint.tb_coc_brq_vldt ("brq_vldt_ref_no", "brq_ref_no", "id_user", "pbsr_no", "emp_nm", "emp_fmnm", "sctr_cd",
                                "sctr_nm", "frst_regst_id", "frst_rgsr_dttm", "last_chpr_id",
                                "last_chg_dttm") FROM 'C:\wrk\dzGeo\cocDb\csv\tb_coc_brq_vldt_202509020829.csv' DELIMITER ',' CSV HEADER;
select count(*)
FROM alpassint.tb_coc_cnn;
COPY alpassint.tb_coc_cnn ("cnn_ref_no", "cnn_nm", "cnn_age", "cnn_tp", "cnn_bld", "cnn_spcl", "cnn_rc", "cnn_img",
                           "orgn_cd", "del_yn", "use_yn", "pbsr_no", "frst_regst_id", "frst_rgsr_dttm", "last_chpr_id",
                           "last_chg_dttm") FROM 'C:\wrk\dzGeo\cocDb\csv\tb_coc_cnn_202509020829.csv' DELIMITER ',' CSV HEADER;
select count(*)
FROM alpassint.tb_coc_cnn_oprn_rel;--0
COPY alpassint.tb_coc_cnn_oprn_rel ("oprn_ref_no", "cnn_ref_no") FROM 'C:\wrk\dzGeo\cocDb\csv\tb_coc_cnn_oprn_rel_202509020829.csv' DELIMITER ',' CSV HEADER;
select count(*)
FROM alpassint.tb_coc_colab_oprn_rel;
COPY alpassint.tb_coc_colab_oprn_rel ("oprn_ref_no", "colab_cd") FROM 'C:\wrk\dzGeo\cocDb\csv\tb_coc_colab_oprn_rel_202509020829.csv' DELIMITER ',' CSV HEADER;
select count(*)
FROM alpassint.tb_coc_emp_oprn_rel;
COPY alpassint.tb_coc_emp_oprn_rel ("oprn_ref_no", "co_emp_ref_no") FROM 'C:\wrk\dzGeo\cocDb\csv\tb_coc_emp_oprn_rel_202509020829.csv' DELIMITER ',' CSV HEADER;
select count(*)
FROM alpassint.tb_coc_emp_oprn_rel;--2277
truncate table alpassint.tb_coc_emp_oprn_rel;
COPY alpassint.tb_coc_emp_oprn_rel ("oprn_ref_no", "co_emp_ref_no") FROM 'C:\wrk\dzGeo\cocDb\csv\tb_coc_emp_oprn_rel_202509020835.csv' DELIMITER ',' CSV HEADER;
select count(*)
FROM alpassint.tb_coc_emp_rprt_rel;
truncate table  alpassint.tb_coc_emp_rprt_rel;
COPY alpassint.tb_coc_emp_rprt_rel ("rprt_ref_no", "co_emp_ref_no", "del_yn") FROM 'C:\wrk\dzGeo\cocDb\csv\tb_coc_emp_rprt_rel_202509020829.csv' DELIMITER ',' CSV HEADER;
select count(*)
FROM alpassint.tb_coc_emp_rprt_rel;
COPY alpassint.tb_coc_emp_rprt_rel ("rprt_ref_no", "co_emp_ref_no", "del_yn") FROM 'C:\wrk\dzGeo\cocDb\csv\tb_coc_emp_rprt_rel_202509020835.csv' DELIMITER ',' CSV HEADER;
select count(*)
FROM alpassint.tb_coc_eqip;
COPY alpassint.tb_coc_eqip ("eqip_ref_no", "eqip_invn_no", "eqip_nm", "eqip_tp", "eqip_desc", "eqip_stts", "orgn_cd",
                            "del_yn", "use_yn", "frst_regst_id", "frst_rgsr_dttm", "last_chpr_id",
                            "last_chg_dttm") FROM 'C:\wrk\dzGeo\cocDb\csv\tb_coc_eqip_202509020829.csv' DELIMITER ',' CSV HEADER;
select count(*)
FROM alpassint.tb_coc_eqip_oprn_rel;
COPY alpassint.tb_coc_eqip_oprn_rel ("oprn_ref_no", "eqip_ref_no") FROM 'C:\wrk\dzGeo\cocDb\csv\tb_coc_eqip_oprn_rel_202509020829.csv' DELIMITER ',' CSV HEADER;
select count(*)
FROM alpassint.tb_coc_oprn;
COPY alpassint.tb_coc_oprn ("oprn_ref_no", "orgn_reff_no", "oprn_title", "oprn_stts", "oprn_tp", "oprn_addr",
                            "oprn_dpt_dttm", "oprn_strt_dttm", "oprn_end_dttm", "oprn_bck_dttm", "oprn_lat",
                            "oprn_long", "del_yn", "use_yn", "frst_regst_id", "frst_rgsr_dttm", "last_chpr_id",
                            "last_chg_dttm", "orgn_cd", "colab_nm", "oprn_st",
                            "oprn_cncl_rsn") FROM 'C:\wrk\dzGeo\cocDb\csv\tb_coc_oprn_202509020829.csv' DELIMITER ',' CSV HEADER;
select count(*)
FROM alpassint.tb_coc_oprn_tp_rel;
COPY alpassint.tb_coc_oprn_tp_rel ("oprn_ref_no", "oprn_tp_cd") FROM 'C:\wrk\dzGeo\cocDb\csv\tb_coc_oprn_tp_rel_202509020829.csv' DELIMITER ',' CSV HEADER;
select count(*)
FROM alpassint.tb_coc_rprt;
COPY alpassint.tb_coc_rprt ("rprt_ref_no", "rprt_tp_cd", "orgn_cd", "rprt_inf_ntr", "rprt_inf_dttm", "rprt_inf_plc",
                            "rprt_inf_tch", "dclr_no", "rprt_inf_prcd", "rprt_inf_amd", "curr_cd", "rprt_inf_jrdq_txt",
                            "atch_file_id", "cag_val_ttl", "oprn_ref_no", "del_yn", "use_yn", "frst_regst_id",
                            "frst_rgsr_dttm", "last_chpr_id", "last_chg_dttm", "rprt_lat", "rprt_long", "vldt_stts",
                            "unknown_yn", "chng_yn",
                            "chng_rsn") FROM 'C:\wrk\dzGeo\cocDb\csv\tb_coc_rprt_202509020829.csv' DELIMITER ',' CSV HEADER;
select count(*)
FROM alpassint.tb_coc_rprt_cag;
COPY alpassint.tb_coc_rprt_cag ("rprt_cag_id", "rprt_cag_ctg_cd", "rprt_cag_nm", "rprt_cag_qty", "unit_cd",
                                "rprt_cag_unit_val", "rprt_cag_ttl_val", "curr_cd", "rprt_ref_no",
                                "del_yn") FROM 'C:\wrk\dzGeo\cocDb\csv\tb_coc_rprt_cag_202509020829.csv' DELIMITER ',' CSV HEADER;
select count(*)
FROM alpassint.tb_coc_rprt_cmpny;
COPY alpassint.tb_coc_rprt_cmpny ("rprt_cmpny_id", "rprt_cmpny_tp_cd", "rprt_cmpny_nm", "rprt_cmpny_addr",
                                  "rprt_cmpny_cmrc_regs_no", "rprt_cmpny_nif_no", "rprt_cmpny_dlv_dt", "rprt_ref_no",
                                  "del_yn") FROM 'C:\wrk\dzGeo\cocDb\csv\tb_coc_rprt_cmpny_202509020829.csv' DELIMITER ',' CSV HEADER;
select count(*)
FROM alpassint.tb_coc_rprt_h;
COPY alpassint.tb_coc_rprt_h ("hist_id", "rprt_ref_no", "rprt_tp_cd", "orgn_cd", "rprt_inf_ntr", "rprt_inf_dttm",
                              "rprt_inf_plc", "rprt_inf_tch", "dclr_no", "rprt_inf_prcd", "rprt_inf_amd", "curr_cd",
                              "rprt_inf_jrdq_txt", "atch_file_id", "cag_val_ttl", "oprn_ref_no", "del_yn", "use_yn",
                              "frst_regst_id", "frst_rgsr_dttm", "last_chpr_id", "last_chg_dttm", "rprt_lat",
                              "rprt_long", "vldt_stts", "unknown_yn", "chng_yn", "chng_rsn", "update_at",
                              "update_by") FROM 'C:\wrk\dzGeo\cocDb\csv\tb_coc_rprt_h_202509020829.csv' DELIMITER ',' CSV HEADER;
select count(*)
FROM alpassint.tb_coc_rprt_inc;
COPY alpassint.tb_coc_rprt_inc ("rprt_inc_ref_no", "orgn_cd", "rprt_inc_tp_cd", "rprt_inc_dttm", "rprt_inc_ttl",
                                "rprt_inc_desc", "atch_file_id", "oprn_ref_no", "del_yn", "use_yn", "frst_regst_id",
                                "frst_rgsr_dttm", "last_chpr_id",
                                "last_chg_dttm") FROM 'C:\wrk\dzGeo\cocDb\csv\tb_coc_rprt_inc_202509020829.csv' DELIMITER ',' CSV HEADER;
select count(*)
FROM alpassint.tb_coc_rprt_prsn;
COPY alpassint.tb_coc_rprt_prsn ("rprt_prsn_id", "rprt_prsn_tp_cd", "rprt_prsn_nm", "rprt_prsn_fmnm",
                                 "rprt_prsn_typ_doc", "rprt_prsn_rgsr_no", "rprt_prsn_dlv_dt", "rprt_prsn_dlv_agncy",
                                 "rprt_prsn_nat_cd", "rprt_prsn_addr", "rprt_prsn_brdy", "prsn_gndr", "rprt_ref_no",
                                 "rprt_prsn_nin", "rprt_prsn_nm_fr", "rprt_prsn_fmnm_fr", "rprt_prsn_temp_brdy",
                                 "del_yn") FROM 'C:\wrk\dzGeo\cocDb\csv\tb_coc_rprt_prsn_202509020829.csv' DELIMITER ',' CSV HEADER;
select count(*)
FROM alpassint.tb_coc_rprt_trnp;
COPY alpassint.tb_coc_rprt_trnp ("rprt_trnp_id", "rprt_trnp_mdl_cd", "rprt_trnp_brnd_cd", "rprt_trnp_rgsr_no",
                                 "rprt_trnp_chss_no", "rprt_trnp_owvh", "rprt_trnp_unit_val", "curr_cd", "rprt_ref_no",
                                 "rprt_trnp_tp_cd",
                                 "del_yn") FROM 'C:\wrk\dzGeo\cocDb\csv\tb_coc_rprt_trnp_202509020829.csv' DELIMITER ',' CSV HEADER;
select count(*)
FROM alpassint.tb_coc_rprt_vyg;
COPY alpassint.tb_coc_rprt_vyg ("rprt_vyg_id", "rprt_vyg_dptr", "rprt_vyg_dstn", "rprt_vyg_trnp_nm", "rprt_vyg_dt",
                                "rprt_ref_no", "rprt_vyg_tp",
                                "del_yn") FROM 'C:\wrk\dzGeo\cocDb\csv\tb_coc_rprt_vyg_202509020829.csv' DELIMITER ',' CSV HEADER;
select count(*)
FROM alpassint.tb_coc_rprt_vyg_h;
COPY alpassint.tb_coc_rprt_vyg_h ("hist_id", "rprt_vyg_id", "rprt_vyg_dptr", "rprt_vyg_dstn", "rprt_vyg_trnp_nm",
                                  "rprt_vyg_dt", "rprt_ref_no", "rprt_vyg_tp",
                                  "del_yn") FROM 'C:\wrk\dzGeo\cocDb\csv\tb_coc_rprt_vyg_h_202509020829.csv' DELIMITER ',' CSV HEADER;
select count(*)
FROM alpassint.tb_coc_vhcl;
COPY alpassint.tb_coc_vhcl ("vhcl_ref_no", "vhcl_knd_cd", "vhcl_rgsr_no", "vhcl_chss_no", "vhcl_mnfc_yy", "vhcl_mdl_cd",
                            "vhcl_brnd_cd", "vhcl_stts", "orgn_cd", "del_yn", "use_yn", "frst_regst_id",
                            "frst_rgsr_dttm", "last_chpr_id", "last_chg_dttm",
                            "vhcl_cnd_cd") FROM 'C:\wrk\dzGeo\cocDb\csv\tb_coc_vhcl_202509020829.csv' DELIMITER ',' CSV HEADER;
select count(*)
FROM alpassint.tb_coc_vhcl_oprn_rel;
COPY alpassint.tb_coc_vhcl_oprn_rel ("oprn_ref_no", "vhcl_ref_no") FROM 'C:\wrk\dzGeo\cocDb\csv\tb_coc_vhcl_oprn_rel_202509020829.csv' DELIMITER ',' CSV HEADER;
select count(*)
FROM alpassint.tb_com_coc_vhcl_mdl;
COPY alpassint.tb_com_coc_vhcl_mdl ("vhcl_mdl_cd", "vhcl_mdl_nm", "vhcl_mnur_cd", "del_yn", "frst_regst_id",
                                    "frst_rgsr_dttm", "last_chpr_id",
                                    "last_chg_dttm") FROM 'C:\wrk\dzGeo\cocDb\csv\tb_com_coc_vhcl_mdl_202509020829.csv' DELIMITER ',' CSV HEADER;
select count(*)
FROM alpassint.tb_com_coc_vhcl_mnur;
COPY alpassint.tb_com_coc_vhcl_mnur ("vhcl_mnur_cd", "vhcl_mnur_nm", "del_yn", "frst_regst_id", "frst_rgsr_dttm",
                                     "last_chpr_id",
                                     "last_chg_dttm") FROM 'C:\wrk\dzGeo\cocDb\csv\tb_com_coc_vhcl_mnur_202509020829.csv' DELIMITER ',' CSV HEADER;
select count(*)
FROM alpassint.tb_com_comm_cd;
COPY alpassint.tb_com_comm_cd ("comm_id", "wly_cd", "del_yn", "frst_regst_id", "frst_rgsr_dttm", "last_chpr_id",
                               "last_chg_dttm") FROM 'C:\wrk\dzGeo\cocDb\csv\tb_com_comm_cd_202509020833.csv' DELIMITER ',' CSV HEADER;
select count(*)
FROM alpassint.tb_com_comm_cd_lang;
COPY alpassint.tb_com_comm_cd_lang ("comm_id", "lang_cd", "comm_nm", "daira_nm", "del_yn", "frst_regst_id",
                                    "frst_rgsr_dttm", "last_chpr_id",
                                    "last_chg_dttm") FROM 'C:\wrk\dzGeo\cocDb\csv\tb_com_comm_cd_lang_202509020833.csv' DELIMITER ',' CSV HEADER;
select count(*)
FROM alpassint.tb_com_comn_cd;
COPY alpassint.tb_com_comn_cd ("comn_cd", "bsop_clsf_cd", "upr_comn_cd", "cd_desc", "xtrn_ofr_yn", "use_yn", "del_yn",
                               "frst_regst_id", "frst_rgsr_dttm", "last_chpr_id", "last_chg_dttm",
                               "atch_file_id") FROM 'C:\wrk\dzGeo\cocDb\csv\tb_com_comn_cd_202509020833.csv' DELIMITER ',' CSV HEADER;
select count(*)
FROM alpassint.tb_com_comn_cd_d;
COPY alpassint.tb_com_comn_cd_d ("comn_cd", "cd_vdval", "upr_comn_cd", "upr_cd_vdval", "vald_strt_dt", "vald_end_dt",
                                 "sort_ordr", "use_yn", "del_yn", "frst_regst_id", "frst_rgsr_dttm", "last_chpr_id",
                                 "last_chg_dttm", "use_tp_cd", "user_defn_vdval1", "user_defn_vdval2",
                                 "user_defn_vdval3") FROM 'C:\wrk\dzGeo\cocDb\csv\tb_com_comn_cd_d_202509020833.csv' DELIMITER ',' CSV HEADER;
select count(*)
FROM alpassint.tb_com_comn_cd_d_lang;
COPY alpassint.tb_com_comn_cd_d_lang ("comn_cd", "cd_vdval", "lang_cd", "cd_vdval_nm", "del_yn", "frst_regst_id",
                                      "frst_rgsr_dttm", "last_chpr_id",
                                      "last_chg_dttm") FROM 'C:\wrk\dzGeo\cocDb\csv\tb_com_comn_cd_d_lang_202509020833.csv' DELIMITER ',' CSV HEADER;
select count(*)
FROM alpassint.tb_com_prcs_stts_infm;
COPY alpassint.tb_com_prcs_stts_infm ("msg_id", "rcpn_msg_id", "bsop_clsf_cd", "prcs_stts_cd", "dclr_doc_cd",
                                      "doc_sbmt_no", "cstm_acap_no", "infm_doc_cd", "infm_orgn_cd", "bsop_prcs_stts_cd",
                                      "bsop_prcs_stts_infm_cn", "infm_dttm", "pobx_id", "trsn_yn", "infm_cn_msg_cd",
                                      "infm_cn_prmt_val", "co_rqst_no", "mdfy_dgcnt", "trsn_tp_cd", "oths_reff_no1",
                                      "oths_reff_no2", "del_yn", "frst_regst_id", "frst_rgsr_dttm", "last_chpr_id",
                                      "last_chg_dttm") FROM 'C:\wrk\dzGeo\cocDb\csv\tb_com_prcs_stts_infm_202509020835.csv' DELIMITER ',' CSV HEADER;
select count(*)
FROM alpassint.tb_com_psn_user_auth;
COPY alpassint.tb_com_psn_user_auth ("role_id", "user_id", "use_yn", "del_yn", "frst_regst_id", "frst_rgsr_dttm",
                                     "last_chpr_id",
                                     "last_chg_dttm") FROM 'C:\wrk\dzGeo\cocDb\csv\tb_com_psn_user_auth_202509020835.csv' DELIMITER ',' CSV HEADER;
select count(*)
FROM alpassint.tb_com_temp_atch_file;--13,832 rows affected in 139 ms
truncate table alpassint.tb_com_temp_atch_file;
COPY alpassint.tb_com_temp_atch_file ("temp_atch_file_id", "srbk_file_nm", "save_file_nm", "file_path_nm", "file_size",
                                      "bsop_clsf_cd", "del_yn", "frst_regst_id", "frst_rgsr_dttm", "last_chpr_id",
                                      "last_chg_dttm",
                                      "file_desc_cn") FROM 'C:\wrk\dzGeo\cocDb\csv\tb_com_temp_atch_file_202509020835.csv' DELIMITER ',' CSV HEADER;
select count(*)
FROM alpassint.tb_com_user_acct;
COPY alpassint.tb_com_user_acct ("user_id", "pwd", "pwd_chg_dt", "pwd_intz_yn", "pwd_fail_ncnt", "acct_lcked_yn",
                                 "acct_lcked_rsn_cd", "acct_lcked_dt", "acct_lcked_rele_dt", "acct_puse_yn",
                                 "acct_puse_rsn_cd", "acct_puse_strt_dt", "acct_puse_end_dt", "user_ip", "del_yn",
                                 "frst_regst_id", "frst_rgsr_dttm", "last_chpr_id", "last_chg_dttm", "frst_lgn_yn",
                                 "last_lgn_dttm", "adit_crtf_cd",
                                 "user_clsf_cd") FROM 'C:\wrk\dzGeo\cocDb\csv\tb_com_user_acct_202509020835.csv' DELIMITER ',' CSV HEADER;
select count(*)
FROM alpassint.tb_com_wrhs_jrsd_emp;
COPY alpassint.tb_com_wrhs_jrsd_emp ("pbsr_no", "nif", "co_dclr_cd", "del_yn", "frst_regst_id", "frst_rgsr_dttm",
                                     "last_chpr_id",
                                     "last_chg_dttm") FROM 'C:\wrk\dzGeo\cocDb\csv\tb_com_wrhs_jrsd_emp_202509020835.csv' DELIMITER ',' CSV HEADER;
select count(*)
FROM alpassint.tb_pote_cntt_actv_mtr_cd_temp;
COPY alpassint.tb_pote_cntt_actv_mtr_cd_temp ("msg_id", "msg_prcs_stts_cd", "actv_mtr_cd", "actv_mtr_cd_nm", "del_yn",
                                              "frst_regst_id", "frst_rgsr_dttm", "last_chpr_id", "last_chg_dttm",
                                              "btch_prcc_yn", "code",
                                              "libelle") FROM 'C:\wrk\dzGeo\cocDb\csv\tb_pote_cntt_actv_mtr_cd_temp_202509020835.csv' DELIMITER ',' CSV HEADER;
select count(*)
FROM alpassint.tb_pote_cntt_cmrc_regs_actv_mtr_temp;--8,602,460 rows affected in 4 s 823 ms
truncate table alpassint.tb_pote_cntt_cmrc_regs_actv_mtr_temp;
COPY alpassint.tb_pote_cntt_cmrc_regs_actv_mtr_temp ("msg_id", "msg_prcs_stts_cd", "cmrc_regs_no", "actv_mtr_cd",
                                                     "del_yn", "frst_regst_id", "frst_rgsr_dttm", "last_chpr_id",
                                                     "last_chg_dttm", "btch_prcc_yn", "nrc",
                                                     "code") FROM 'C:\wrk\dzGeo\cocDb\csv\tb_pote_cntt_cmrc_regs_actv_mtr_temp_202509020835.csv' DELIMITER ',' CSV HEADER;
select count(*)
FROM alpassint.tb_pote_cntt_cmrc_regs_temp;--0
COPY alpassint.tb_pote_cntt_cmrc_regs_temp ("msg_id", "msg_prcs_stts_cd", "cmrc_regs_no", "ents_cd", "wly_cd", "nif_cd",
                                            "nif_srno", "conm", "addr", "cmrc_regs_stts_cd", "atr_dt", "used_strt_dt",
                                            "beex_dt", "del_yn", "frst_regst_id", "frst_rgsr_dttm", "last_chpr_id",
                                            "last_chg_dttm", "commune", "trsm_dt", "invg_dt", "btch_prcc_yn", "nif",
                                            "commune_nm", "etat", "code_fiscal", "nordre", "nrc", "code_ets",
                                            "code_wilaya", "reg_comm", "adresse", "rs", "date_modif", "date_dexpl",
                                            "date_radiat", "stts_cd", "frst_rgst_dttm",
                                            "commue") FROM 'C:\wrk\dzGeo\cocDb\csv\tb_pote_cntt_cmrc_regs_temp_202509020835.csv' DELIMITER ',' CSV HEADER;
select count(*)
FROM alpassint.tb_pote_cntt_nif_temp;
COPY alpassint.tb_pote_cntt_nif_temp ("msg_id", "msg_prcs_stts_cd", "potx_cd", "potx_srno", "conm", "co_addr", "wly_nm",
                                      "post_cd", "nif_stts_cd", "btch_prcc_yn", "del_yn", "frst_regst_id",
                                      "frst_rgsr_dttm", "last_chpr_id", "last_chg_dttm", "co_rgsr_dt", "rs",
                                      "code_fiscal", "ordre", "adr", "wilaya", "code_postal", "situation",
                                      "date_suivi") FROM 'C:\wrk\dzGeo\cocDb\csv\tb_pote_cntt_nif_temp_202509020835.csv' DELIMITER ',' CSV HEADER;
select count(*)
FROM alpassint.tb_pote_cntt_prsn_regs_temp;--0
COPY alpassint.tb_pote_cntt_prsn_regs_temp ("msg_id", "msg_prcs_stts_cd", "cmrc_regs_no", "ents_cd", "wly_cd", "nif_cd",
                                            "nif_srno", "addr", "pobs_addr", "pobs_owr_nm", "bthp_nm", "birt_dt",
                                            "nat_nm", "cmrc_regs_stts_cd", "atr_dt", "used_strt_dt", "beex_dt",
                                            "del_yn", "frst_regst_id", "frst_rgsr_dttm", "last_chpr_id",
                                            "last_chg_dttm", "commune", "fmnm_nm", "gvnm_nm", "trsm_dt", "invg_dt",
                                            "btch_prcc_yn", "nif", "commune_nm", "etat", "code_fiscal", "nordre", "nrc",
                                            "code_ets", "code_wilaya", "reg_comm", "nom", "prenom", "adr_commer",
                                            "adr_local", "propri_local", "nationalite", "date_naiss", "lieu_naiss",
                                            "date_modif", "date_dexpl",
                                            "date_radiat") FROM 'C:\wrk\dzGeo\cocDb\csv\tb_pote_cntt_prsn_regs_temp_202509020835.csv' DELIMITER ',' CSV HEADER;
select count(*)
FROM alpassint.tb_poti_co_emp;--0
COPY alpassint.tb_poti_co_emp ("pbsr_no", "emp_nm", "emp_stts_cd", "inhb_rgsr_no", "eml", "brdy", "gndr_cd", "mobl_no",
                               "dept_tlph_no", "emp_addr", "phto_imge_cn", "wrkp_asn_dt", "enco_dt", "emp_bwrk_stts_cd",
                               "bsop_clsf_cd", "emp_fmnm", "far_nm", "mor_fmnm", "mor_nm", "emp_post_cd", "grd_cd",
                               "fonc_cd", "atch_file_id", "now_fonc_strt_dt", "temp_brdy", "del_yn", "frst_regst_id",
                               "frst_rgsr_dttm", "last_chpr_id", "last_chg_dttm", "bld_tp_cd",
                               "orgn_cd") FROM 'C:\wrk\dzGeo\cocDb\csv\tb_poti_co_emp_202509020835.csv' DELIMITER ',' CSV HEADER;
select count(*)
FROM alpassint.tb_poti_emp;
COPY alpassint.tb_poti_emp ("pbsr_no", "orgn_mgmt_cd", "emp_nm", "cstm_emp_no", "emp_stts_cd", "ctgy_cd", "gd_cd",
                            "clps_cd", "clas_cd", "frtg_expo", "inhb_rgsr_no", "eml", "brdy", "gndr_cd", "mobl_no",
                            "dept_tlph_no", "emp_addr", "phto_imge_cn", "wrkp_asn_dt", "enco_dt", "rtmn_dt",
                            "xtrn_emp_yn", "eml_rcpn_yn", "sms_rcpn_yn", "del_yn", "frst_regst_id", "frst_rgsr_dttm",
                            "last_chpr_id", "last_chg_dttm", "sctr_mgmt_cd", "cstm_mgmt_cd", "dept_mgmt_cd",
                            "blng_itt_cd", "emp_bwrk_stts_cd", "bsop_clsf_cd", "emp_fmnm", "far_nm", "mor_fmnm",
                            "mor_nm", "vtlt_yn", "bthp", "emp_post_cd", "emp_post_nm", "grd_cd", "fonc_cd",
                            "bf_wrkp_asn_end_dt", "atch_file_id", "orgn_chg_rsn_cd", "bwrk_end_pv_no",
                            "bwrk_strt_pv_no", "now_fonc_strt_dt", "fonc_stts_cd", "apot_dt", "apot_no",
                            "apot_atch_file_id",
                            "temp_brdy") FROM 'C:\wrk\dzGeo\cocDb\csv\tb_poti_emp_202509020835.csv' DELIMITER ',' CSV HEADER;
select count(*)
FROM alpassint.tb_poti_emp_acct;
COPY alpassint.tb_poti_emp_acct ("pbsr_no", "pwd", "pwd_chg_dt", "pwd_intz_yn", "pwd_fail_ncnt", "acct_lcked_yn",
                                 "acct_lcked_rsn_cd", "acct_lcked_dt", "acct_lcked_rele_dt", "acct_puse_yn",
                                 "acct_puse_rsn_cd", "acct_puse_strt_dt", "acct_puse_end_dt", "emp_ip", "del_yn",
                                 "frst_regst_id", "frst_rgsr_dttm", "last_chpr_id", "last_chg_dttm", "frst_lgn_yn",
                                 "last_lgn_dttm",
                                 "adit_crtf_cd") FROM 'C:\wrk\dzGeo\cocDb\csv\tb_poti_emp_acct_202509020835.csv' DELIMITER ',' CSV HEADER;
select count(*)
FROM alpassint.tb_poti_emp_auth;
COPY alpassint.tb_poti_emp_auth ("pbsr_no", "role_id", "mn_role_yn", "auth_vald_strt_dt", "auth_vald_end_dt",
                                 "auth_rgsr_dt", "auth_wdrw_yn", "auth_wdrw_dt", "auth_wdrw_rsn_cd", "use_yn", "del_yn",
                                 "frst_regst_id", "frst_rgsr_dttm", "last_chpr_id", "last_chg_dttm",
                                 "orgn_cd") FROM 'C:\wrk\dzGeo\cocDb\csv\tb_poti_emp_auth_202509020835.csv' DELIMITER ',' CSV HEADER;
select count(*)
FROM alpassint.tb_poti_emp_auth_h;
COPY alpassint.tb_poti_emp_auth_h ("pbsr_no", "role_id", "srno", "auth_athz_cd", "wrkr", "wkng_dttm", "del_yn",
                                   "frst_regst_id", "frst_rgsr_dttm", "last_chpr_id",
                                   "last_chg_dttm") FROM 'C:\wrk\dzGeo\cocDb\csv\tb_poti_emp_auth_h_202509020835.csv' DELIMITER ',' CSV HEADER;
select count(*)
FROM alpassint.tb_poti_emp_bak;
COPY alpassint.tb_poti_emp_bak ("pbsr_no", "orgn_mgmt_cd", "emp_nm", "cstm_emp_no", "emp_stts_cd", "ctgy_cd", "gd_cd",
                                "clps_cd", "clas_cd", "frtg_expo", "inhb_rgsr_no", "eml", "brdy", "gndr_cd", "mobl_no",
                                "dept_tlph_no", "emp_addr", "phto_imge_cn", "wrkp_asn_dt", "enco_dt", "rtmn_dt",
                                "xtrn_emp_yn", "eml_rcpn_yn", "sms_rcpn_yn", "del_yn", "frst_regst_id",
                                "frst_rgsr_dttm", "last_chpr_id", "last_chg_dttm", "sctr_mgmt_cd", "cstm_mgmt_cd",
                                "dept_mgmt_cd", "blng_itt_cd", "emp_bwrk_stts_cd", "bsop_clsf_cd", "emp_fmnm", "far_nm",
                                "mor_fmnm", "mor_nm", "vtlt_yn", "bthp", "emp_post_cd", "emp_post_nm", "grd_cd",
                                "fonc_cd") FROM 'C:\wrk\dzGeo\cocDb\csv\tb_poti_emp_bak_202509020835.csv' DELIMITER ',' CSV HEADER;
select count(*)
FROM alpassint.tb_poti_emp_bwrk_stts_hist;
COPY alpassint.tb_poti_emp_bwrk_stts_hist ("pbsr_no", "hist_srno", "emp_stts_cd", "emp_stts_chg_rsn_cn", "aply_strt_dt",
                                           "aply_end_dt", "del_yn", "frst_regst_id", "frst_rgsr_dttm", "last_chpr_id",
                                           "last_chg_dttm", "fonc_cd", "grd_cd", "atch_file_id", "absn_rsn_cd",
                                           "cmbk_rsn_cd", "absn_strt_dt", "absn_end_dt", "cmbk_strt_dt", "cmbk_end_dt",
                                           "xtns_rsn_cn",
                                           "xtns_yn") FROM 'C:\wrk\dzGeo\cocDb\csv\tb_poti_emp_bwrk_stts_hist_202509020835.csv' DELIMITER ',' CSV HEADER;
select count(*)
FROM alpassint.tb_poti_emp_fonc_hist;
COPY alpassint.tb_poti_emp_fonc_hist ("pbsr_no", "srno", "fonc_cd", "bf_fonc_cd", "bf_grd_cd", "fonc_stts_cd",
                                      "apot_dt", "apot_no", "apot_atch_file_id", "del_yn", "frst_regst_id",
                                      "frst_rgsr_dttm", "last_chpr_id", "last_chg_dttm", "aprv_id",
                                      "prcs_stts_cd") FROM 'C:\wrk\dzGeo\cocDb\csv\tb_poti_emp_fonc_hist_202509020835.csv' DELIMITER ',' CSV HEADER;
select count(*)
FROM alpassint.tb_poti_emp_h;
COPY alpassint.tb_poti_emp_h ("pbsr_no", "col_nm", "chg_hist_srno", "bfch_cn", "afch_cn", "del_yn", "frst_regst_id",
                              "frst_rgsr_dttm", "last_chpr_id", "last_chg_dttm", "chg_ctgy",
                              "chg_tp_cd") FROM 'C:\wrk\dzGeo\cocDb\csv\tb_poti_emp_h_202509020835.csv' DELIMITER ',' CSV HEADER;
select count(*)
FROM alpassint.tb_poti_impv_opin; --1
COPY alpassint.tb_poti_impv_opin ("impv_opin_srno", "app_clsf_cd", "impv_opin_tp_cd", "impv_opin_ttle", "impv_opin_cn",
                                  "impv_opin_lqty_cn", "mdpn_id", "inqt_cnt", "atch_file_id", "prcs_stts_cd", "del_yn",
                                  "frst_regst_id", "frst_rgsr_dttm", "last_chpr_id", "last_chg_dttm", "orgn_mgmt_cd",
                                  "make_dttm", "bsop_ctgy_cd",
                                  "pbsr_no") FROM 'C:\wrk\dzGeo\cocDb\csv\tb_poti_impv_opin_202509020835.csv' DELIMITER ',' CSV HEADER;
select count(*)
FROM alpassint.tb_poti_orgn;
COPY alpassint.tb_poti_orgn ("orgn_mgmt_cd", "orgn_cd", "orgn_tp_cd", "orgn_nm", "orgn_desc", "orgn_regn_cd",
                             "orgn_addr", "rprs_tlph_no", "rprs_fax_no", "hsrk_orgn_mgmt_cd", "upr_orgn_mgmt_cd",
                             "orgn_stts_cd", "del_yn", "frst_regst_id", "frst_rgsr_dttm", "last_chpr_id",
                             "last_chg_dttm", "orgn_eng_nm", "post_cd", "admn_cd", "acnt_cd", "lttd", "lngt",
                             "vrtl_orgn_yn", "sort_ordr", "dphd_id", "orgn_ar_nm", "blng_orgn_mgmt_cd", "eml",
                             "orgn_auth", "dgd_cd", "actv_cstm_cd", "ccp_ac_no",
                             "rit_ac_no") FROM 'C:\wrk\dzGeo\cocDb\csv\tb_poti_orgn_202509020845.csv' DELIMITER ',' CSV HEADER;


--[2025-09-03 10:21:52] executed on wadoo d08