package dz.coc9.service.dtococ;

import lombok.Data;

@Data
public class T7PsnrHelper {

    String nom;
    String dttmNaissance ;
    String info ;

    @Override
    public String toString() {


        String s="";
        if(nom!=null && !nom.isEmpty())
            s += "المدعو: " + nom ;

        if(dttmNaissance!=null && !dttmNaissance.isEmpty())
                s+= "المولود بتاريخ: " + dttmNaissance;

        if(info!=null && !info.isEmpty())
            s += info;

        return s;
    }

}
