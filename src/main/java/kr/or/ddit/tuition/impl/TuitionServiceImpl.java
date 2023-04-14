package kr.or.ddit.tuition.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.TuitionMapper;
import kr.or.ddit.tuition.service.TuitionService;
import kr.or.ddit.vo.CourseListVO;
import kr.or.ddit.vo.TuitionVO;

@Service
public class TuitionServiceImpl implements TuitionService {

	@Autowired
	TuitionMapper tuitionMapper;

	// 등록금 전체 조회 - 학생
	@Override
	public List<TuitionVO> stuTuitionList(Map<String, Object> map) {
		return tuitionMapper.stuTuitionList(map);
	}

	// 등록금 받은 학생 1명 상세보기
	@Override
	public TuitionVO tuitionNum(Map<String, Object> map) {
		return tuitionMapper.tuitionNum(map);
	}

	// 전체 행의 수(total)
	@Override
	public int getTotal(Map<String, Object> map) {
		return tuitionMapper.getTotal(map);
	}

	// 등록금 전체 조회 - 관리자(페이징)
	@Override
	public List<TuitionVO> admTuitionList(Map<String, Object> map) {
		return tuitionMapper.admTuitionList(map);
	}

	// 등록금 전체 조회 시 연도 가져오기
	@Override
	public List<CourseListVO> getTuitionYear() {
		return tuitionMapper.getTuitionYear();
	}

	@Override
	public int checkRnum(Map<String, Object> map) {
		return tuitionMapper.checkRnum(map);
	}

	@Override
	public List<TuitionVO> admTuitionList2(Map<String, Object> map) {
		return tuitionMapper.admTuitionList2(map);
	}

}
