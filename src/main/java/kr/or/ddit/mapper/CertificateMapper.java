package kr.or.ddit.mapper;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.IssueCertificateVO;

public interface CertificateMapper {

	public int getPrice(String ctSnum);

	public Map<String, Object> getStuInfo(int stuNum);

	public int issuedCertificate(IssueCertificateVO icVO);

	public List<Map<String, Object>> getIcList(int stuNum);

	public Map<String, Object> getInfoForG001(int stuNum);

	public Map<String, Object> getInfoForAT001(int stuNum);

}
