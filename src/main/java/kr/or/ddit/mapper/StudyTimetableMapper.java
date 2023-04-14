package kr.or.ddit.mapper;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.StudentVO;
import kr.or.ddit.vo.TimeVO;
import kr.or.ddit.vo.VoteVO;
import kr.or.ddit.vo.VotersVO;

public interface StudyTimetableMapper {

	public List<StudentVO> getStuList(int roomNumber);

	public List<TimeVO> getTimeTableData(int stuNum);

	public int getVoteNum();

	public int addVote(VoteVO voteVO);

	public int addVoters(List<VotersVO> list);

	public List<VoteVO> getVoteList(int roomNumber);

	public int checkVoters(VotersVO votersVO);

	public VoteVO voteDetail(VotersVO votersVO);

	public VoteVO voteRate(VotersVO votersVO);

	public int delVoters(int delNum);

	public int delVote(int delNum);

	public int voteUpdate(VotersVO votersVO);

	public List<TimeVO> stuTimetable(int stuNum);

	public List<TimeVO> teaTimetable(int teaNum);

	public List<String> studyList(int stuNum);


}









