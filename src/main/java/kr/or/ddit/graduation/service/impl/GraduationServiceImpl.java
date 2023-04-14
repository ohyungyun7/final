package kr.or.ddit.graduation.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.graduation.service.GraduationService;
import kr.or.ddit.mapper.GraduationMapper;
import kr.or.ddit.vo.AcademicVO;

@Service
public class GraduationServiceImpl implements GraduationService{
	@Autowired
	GraduationMapper graduationMapper;

	//학생 학적정보 출력
	//<select id="getStuInfo" parameterType="int" resultType="hashMap">
	public Map<String, Object> getStuInfo(int stuNum){
		return this.graduationMapper.getStuInfo(stuNum);
	}

	//전공 이수학점 조회(전필/전선)
	@Override
	public int getSumMRecode(Map<String, Object> infoMap) {
		return this.graduationMapper.getSumMRecode(infoMap);
	}

	//금학기 전공 이수학점 조회(전필/전선)
	@Override
	public int getThisSumMRecode(Map<String, Object> infoMap) {
		return this.graduationMapper.getThisSumMRecode(infoMap);
	}

	//교양 이수학점 조회(교필/교선)
	@Override
	public int getSumERecode(Map<String, Object> infoMap) {
		return this.graduationMapper.getSumERecode(infoMap);
	}

	//금학기 교양 이수학점 조회(교필/교선)
	@Override
	public int getThisSumERecode(Map<String, Object> infoMap) {
		return this.graduationMapper.getThisSumERecode(infoMap);
	}

	//전체학기 평균평점 조회
	@Override
	public Map<String, Object> getAvgFscore(int stuNum){
		return this.graduationMapper.getAvgFscore(stuNum);
	}

	//F학점 갯수 조회
	@Override
	public int getFCnt(int stuNum) {
		return this.graduationMapper.getFCnt(stuNum);
	}

	//조기졸업 신청내역 조회(상태: 대기, 승인)
	@Override
	public int getEGHistory(Map<String, Object> eghMap) {
		return this.graduationMapper.getEGHistory(eghMap);
	}

	//(학생)조기졸업 신청
	@Override
	public int appEG(Map<String, Object> egMap) {
		return this.graduationMapper.appEG(egMap);
	}

	//조기졸업 신청목록 조회
	@Override
	public List<AcademicVO> getAppEG(int stuNum){
		return this.graduationMapper.getAppEG(stuNum);
	}

	//조기졸업 신청 개별 건 조회
	@Override
	public AcademicVO getSingleAppEg(Map<String, Object> egMap) {
		return this.graduationMapper.getSingleAppEg(egMap);
	}

	//졸업유예 신청목록 조회
	@Override
	public List<Map<String, Object>> getAppGD(int stuNum){
		return this.graduationMapper.getAppGD(stuNum);
	}

	//졸업유예 신청 개별 건 조회
	@Override
	public Map<String, Object> getSingleAppGd(Map<String, Object> gpMap){
		return this.graduationMapper.getSingleAppGd(gpMap);
	}

	//승인대기 상태인 졸업유예 신청 건 조회
	@Override
	public int getGPHistory(int stuNum) {
		return this.graduationMapper.getGPHistory(stuNum);
	}

	//졸업유예 신청 등록
	@Override
	public int appGP(int stuNum) {
		return this.graduationMapper.appGP(stuNum);
	}




}
