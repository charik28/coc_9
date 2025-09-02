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

