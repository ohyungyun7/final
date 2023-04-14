package kr.or.ddit.study.timetable.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.StudyTimetableMapper;
import kr.or.ddit.study.timetable.service.IStudyTimetableService;
import kr.or.ddit.vo.StudentVO;
import kr.or.ddit.vo.TimeVO;
import kr.or.ddit.vo.VoteVO;
import kr.or.ddit.vo.VotersVO;

@Service
public class StudyTimetableServiceImpl implements IStudyTimetableService{

	@Autowired
	StudyTimetableMapper mapper;

	@Override
	public List<StudentVO> getStuList(int roomNumber) {
		return mapper.getStuList(roomNumber);
	}

	@Override
	public List<TimeVO> getTimeTableData(int stuNum) {
		return mapper.getTimeTableData(stuNum);
	}

	@Override
	public int getVoteNum() {
		return mapper.getVoteNum();
	}

	@Override
	public int addVote(VoteVO voteVO) {

		int result = mapper.addVote(voteVO);

		List<VotersVO> list = voteVO.getVotersList();
		result = result + mapper.addVoters(list);

		return result;
	}

	@Override
	public List<VoteVO> getVoteList(int roomNumber) {
		return mapper.getVoteList(roomNumber);
	}

	@Override
	public int checkVoters(VotersVO votersVO) {
		return mapper.checkVoters(votersVO);
	}

	@Override
	public VoteVO voteDetail(VotersVO votersVO) {

		VoteVO voteVO = mapper.voteDetail(votersVO);
		VoteVO voteRate = mapper.voteRate(votersVO);
		voteVO.setYes(voteRate.getYes());
		voteVO.setNo(voteRate.getNo());
		voteVO.setParticipation(voteRate.getParticipation());
		voteVO.setVoteAns(voteRate.getVoteAns());
		voteVO.setVoteAdmin(voteRate.getVoteAdmin());

		return voteVO;
	}

	@Override
	public int delVote(int delNum) {
		int result = mapper.delVoters(delNum);
		result = result + mapper.delVote(delNum);
		return result;
	}

	@Override
	public int voteUpdate(VotersVO votersVO) {
		return mapper.voteUpdate(votersVO);
	}

	@Override
	public List<TimeVO> stuTimetable(int stuNum) {
		return mapper.stuTimetable(stuNum);
	}

	@Override
	public List<TimeVO> teaTimetable(int teaNum) {
		return mapper.teaTimetable(teaNum);
	}

	@Override
	public List<String> studyList(int stuNum) {
		return mapper.studyList(stuNum);
	}


}
