package dz.coc9.service.dtococ.request;

import lombok.Data;

@Data
public class CocReportRequest {

    // Search filters
/*
    private String searchReportRefNo;
    private String searchValidationStatus;
    private String searchReportInfNature;
    private String searchReportTypeCode;
*/
    // Search filters used in  CocReportMapper.xml

    private String  vldtStts;
    private String  orgnCd;
    private String  srchVldtStts;//searchValidationStatus
    private String  srchRprtTpCd;//searchReportTypeCode
    private String  srchOrgnCd;
    private String  srchRprtInfNtr;//searchReportInfNature
    private String  rprtRqstDtFrom;
    private String  rprtRqstDtTo;


//    private String
}
