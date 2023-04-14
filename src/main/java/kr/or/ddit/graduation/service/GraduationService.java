package kr.or.ddit.graduation.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.AcademicVO;

public interface GraduationService {

	//학생 학적정보 출력
	//<select id="getStuInfo" parameterType="int" resultType="hashMap">
	public Map<String, Object> getStuInfo(int stuNum);

	//전공 이수학점 조회(전필/전선)
	public int getSumMRecode(Map<String, Object> infoMap);

	//교양 이수학점 조회(교필/교선)
	public int getSumERecode(Map<String, Object> infoMap);

	//금학기 전공 이수학점 조회(전필/전선)
	public int getThisSumMRecode(Map<String, Object> infoMap);

	//금학기 교양 이수학점 조회(교필/교선)
	public int getThisSumERecode(Map<String, Object> infoMap);

	//전체학기 평균평점 조회
	public Map<String, Object> getAvgFscore(int stuNum);

	//F학점 갯수 조회
	public int getFCnt(int stuNum);

	//조기졸업 신청내역 조회(상태: 대기, 승인)
	public int getEGHistory(Map<String, Object> eghMap);

	//(학생)조기졸업 신청
	public int appEG(Map<String, Object> egMap);

	//조기졸업 신청목록 조회
	public List<AcademicVO> getAppEG(int stuNum);

	//조기졸업 신청 개별 건 조회
	public AcademicVO getSingleAppEg(Map<String, Object> egMap);

	//졸업유예 신청목록 조회
	public List<Map<String, Object>> getAppGD(int stuNum);

	//졸업유예 신청 개별 건 조회
	public Map<String, Object> getSingleAppGd(Map<String, Object> gpMap);

	//승인대기 상태인 졸업유예 신청 건 조회
	public int getGPHistory(int stuNum);

	//졸업유예 신청 등록
	public int appGP(int stuNum);



}
