package dz.coc9.service.dtococ;

import lombok.Data;

@Data
public class T6TransportMarchandiseHelper {


    String vhclType;
    String vhclSSI ;
    String vhclRefNo;
    String propiritaire;
    boolean fiminin =false;

    @Override
    public String toString() {
        String s="";
        
        s +="سيارة من نوع" + vhclType;
        s +="، تحمل لوحة الترقيم: " + vhclSSI;
        s +="الرقم التسلسلي في الطراز:" + vhclRefNo;
        s +="، ملك للمدعو" +propiritaire ; // "، ملك للمدعوة:
        if(fiminin) s += "ة";
        s += " :";
        s += ".";

        return s;
    }
    
    
    
}
