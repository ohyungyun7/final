package kr.or.ddit.mapper;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.DepartmentFileVO;
import kr.or.ddit.vo.DepartmentNoticeVO;
import kr.or.ddit.vo.NoticeBoardFileVO;
import kr.or.ddit.vo.NoticeBoardVO;
import kr.or.ddit.vo.SubjectVO;
import kr.or.ddit.vo.TeacherVO;

public interface ACADNoticeBoardMapper {

	public int getNbNum();

	public int createPost(NoticeBoardVO nbVO);

	public int filesPost(List<NoticeBoardFileVO> imagesList);

	public int getTotal(Map<String, Object> map);

	public List<NoticeBoardVO> getNoticeList(Map<String, Object> map);

	public void upHit(int nbNum);

	public NoticeBoardVO detail(int nbNum);

	public int deleteFile(int nbfNum);

	public int updatePost(NoticeBoardVO nbVO);

	public int deleteNF(int nbNum);

	public int deleteNB(int nbNum);

	public List<NoticeBoardVO> mainAcadNoticeList();


}
