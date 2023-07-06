package servlet.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.util.EgovMap;
import servlet.model.Carbon_Insert;
import servlet.model.SggDTO;

@Repository("ServletDAO")
public class ServletDAO extends EgovComAbstractDAO {
	
	@Autowired
	private SqlSessionTemplate session;
	
	// 테스트
	public List<EgovMap> selectAll() {
		return selectList("servlet.serVletTest");
	}
	// 테스트
	public List<EgovMap> Test() {
		return selectList("servlet.realTest");
	}

	
	// 시군구명 산출
	public List<SggDTO> get_sgg_nm(String sd_nm) {
		// TODO Auto-generated method stub
		System.out.println("sd_nm(DAO):"+sd_nm);
		return selectList("servlet.select_sgg_nm", sd_nm);
	}
	

	// sd - 중심좌표 산출
	public List<SggDTO> getCenter(SggDTO sd) {
		// TODO Auto-generated method stub
		
		List<SggDTO> center = selectList("servlet.get_center", sd);
		
		return center;
	}

	public SggDTO return_sgg_cd(String sgg_nm) {
		// TODO Auto-generated method stub
		
		SggDTO return_sgg_cd = selectOne("servlet.get_sgg_cd", sgg_nm);
		
		return return_sgg_cd;
	}

	public List<SggDTO> sd_nm_list() {
		// TODO Auto-generated method stub
		
		List<SggDTO> sd_nm_list = selectList("servlet.get_sd_nm");
		
		return sd_nm_list;
	}
	public List<SggDTO> getCenter_sgg(SggDTO sd) {
		// TODO Auto-generated method stub
		
		List<SggDTO> center = selectList("servlet.get_center_sgg", sd);
		
		return center;
	}
	public List<SggDTO> get_legend(SggDTO sd) {
		// TODO Auto-generated method stub
		System.out.println("sgg_count(DAO):"+sd.getSgg_count());
		System.out.println("sgg_count(DAO):"+sd.getSgg_count());
		List<SggDTO> legend = selectList("servlet.get_legend", sd);
		
		return legend;
	}
	
	// 시도 전체 검색시, 범례 반환
	public List<SggDTO> get_legend_sd_all() {
		// TODO Auto-generated method stub
		
		List<SggDTO> legend = selectList("servlet.get_legend_sd_all");
		
		return legend;
	}
	
	
	// 법정동 갯수 반환
	public int return_bjd_cnt(String sgg_cd) {
		// TODO Auto-generated method stub
		
		int bjd_cnt = selectOne("servlet.return_bjd_cnt", sgg_cd);
		
		return bjd_cnt;
	}
	
	// 법정동 범례 반환
	public List<SggDTO> get_legend_bjd(SggDTO sd) {
		// TODO Auto-generated method stub
		System.out.println("sgg_cd(DAO):"+sd.getSgg_cd());
		List<SggDTO> legend_list = selectList("servlet.get_legend_bjd", sd);
		
		return legend_list;
	}
	
	// (통계) 시도별 사용량 반환
	public List<SggDTO> get_sd_inform() {
		// TODO Auto-generated method stub
		
		List<SggDTO> sd_inform = selectList("servlet.get_sd_inform");
		
		return sd_inform;
	}
	
	
	// (통계) 시군구 사용량 반환
	public List<SggDTO> get_sgg_inform(SggDTO stat) {
		// TODO Auto-generated method stub
		
		List<SggDTO> sgg_inform = selectList("servlet.get_sgg_inform", stat);
		
		return sgg_inform;
	}
	public int insertContents(Carbon_Insert CI) {
		// TODO Auto-generated method stub
		System.out.println("dao");
		
		return session.insert("servlet.insertContents", CI);
	}

}
