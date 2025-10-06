package dz.coc9.service.interfaces;

import dz.coc9.vo.OperationVo;

import java.util.List;

public interface IOperationService {

    public List<OperationVo> findAll() ;
        public OperationVo findById(Long id);
}
