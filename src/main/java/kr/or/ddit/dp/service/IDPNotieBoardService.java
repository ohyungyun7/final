package kr.or.ddit.dp.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.DepartmentNoticeVO;
import kr.or.ddit.vo.SubjectVO;
import kr.or.ddit.vo.TeacherVO;

public interface IDPNotieBoardService {

	public int getDnNum();

	public int createPost(DepartmentNoticeVO dnVO);

	public int getTotal(Map<String, Object> map);

	public List<DepartmentNoticeVO> getDPNoticeList(Map<String, Object> map);

	public DepartmentNoticeVO detail(int dnNum);

	public int delete(int dnNum);

	public int deleteFile(int dfNum);

	public int updatePost(DepartmentNoticeVO dnVO);

	public List<TeacherVO> getTeachers(int deptNum);

	public List<SubjectVO> getSubjects(int deptNum);

	public List<DepartmentNoticeVO> mainDPNoticeList(int dpNum);



}
