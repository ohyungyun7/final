package kr.or.ddit.graph;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.graph.service.GraphService;
import kr.or.ddit.mapper.GraphMapper;
import kr.or.ddit.vo.ColleageVO;
import kr.or.ddit.vo.DepartmentVO;
import kr.or.ddit.vo.StudentVO;

@Service
public class GraphServiceImpl implements GraphService {

	@Inject
	GraphMapper graphMapper;

	/***
	 * 단과대 리스트 가져오기
	 * @return
	 */
	@Override
	public List<ColleageVO> colleageList() {
		return graphMapper.colleageList();
	}

	/***
	 * 단과대별 인원 가져오기
	 * @return
	 */
	@Override
	public List<ColleageVO> sumPeopleList() {
		return graphMapper.sumPeopleList();
	}

	/**
	 *	학과별 인원 가져오기
	 * @return
	 */
	@Override
	public List<ColleageVO> departSumPeople() {
		return graphMapper.departSumPeople();
	}

	/**
	 * 연도 중복 제거
	 * @return
	 */
	@Override
	public List<StudentVO> yearList() {
		return graphMapper.yearList();
	}

	/**
	 * 연도별 성비
	 * @return
	 */
	@Override
	public List<StudentVO> mealFemale() {
		return graphMapper.mealFemale();
	}

	/**
	 * 학과 리스트 가져오기
	 * @return
	 */
	@Override
	public List<DepartmentVO> departList() {
		return graphMapper.departList();
	}

	/**
	 * 학과별 성비 가져오기
	 * @return
	 */
	@Override
	public List<StudentVO> departMaleFemale() {
		return graphMapper.departMaleFemale();
	}

}
