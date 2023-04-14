package kr.or.ddit.exam;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.AnswerVO;
import kr.or.ddit.vo.ExamQue;
import kr.or.ddit.vo.ExamSel;
import kr.or.ddit.vo.StudentVO;
import kr.or.ddit.vo.SubjectVO;

public interface ExamService {

	/**
	 * 교수가 시험을 내기 전에 미리 시험문제를 냈는지 안냈는지 체크
	 * 미리 냈으면 count가 1 이상 없으면 0
	 * @param string
	 * @return
	 */
	public int examCheck(String string);

	/**
	 * 시험을 등록한다는 EXAM 테이블에 등록을함
	 * @param sbjNum
	 * @return
	 */
	public int examMake(String sbjNum);

	/**
	 * 과목에 대한 상세정보 가져오기
	 * @param sbjNum
	 * @return
	 */
	public SubjectVO subjectDetail(String sbjNum);

	/***
	 * 시험과목의 exam테이블에서 등록된 시험 번호를 가져옴
	 * @param sbjNum
	 * @return
	 */
	public int getExamNum(String sbjNum);

	/***
	 * 시험과목의 exam_que테이블에 시험문제와 답을 넣음
	 * @param map
	 * @return
	 */
	public int examQue(Map<String, Object> map);

	/**
	 * exam_que 테이블에서 등록된 문제번호 가져오기
	 * @param map
	 * @return
	 */
	public int getExamqueNum(Map<String, Object> map);

	/**
	 * exam_sel 테이블에 등록된 문제항목 넣기
	 * @param map
	 * @return
	 */
	public int examSel(Map<String, Object> map);

	/***
	 * EXAM_QUE 테이블에서 리스트 가져옴
	 * @param map
	 * @return
	 */
	public List<ExamQue> getExamQueList(Map<String, Object> map);

	/***
	 * EXAM_SEL 테이블에서 리스트 가져옴
	 * @param map
	 * @return
	 */
	public List<ExamSel> getExamSelList(Map<String, Object> map);

	/**
	 * 시험문제 업데이트하기가 워낙 까다로워서 그냥 기존에 있었던거 다 지우고
	 * 새로 INSERT하는 방식을 채택
	 * EXAM_SEL(보기테이블)다 지움
	 * @param map
	 * @return
	 */
	public int deleteExamSel(Map<String, Object> map);

	/**
	 * 시험문제 업데이트하기가 워낙 까다로워서 그냥 기존에 있었던거 다 지우고
	 * 새로 INSERT하는 방식을 채택
	 * EXAM_QUE(보기테이블)다 지움
	 * @param map
	 * @return
	 */
	public int deleteExamQue(Map<String, Object> map);

	/**
	 * 시험문제 업데이트하기가 워낙 까다로워서 그냥 기존에 있었던거 다 지우고
	 * 새로 INSERT하는 방식을 채택
	 * EXAM(보기테이블)다 지움
	 * @param map
	 * @return
	 */
	public int deleteExam(Map<String, Object> map);

	/**
	 * 1:N관계의 EXMQUE가 아닌 그냥 1:1 정답과 답만 가져옴
	 * @param map
	 * @return
	 */
	public List<ExamQue> getExamQue(Map<String, Object> map);

	/**
	 * 학생이 문제 풀고 답을 제출함
	 * @param map
	 * @return
	 */
	public int submitMyAnswer(Map<String, Object> map);

	/***
	 * 학생이 시험보기 위한 시험 리스트 뽑기
	 * @param stuNum
	 * @return
	 */
	public StudentVO getStuInfo(int stuNum);

	/**
	 * 교수가 출제한 문제와 답 가져오기
	 * @param map2
	 * @return
	 */
	public List<ExamQue> examQueList(Map<String, Object> map2);

	/***
	 * 내가 제출한 문제와 답 가져오기
	 * @param map2
	 * @return
	 */
	public List<AnswerVO> answerVOList(Map<String, Object> map2);

	/***
	 * 교수가 출제한 문제와 답 그리고 학생의 답 가져오기
	 * @param map2
	 * @return
	 */
	public List<ExamQue> examQueListAndAns(Map<String, Object> map2);

}
