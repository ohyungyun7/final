package kr.or.ddit.cm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.cm.service.CmService;
import kr.or.ddit.mapper.CmMapper;
import kr.or.ddit.vo.SubjectVO;

@Service
public class CmServiceImpl implements CmService{
	
	@Autowired
	CmMapper cmMapper;

	@Override
	public List<SubjectVO> getAll() {
		return cmMapper.getAll();
	}

	@Override
	public int approval(String sbjNum) {
		int res = cmMapper.approval(sbjNum);
		System.out.println(" approval res : " + res);
		return res;
	}
	
	@Override
	public int declined(String sbjNum) {
		int res = cmMapper.declined(sbjNum);
		System.out.println(" declined res : " + res);
		return res;
	}
	
	@Override
	public int closed(String sbjNum) {
		int res = cmMapper.closed(sbjNum);
		System.out.println(" closed res : " + res);
		return res;
	}

}
