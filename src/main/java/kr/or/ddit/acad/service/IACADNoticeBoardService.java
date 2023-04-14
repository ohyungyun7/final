package kr.or.ddit.acad.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.NoticeBoardVO;

public interface IACADNoticeBoardService {

	public int getNbNum();

	public int createPost(NoticeBoardVO nbVO);

	public int getTotal(Map<String, Object> map);

	public List<NoticeBoardVO> getNoticeList(Map<String, Object> map);

	public NoticeBoardVO detail(int nbNum);

	public int deleteFile(int nbfNum);

	public int updatePost(NoticeBoardVO nbVO);

	public int delete(int nbNum);

	public List<NoticeBoardVO> mainAcadNoticeList();

}
