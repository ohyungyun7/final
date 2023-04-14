package kr.or.ddit.acad.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.acad.service.IACADNoticeBoardService;
import kr.or.ddit.mapper.ACADNoticeBoardMapper;
import kr.or.ddit.vo.NoticeBoardFileVO;
import kr.or.ddit.vo.NoticeBoardVO;

@Service
public class ACADNoticeBoardServiceImpl implements IACADNoticeBoardService{

	@Autowired
	ACADNoticeBoardMapper mapper;

	@Override
	public int getNbNum() {
		return mapper.getNbNum();
	}

	@Override
	public int createPost(NoticeBoardVO nbVO) {

		int result = mapper.createPost(nbVO);

		List<NoticeBoardFileVO> filesList = nbVO.getFileVOList();
		if(filesList != null && filesList.size() != 0) {
			result = result + mapper.filesPost(filesList);
		}
		return result;
	}

	@Override
	public int getTotal(Map<String, Object> map) {
		return mapper.getTotal(map);
	}

	@Override
	public List<NoticeBoardVO> getNoticeList(Map<String, Object> map) {
		return mapper.getNoticeList(map);
	}

	@Override
	public NoticeBoardVO detail(int nbNum) {
		mapper.upHit(nbNum);
		return mapper.detail(nbNum);
	}

	@Override
	public int deleteFile(int nbfNum) {
		return mapper.deleteFile(nbfNum);
	}

	@Override
	public int updatePost(NoticeBoardVO nbVO) {

		int result = mapper.updatePost(nbVO);

		List<NoticeBoardFileVO> filesList = nbVO.getFileVOList();
		if(filesList != null && filesList.size() != 0) {
			result = result + mapper.filesPost(filesList);
		}
		return result;
	}

	@Override
	public int delete(int nbNum) {

		int result = mapper.deleteNF(nbNum);
		result = result + mapper.deleteNB(nbNum);

		return result;
	}

	@Override
	public List<NoticeBoardVO> mainAcadNoticeList() {
		return mapper.mainAcadNoticeList();
	}

}
