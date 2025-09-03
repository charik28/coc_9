COPY alpassint.tb_coc_arm
    (arm_ref_no, arm_srno, arm_mx_cp_ch, arm_cd, orgn_cd, del_yn, use_yn, frst_regst_id, frst_rgsr_dttm, last_chpr_id,
     last_chg_dttm, arm_stts)
    FROM 'C:\wrk\dzGeo\cocDb\csv\tb_coc_arm_202509020829.csv'
    DELIMITER ','
    CSV HEADER;


INSERT INTO alpassint.tb_coc_arm
(arm_ref_no, arm_srno, arm_mx_cp_ch, arm_cd, orgn_cd, del_yn, use_yn, frst_regst_id, frst_rgsr_dttm, last_chpr_id,
 last_chg_dttm, arm_stts)
VALUES ('', '', 0, '', '', '', '', '', '', '', '', '');



COPY alpassint.tb_coc_amo ("amo_ref_no", "amo_qty", "amo_calb", "orgn_cd", "del_yn", "use_yn", "frst_regst_id",
                           "frst_rgsr_dttm", "last_chpr_id", "last_chg_dttm", "amo_mnfc_yy", "white_yn") FROM C :
\wrk\dzGeo\cocDb\csv\tb_coc_amo_202509020829.csv             DELIMITER ','             CSV HEADER;

COPY alpassint.tb_poti_orgn ( "orgn_mgmt_cd" , "orgn_cd" , "orgn_tp_cd" , "orgn_nm" , "orgn_desc" , "orgn_regn_cd" , "orgn_addr" , "rprs_tlph_no" , "rprs_fax_no" , "hsrk_orgn_mgmt_cd" , "upr_orgn_mgmt_cd" , "orgn_stts_cd" , "del_yn" , "frst_regst_id" , "frst_rgsr_dttm" , "last_chpr_id" , "last_chg_dttm" , "orgn_eng_nm" , "post_cd" , "admn_cd" , "acnt_cd" , "lttd" , "lngt" , "vrtl_orgn_yn" , "sort_ordr" , "dphd_id" , "orgn_ar_nm" , "blng_orgn_mgmt_cd" , "eml" , "orgn_auth" , "dgd_cd" , "actv_cstm_cd" , "ccp_ac_no" , "rit_ac_no" ) FROM 'C:\wrk\dzGeo\cocDb\csv\tb_poti_orgn_202509020845.csv' DELIMITER ',' CSV HEADER;