package dz.coc9.service;

import dz.coc9.mappers.OrgnMapper;
import dz.coc9.vo.OrgnDTO;
import dz.coc9.vo.OrgnFlatDTO;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class OrgnService {


    private final OrgnMapper orgnMapper;

    public OrgnService(OrgnMapper orgnMapper) {
        this.orgnMapper = orgnMapper;
    }

    /**
     * rend25 
     */

    public List<OrgnDTO> getOrganizationalHierarchy() {
        List<OrgnFlatDTO> flatList = orgnMapper.getHierarchy();

        Map<String, OrgnDTO> drMap = new LinkedHashMap<>();

        for (OrgnFlatDTO row : flatList) {
            // DR
            OrgnDTO drGroup = drMap.computeIfAbsent(row.getDr(), dr -> {
                OrgnDTO dto = new OrgnDTO();
                dto.setDr(dr);
                dto.setIdds(new ArrayList<>());
                return dto;
            });

            // IDD
            OrgnDTO.IddDTO iddGroup = drGroup.getIdds().stream()
                    .filter(i -> i.getIdd().equals(row.getIdd()))
                    .findFirst()
                    .orElseGet(() -> {
                        OrgnDTO.IddDTO iddDTO = new OrgnDTO.IddDTO();
                        iddDTO.setIdd(row.getIdd());
                        iddDTO.setBrigades(new ArrayList<>());
                        drGroup.getIdds().add(iddDTO);
                        return iddDTO;
                    });

            // Brigades
            if (row.getBrigade() != null && !iddGroup.getBrigades().contains(row.getBrigade())) {
                iddGroup.getBrigades().add(row.getBrigade());
            }
        }

        return new ArrayList<>(drMap.values());
    }
    /**
     * alpassint.tb_poti_orgn
     * @return
     */

    public  List<OrgnFlatDTO> findAll(){
        return orgnMapper.findAll();
    }

   public OrgnFlatDTO findOrgnByCd(String orgnCd){

        HashMap<String,Object> map = new HashMap<>();
        map.put("orgnCd",orgnCd);

        var l =orgnMapper.findAll(map);
        if(!l.isEmpty()){
            return l.get(0);
        }
        return  null;
    }
   public  List<OrgnFlatDTO> findAllDrs(){
        return orgnMapper.findAllDrs();
    }
   public  List<OrgnFlatDTO> findSubOrgnByParentCd(String orgnCd){

        return orgnMapper.findSubOrgnByParentCd("", orgnCd);
    }
   public  List<OrgnFlatDTO> findAllInsByParentCd(String parentCd){

        return orgnMapper.findSubOrgnByParentCd("INS",parentCd);
    }
   public  List<OrgnFlatDTO> findAllBriByParentCd(String parentCd){

        return orgnMapper.findSubOrgnByParentCd("BRI",parentCd);
    }



}
