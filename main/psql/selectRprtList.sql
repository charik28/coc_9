-- selectRprtList
SELECT
--     'false' AS chkSel,
--     B.RPRT_REF_NO,
    B.RPRT_TP_CD,
    B.ORGN_CD,
    B.RPRT_INF_NTR,
    TO_CHAR(B.RPRT_INF_DTTM, 'DD/MM/YYYY HH24:MI:SS') AS RPRT_INF_DTTM,
    B.RPRT_INF_PLC,
    B.RPRT_LAT,
    B.RPRT_LONG,
    B.RPRT_INF_TCH,
    B.DCLR_NO,
    B.RPRT_INF_PRCD,
    B.RPRT_INF_AMD,
    B.CURR_CD,
    B.RPRT_INF_JRDQ_TXT,
    B.ATCH_FILE_ID,
    B.CAG_VAL_TTL,
    B.VLDT_STTS,
    B.OPRN_REF_NO,
    B.unknown_yn,
    B.USE_YN,
    B.DEL_YN,
    B.FRST_REGST_ID,
    TO_CHAR(B.FRST_RGSR_DTTM, 'DD/MM/YYYY HH24:MI:SS') AS FRST_RGSR_DTTM,
    B.LAST_CHPR_ID,
    TO_CHAR(B.LAST_CHG_DTTM, 'DD/MM/YYYY HH24:MI:SS') AS LAST_CHG_DTTM
FROM alpassint.TB_COC_RPRT B
         JOIN alpassint.TB_POTI_ORGN A ON A.ORGN_CD = B.ORGN_CD
WHERE B.DEL_YN = 'N'
  AND B.chng_yn = 'N'
-- and rprt_tp_cd = 'SPS'
  AND (
    :orgnCd IN ('000000000', '308000000')
        OR A.ORGN_CD = :orgnCd
        OR A.ORGN_MGMT_CD IN (SELECT ORGN_MGMT_CD
                              FROM alpassint.TB_POTI_ORGN
                              WHERE DEL_YN = 'N'
        START WITH ORGN_CD = :orgnCd
        CONNECT BY PRIOR ORGN_MGMT_CD = UPR_ORGN_MGMT_CD
    )
    )
ORDER BY TO_CHAR(B.FRST_RGSR_DTTM,'YYYYMMDD') DESC

;