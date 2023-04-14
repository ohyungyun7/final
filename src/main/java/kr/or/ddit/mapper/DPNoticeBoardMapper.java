package kr.or.ddit.mapper;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.DepartmentFileVO;
import kr.or.ddit.vo.DepartmentNoticeVO;
import kr.or.ddit.vo.SubjectVO;
import kr.or.ddit.vo.TeacherVO;

public interface DPNoticeBoardMapper {

	public int getDnNum();

	public int createPost(DepartmentNoticeVO dnVO);

	public int createPostFiles(List<DepartmentFileVO> dfVOList);

	public List<DepartmentNoticeVO> getDPNoticeList(int deptNum);

	public int getTotal(Map<String, Object> map);

	public List<DepartmentNoticeVO> getDPNoticeList(Map<String, Object> map);

	public void upHit(int dnNum);

	public DepartmentNoticeVO detail(int dnNum);

	public int deleteDF(int dnNum);

	public int deleteDN(int dnNum);

	public int deleteFile(int dfNum);

	public int updatePost(DepartmentNoticeVO dnVO);

	public List<TeacherVO> getTeachers(int deptNum);

	public List<SubjectVO> getSubjects(int deptNum);

	public List<DepartmentNoticeVO> mainDPNoticeList(int dpNum);





}
