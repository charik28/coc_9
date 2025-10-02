/** selectRprtList */
SELECT B.RPRT_TP_CD,
                             B.ORGN_CD,
                             B.RPRT_INF_NTR,
                             TO_CHAR(to_date(B.RPRT_INF_DTTM::varchar), 'DD/MM/YYYY HH24:MI:SS')  AS RPRT_INF_DTTM,
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
                             TO_CHAR(to_date(B.FRST_RGSR_DTTM::varchar), 'DD/MM/YYYY HH24:MI:SS') AS FRST_RGSR_DTTM,
                             B.LAST_CHPR_ID,
                             TO_CHAR(to_date(B.LAST_CHG_DTTM::varchar), 'DD/MM/YYYY HH24:MI:SS')  AS LAST_CHG_DTTM
                      FROM alpassint.TB_COC_RPRT B
                               JOIN alpassint.TB_POTI_ORGN A ON A.ORGN_CD = B.ORGN_CD
                      WHERE B.DEL_YN = 'N'
                        AND B.chng_yn = 'N'
--                         AND B.VLDT_STTS = ?
                        AND (? IN ('000000000', '308000000') OR A.ORGN_CD = ? OR A.ORGN_MGMT_CD IN
                                                                                 (SELECT ORGN_MGMT_CD FROM alpassint.TB_POTI_ORGN WHERE DEL_YN = 'N' START WITH ORGN_CD = ? CONNECT BY PRIOR ORGN_MGMT_CD = UPR_ORGN_MGMT_CD)
                          ) AND LOWER(B.VLDT_STTS) LIKE '%' || LOWER(?) || '%' AND B.RPRT_TP_CD = ? AND LOWER(B.RPRT_INF_NTR) LIKE '%' || LOWER(?) || '%' AND TO_CHAR(to_date(B.FRST_RGSR_DTTM), 'YYYYMMDD') >= TO_CHAR(TO_DATE(?, 'DD/MM/YYYY'), 'YYYYMMDD') AND TO_CHAR(to_date(B.FRST_RGSR_DTTM), 'YYYYMMDD') <= TO_CHAR(TO_DATE(?, 'DD/MM/YYYY'), 'YYYYMMDD')
                      ORDER BY TO_CHAR(to_date(B.FRST_RGSR_DTTM), 'YYYYMMDD') DESC
                      limit 50