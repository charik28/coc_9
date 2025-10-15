
select * from entity_meta;


SELECT id, name, i18n_key, description
FROM entity_meta
ORDER BY name;

SELECT count(*) FROM tb_poti_emp_bak;



COPY alpassint.tb_poti_impv_opin           ( "impv_opin_srno"             ,                 "app_clsf_cd"             ,                 "impv_opin_tp_cd"             ,                 "impv_opin_ttle"             ,                 "impv_opin_cn"             ,                 "impv_opin_lqty_cn"             ,                 "mdpn_id"             ,                 "inqt_cnt"             ,                 "atch_file_id"             ,                 "prcs_stts_cd"             ,                 "del_yn"             ,                 "frst_regst_id"             ,                 "frst_rgsr_dttm"             ,                 "last_chpr_id"             ,                 "last_chg_dttm"             ,                 "orgn_mgmt_cd"             ,                 "make_dttm"             ,                 "bsop_ctgy_cd"             ,                 "pbsr_no" )          FROM 'C:\wrk\dzGeo\cocDb\csv\tb_poti_impv_opin_202509020835.csv'         DELIMITER ','         CSV HEADER;

COPY alpassint.tb_poti_impv_opin ( "impv_opin_srno" , "app_clsf_cd" , "impv_opin_tp_cd" , "impv_opin_ttle" , "impv_opin_cn" , "impv_opin_lqty_cn" , "mdpn_id" , "inqt_cnt" , "atch_file_id" , "prcs_stts_cd" , "del_yn" , "frst_regst_id" , "frst_rgsr_dttm" , "last_chpr_id" , "last_chg_dttm" , "orgn_mgmt_cd" , "make_dttm" , "bsop_ctgy_cd" , "pbsr_no" ) FROM 'C:\wrk\dzGeo\cocDb\csv\tb_poti_impv_opin_202509020835.csv' DELIMITER ',' CSV HEADER;


COPY alpassint.tb_coc_brq_emp           ( "brq_emp_ref_no"             ,                 "brq_ref_no"             ,                 "emp_pbsr_no"             ,                 "emp_fmnm"             ,                 "emp_nm"             ,                 "emp_fonc_nm"             ,                 "emp_grd_nm" )          FROM 'C:\wrk\dzGeo\cocDb\csv\tb_coc_brq_emp_202509020835.csv'         DELIMITER ','         CSV HEADER
;
