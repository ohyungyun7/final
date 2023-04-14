package kr.or.ddit.study.timetable.service;

import java.util.List;

import kr.or.ddit.vo.StudentVO;
import kr.or.ddit.vo.TimeVO;
import kr.or.ddit.vo.VoteVO;
import kr.or.ddit.vo.VotersVO;

public interface IStudyTimetableService {

	public List<StudentVO> getStuList(int roomNumber);

	public List<TimeVO> getTimeTableData(int stuNum);

	public int getVoteNum();

	public int addVote(VoteVO voteVO);

	public List<VoteVO> getVoteList(int roomNumber);

	public int checkVoters(VotersVO votersVO);

	public VoteVO voteDetail(VotersVO votersVO);

	public int delVote(int delNum);

	public int voteUpdate(VotersVO votersVO);

	public List<TimeVO> stuTimetable(int stuNum);

	public List<TimeVO> teaTimetable(int teaNum);

	public List<String> studyList(int stuNum);


}
