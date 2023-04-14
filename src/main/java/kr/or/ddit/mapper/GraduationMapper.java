package kr.or.ddit.mapper;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.AcademicVO;

public interface GraduationMapper {
	//학생 학적정보 출력
	//<select id="getStuInfo" parameterType="int" resultType="hashMap">
	public Map<String, Object> getStuInfo(int stuNum);

	//전체학기 전공 이수학점 조회(전필/전선)
	//<select id="getSumMRecode" parameterType="hashMap" resultType="int">
	public int getSumMRecode(Map<String, Object> infoMap);

	//금학기 전공 이수학점 조회(전필/전선)
	//<select id="getThisSumMRecode" parameterType="hashMap" resultType="int">
	public int getThisSumMRecode(Map<String, Object> infoMap);

	//교양 이수학점 조회(교필/교선)
	//<select id="getSumERecode" parameterType="hashMap" resultType="int">
	public int getSumERecode(Map<String, Object> infoMap);

	//금학기 교양 이수학점 조회(교필/교선)
	//<select id="getThisSumERecode" parameterType="hashMap" resultType="int">
	public int getThisSumERecode(Map<String, Object> infoMap);

	//전체학기 평균평점 조회
	//<select id="getAvgFscore" parameterType="int" resultType="hashMap">
	public Map<String, Object> getAvgFscore(int stuNum);

	//F학점 갯수 조회
	//<select id="getFCnt" parameterType="int" resultType="int">
	public int getFCnt(int stuNum);

	//조기졸업 신청내역 조회(상태: 대기, 승인)
	//<select id="getEGHistory" parameterType="hashMap" resultType="int">
	public int getEGHistory(Map<String, Object> eghMap);

	//(학생)조기졸업 신청
	//<select id="appEG" parameterType="hashMap">
	public int appEG(Map<String, Object> egMap);

	//조기졸업 신청목록 조회
	//<select id="getAppEG" parameterType="int" resultType="AcademicVO">
	public List<AcademicVO> getAppEG(int stuNum);

	//조기졸업 신청 개별 건 조회
	//<select id="getSingleAppEg" parameterType="hashMap" resultType="AcademicVO">
	public AcademicVO getSingleAppEg(Map<String, Object> egMap);

	//졸업유예 신청목록 조회
	//<select id="getAppGD" parameterType="int" resultType="hashMap">
	public List<Map<String, Object>> getAppGD(int stuNum);

	//졸업유예 신청 개별 건 조회
	//<select id="getSingleAppGd" parameterType="hashMap" resultType="hashMap">
	public Map<String, Object> getSingleAppGd(Map<String, Object> gpMap);

	//승인대기 상태인 졸업유예 신청 건 조회
	//<select id="getGPHistory" parameterType="int" resultType="int">
	public int getGPHistory(int stuNum);

	//졸업유예 신청 등록
	//<select id="appGP" parameterType="int">
	public int appGP(int stuNum);




}














