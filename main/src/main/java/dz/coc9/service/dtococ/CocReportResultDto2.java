package dz.coc9.service.dtococ;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;

import java.time.LocalDateTime;

@Data
public class CocReportResultDto2 {


        private String rprtTpCd ; // SPS. OTS.   == brqType
//        private String  rprtTpCd; //RPRT_TP_CD

        private String t1ReportNature;

        private String orgnCd;
        private String orgnNm;
        private String rprtInfNtr; // tptyInfNtr=t2InfNature
        private String rprtInfPlc; //t4Emplacement;
        private String rprtInfDttm;//t4Dttm;
        private String t5TypeMarchandise;
        private String t6ValueMarchandise="لم تحدد";
        private String t6TransportMarchandis;

        private String t6TransportValue = "لم تحدد. ";

        private String rprtInfTch; //t7DetectionTechnology ;
        private String t8Personne ;
        private String unknownYn ;
        private String cagValTtl;// rprtInfAmd;// t9InractionValue ;
        private String currCd; // DZD
        private String rprInfJrdqTxt;//t10Loitxt ;
        private String rprtIntPRcd;// t11ActionsTaken =": تحرير محضر الحجز ضد المخالف.";

        @JsonIgnore
        private T6TransportMarchandiseHelper t6TransportMarchandiseHelper;


        public void setT6TransportMarchandiseHelper(T6TransportMarchandiseHelper t6TransportMarchandiseHelper) {

                this.t6TransportMarchandiseHelper = t6TransportMarchandiseHelper;
                this.t6TransportMarchandis = t6TransportMarchandiseHelper.toString();

        }


/*
        private String reportInfoNature; // طبيعة المعلومات
        private LocalDateTime reportInfoDateTime; // تاريخ ووقت المعلومات
        private String reportInfoPlace; // مكان المعلومات
//        private Double reportLatitude; // خط العرض
//        private Double reportLongitude; // خط الطول
        private String reportInfoTech; // تقنية المعلومات
//        private String seizureNo; // رقم الحجز
        private String reportInfoPrice; // سعر المعلومات
        private String reportInfoAmount; // كمية المعلومات
        private String currencyCode; // رمز العملة
        private String reportInfoDescription; // وصف المعلومات
        private String attachmentFileId; // معرف الملف المرفق
        private String totalValue; // القيمة الإجمالية
        private String validityStatus; // حالة الصلاحية
        private String operationRefNo; // رقم المرجع للعملية
        private String unknownYn; // غير معروف
        private String changeReason; // سبب التغيير
//        private String useYn; // استخدام
//        private String deleteYn; // حذف
//        private String firstRegisteredId; // معرف المسجل الأول
//        private LocalDateTime firstRegisteredDateTime; // تاريخ ووقت التسجيل الأول
//        private String lastChangedId; // معرف آخر تغيير
//        private LocalDateTime lastChangedDateTime; // تاريخ ووقت آخر تغيير

*/

}
