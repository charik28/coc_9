package dz.coc9.service.dtococ;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;

import java.time.LocalDateTime;

@Data
public class CocReportDto2 {


        private String t1ReportNature; // special / accidens /

        private String orgnNm;
        private String t2InfNature;
        private String t4Emplacement;
        private String t4Dttm;
        private String t5TypeMarchandise;
        private String t6ValueMarchandise;
        private String t6TransportMarchandis;

        @JsonIgnore
        private T6TransportMarchandiseHelper t6TransportMarchandiseHelper;


        public void setT6TransportMarchandiseHelper(T6TransportMarchandiseHelper t6TransportMarchandiseHelper) {

                this.t6TransportMarchandiseHelper = t6TransportMarchandiseHelper;
                this.t6TransportMarchandis = t6TransportMarchandiseHelper.toString();

        }

        private String t6TransportValue = "لم تحدد. ";

        private String t7DetectionTechnology ;
        private String t8Personne ;
        private String t9InractionValue ;
        private String t10Loitxt ;
        private String t11ActionsTaken =": تحرير محضر الحجز ضد المخالف.";



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

        // Getters and Setters
        // (Générez les méthodes getters et setters pour chaque attribut)


}
