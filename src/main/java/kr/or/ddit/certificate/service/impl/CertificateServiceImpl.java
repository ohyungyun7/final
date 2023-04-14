package kr.or.ddit.certificate.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.certificate.service.CertificateService;
import kr.or.ddit.mapper.CertificateMapper;
import kr.or.ddit.vo.IssueCertificateVO;
import kr.or.ddit.vo.StudentVO;

@Service
public class CertificateServiceImpl implements CertificateService {

	@Autowired
	CertificateMapper certificateMapper;

	@Override
	public int getPrice(String ctSnum) {
		return certificateMapper.getPrice(ctSnum);
	}

	@Override
	public Map<String, Object> getStuInfo(int stuNum) {
		return certificateMapper.getStuInfo(stuNum);
	}

	@Override
	public int issuedCertificate(IssueCertificateVO icVO) {
		return certificateMapper.issuedCertificate(icVO);
	}

	@Override
	public List<Map<String, Object>> getIcList(int stuNum) {
		return certificateMapper.getIcList(stuNum);
	}

	@Override
	public Map<String, Object> getInfoForFile(String ctSnum, int stuNum) {
		if(ctSnum.equals("G001")) {
			// 성명 / 생년월일 / 소속(학과) / 학위명 / 입학날짜 / 졸업일자
			return certificateMapper.getInfoForG001(stuNum);
		}
		
		// AT001
		// 이름 / 생년월일 / 대학/ 학과/ 학년
		return certificateMapper.getInfoForAT001(stuNum);
	}
}
