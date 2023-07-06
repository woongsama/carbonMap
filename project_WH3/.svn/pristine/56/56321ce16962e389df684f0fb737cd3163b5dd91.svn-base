package servlet.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import servlet.model.SggDTO;
import servlet.service.ServletService;

@Service("ServletService")
public class ServletImpl extends EgovAbstractServiceImpl implements ServletService{
	
	@Resource(name="ServletDAO")
	private ServletDAO dao;
	
	@Override
	public String addStringTest(String str) throws Exception {
		List<EgovMap> mediaType = dao.selectAll();
		System.out.println("mediaType:"+ mediaType);
		
		return str + " -> testImpl ";
	}

	@Override
	public List<EgovMap> selectList() {
		// TODO Auto-generated method stub
		
		List<EgovMap> tl_sdList = dao.Test();
		
		return tl_sdList;
	}

	@Override
	public List<SggDTO> get_sgg_nm(String sd_nm) {
		// TODO Auto-generated method stub
		
		List<SggDTO> sgg_list = dao.get_sgg_nm(sd_nm);
		
		return sgg_list;
	}

	@Override
	public List<SggDTO> getCenter(SggDTO sd) {
		// TODO Auto-generated method stub
		
		List<SggDTO> center = dao.getCenter(sd);
		
		return center;
	}

	@Override
	public SggDTO return_sgg_cd(String sgg_nm) {
		// TODO Auto-generated method stub
		
		SggDTO return_sgg_cd = dao.return_sgg_cd(sgg_nm);
		
		return return_sgg_cd;
	}

	@Override
	public List<SggDTO> sd_nm_list() {
		// TODO Auto-generated method stub
		
		List<SggDTO> sd_nm_list = dao.sd_nm_list();
		
		return sd_nm_list;
	}

	@Override
	public List<SggDTO> getCenter_sgg(SggDTO sd) {
		// TODO Auto-generated method stub
		
		List<SggDTO> center = dao.getCenter_sgg(sd);
		
		return center;
	}
	
	// 시군구 검색시, 범례 반환
	@Override
	public List<SggDTO> get_legend(SggDTO sd) {
		// TODO Auto-generated method stub
		
		List<SggDTO> legend = dao.get_legend(sd);
		
		return legend;
	}
	
	// 시도 전체 검색시, 범례 반환
	@Override
	public List<SggDTO> get_legend_sd_all() {
		// TODO Auto-generated method stub
		
		List<SggDTO> legend = dao.get_legend_sd_all();
		
		return legend;
	}
	
	
	// 법정동 갯수 반환(범례 갯수 반환을 위한)
	@Override
	public int return_bjd_cnt(String sgg_cd) {
		// TODO Auto-generated method stub
		
		int bjd_cnt = dao.return_bjd_cnt(sgg_cd);
		
		return bjd_cnt;
	}
	
	
	// 법정동 범례 반환
	@Override
	public List<SggDTO> get_legend_bjd(SggDTO sd) {
		// TODO Auto-generated method stub
		
		List<SggDTO> legend_list = dao.get_legend_bjd(sd);
		
		return legend_list;
	}
	
	// (통계) 시도별 탄소배출량 반환
	@Override
	public List<SggDTO> get_sd_inform() {
		// TODO Auto-generated method stub
		
		List<SggDTO> get_sd_inform = dao.get_sd_inform();
		
		return get_sd_inform;
	}
	
	// (통계) 시군구 사용량 반환
	@Override
	public List<SggDTO> get_sgg_inform(SggDTO stat) {
		// TODO Auto-generated method stub
		
		List<SggDTO> sgg_inform = dao.get_sgg_inform(stat);
		
		return sgg_inform;
	}
}
