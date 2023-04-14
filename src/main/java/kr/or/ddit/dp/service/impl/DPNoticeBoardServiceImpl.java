package kr.or.ddit.dp.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.dp.service.IDPNotieBoardService;
import kr.or.ddit.mapper.DPNoticeBoardMapper;
import kr.or.ddit.vo.DepartmentFileVO;
import kr.or.ddit.vo.DepartmentNoticeVO;
import kr.or.ddit.vo.SubjectVO;
import kr.or.ddit.vo.TeacherVO;

@Service
public class DPNoticeBoardServiceImpl implements IDPNotieBoardService{

	@Autowired
	DPNoticeBoardMapper mapper;

	@Override
	public int getDnNum() {
		return mapper.getDnNum();
	}

	@Override
	public int createPost(DepartmentNoticeVO dnVO) {

		int result = mapper.createPost(dnVO);

		List<DepartmentFileVO> dfVOList = dnVO.getDfVOList();
		if(dfVOList != null && dfVOList.size() != 0) {
			result = result + mapper.createPostFiles(dfVOList);
		}

		return result;
	}

	@Override
	public int getTotal(Map<String, Object> map) {
		return mapper.getTotal(map);
	}

	@Override
	public List<DepartmentNoticeVO> getDPNoticeList(Map<String, Object> map) {
		return mapper.getDPNoticeList(map);
	}

	@Override
	public DepartmentNoticeVO detail(int dnNum) {
		mapper.upHit(dnNum);
		return mapper.detail(dnNum);
	}

	@Override
	public int delete(int dnNum) {
		int result = mapper.deleteDF(dnNum);
		result = result + mapper.deleteDN(dnNum);
		return result;
	}

	@Override
	public int deleteFile(int dfNum) {
		return mapper.deleteFile(dfNum);
	}

	@Override
	public int updatePost(DepartmentNoticeVO dnVO) {

		int result = mapper.updatePost(dnVO);

		List<DepartmentFileVO> dfVOList = dnVO.getDfVOList();
		if(dfVOList != null && dfVOList.size() != 0) {
			result = result + mapper.createPostFiles(dfVOList);
		}
		return result;
	}

	@Override
	public List<TeacherVO> getTeachers(int deptNum) {
		return mapper.getTeachers(deptNum);
	}

	@Override
	public List<SubjectVO> getSubjects(int deptNum) {
		return mapper.getSubjects(deptNum);
	}

	@Override
	public List<DepartmentNoticeVO> mainDPNoticeList(int dpNum) {
		return mapper.mainDPNoticeList(dpNum);
	}


}
