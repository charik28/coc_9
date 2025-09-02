package dz.coc9.service.dtococ;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.io.Serial;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class CocReportDto  {
    @Serial
    private static final long serialVersionUID = 1L;

    private boolean selected;

    // Report identification
    private String reportRefNo;
    private String reportTypeCode;
    private String organizationCode;
    private String operationRefNo;

    // Report information
    private String reportInfoNature;
    private String reportInfoDateTime;
    private String reportInfoPlace;
    private String reportInfoTechnique;
    private String reportInfoProcedure;
    private BigDecimal reportInfoAmendment;
    private String reportInfoLegalText;

    // Location
    private BigDecimal reportLatitude;
    private BigDecimal reportLongitude;

    // Financials
    private String currencyCode;
    private BigDecimal totalCargoValue;

    // Declaration
    private String declarationNo;

    // Validation & status
    private String validationStatus;
    private String requestDateFrom;
    private String requestDateTo;

    // Flags (Y/N)
    private String unknownPersonFlag;
    private String useFlag;
    private String deleteFlag;
    private String changeFlag;

    // Audit info
    private String firstRegistrarId;
    private String firstRegisterDateTime;
    private String lastChangerId;
    private String lastChangeDateTime;
    private String changeReason;

    // Search filters
    private String searchReportRefNo;
    private String searchValidationStatus;
    private String searchReportInfoNature;
    private String searchOrganizationCode;
    private String searchReportTypeCode;
    /** Additional Lists and Objects */

    /** List of cargo-related information */
    private List<CocRprtCagVo> rprtCagList = new ArrayList<>();
    /** List of persons related to the report */
    private List<CocRprtPrsnVo> rprtPrsnList = new ArrayList<>();
    /** List of transport-related details */
    private List<CocRprtTrnpVo> rprtTrnpList = new ArrayList<>();
    /** List of companies involved */
    private List<CocRprtCmpnyVo> rprtCmpnyList = new ArrayList<>();
    /** Voyage-related details */
    private CocRprtVygVo rprtVygVo;

    /** List of employees linked to the report */
    private List<CocMgmtEmpVo> rprtEmpList = new ArrayList<>();


    // Additional info
    private String resultName;
    private List<ComCstmOrgnVo> organizationList = new ArrayList<>();
}
