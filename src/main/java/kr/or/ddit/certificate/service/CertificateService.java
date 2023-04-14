package kr.or.ddit.certificate.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.IssueCertificateVO;

public interface CertificateService {

	public int getPrice(String ctSnum);

	public Map<String, Object> getStuInfo(int stuNum);

	public int issuedCertificate(IssueCertificateVO icVO);

	public List<Map<String, Object>> getIcList(int stuNum);

	public Map<String, Object> getInfoForFile(String ctSnum, int stuNum);

}
