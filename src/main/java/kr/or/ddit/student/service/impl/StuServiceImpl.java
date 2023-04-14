package kr.or.ddit.student.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.StuMapper;
import kr.or.ddit.student.service.StuService;
import kr.or.ddit.vo.DepartmentVO;
import kr.or.ddit.vo.StudentVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class StuServiceImpl implements StuService {
	
	@Autowired
	StuMapper stuMapper;

	/**
	 * 학생 목록
	 * return List<StudentVO>
	 */
	@Override
	public List<StudentVO> stuList() {
		return stuMapper.stuList();
	}
	
	/**
	 * 총 학생 목록 가져오기 + 카테고리 선택
	 * @param selectKey
	 * @return List<StudentVO>
	 */
	@Override
	public List<StudentVO> stuList(int selectKey) {
		return stuMapper.stuList(selectKey);
	}


	/**
	 * 다수의 학생을 DB에 추가하는 메소드
	 * @param stuList 
	 * @return 실행 결과 (성공:1, 실패0)
	 */
	@Override
	public int insertMany(List<StudentVO> stuList) {
//		for(StudentVO stuVO : stuList) {
//			int res = stuMapper.insertStu(stuVO);
//		}
		int res1 = stuMapper.insertManyUsers(stuList);
		int res2 = stuMapper.insertMany(stuList);
		int res3 = stuMapper.insertManyAuth(stuList);
		if(res1>0 && res2>0 && res3>0) {
			return 1;
		}else {
			return 0;
		}
	}

	/**
	 * 학과 정보 가져오기
	 * @return List<DepartmentVO>
	 */
	@Override
	public List<DepartmentVO> getDeptList() {
		return stuMapper.getDeptList();
	}

	/**
	 * 총 학생 수 가져오기
	 * @return Map<String,Integer>
	 */
	@Override
	public Map<String,Integer> totalStu() {
		Map<String,Integer> map = new HashedMap();
		
		int res1 = stuMapper.totalStu();
		int res2 = stuMapper.newStu();
		int res3 = stuMapper.originStu();
		int res4 = stuMapper.gradStu();
		
		map.put("total", res1);
		map.put("newS", res2);
		map.put("origin", res3);
		map.put("grad", res4);
		
		return map;
	}

	

}
