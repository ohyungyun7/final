package kr.or.ddit.student.controller;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.student.service.StuService;
import kr.or.ddit.vo.StudentVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class manyStudentController {
	
	@Inject
	StuService stuService;

	@RequestMapping("/manyStudent.do")
	@ResponseBody
	public List<List<String>> manyStudent(@RequestParam Map<Object, Object> map, Model model, MultipartFile poie) {
		log.info("poi에 왔다.");
		int res = 0;

		log.info("map : " + map);
		List<List<String>> excelList =null;
		try {
			//엑셀을 읽는다
			{	// 경로에 있는 파일을 읽어
				log.info("poi : " + poie);
				log.info("poie.toString : " + poie.toString());
				InputStream initialStream = poie.getInputStream();
				XSSFWorkbook workbook = null;
				if (!poie.isEmpty()) {
					workbook = new XSSFWorkbook(initialStream);
				} else {
					log.info("파일 없음!!!!!!!!!!!!!");
					return null;
				}
	
				int rowNo = 0;
				int cellIndex = 0;
	
				XSSFSheet sheet = workbook.getSheetAt(0); // 0 번째 시트를 가져온다
															// 만약 시트가 여러개 인 경우 for 문을 이용하여 각각의 시트를 가져온다
				// -------------------------------------------------
				excelList = new ArrayList<List<String>>(); // list 생성(*)
				// -------------------------------------------------
				int rows = sheet.getPhysicalNumberOfRows(); // 사용자가 입력한 엑셀 Row수를 가져온다
				
	//			int selectRow;
				
				for (rowNo = 0; rowNo < rows; rowNo++) {
					// -------------------------------------------------
					List<String> list = new ArrayList<String>(); // list2 생성(*)
					// -------------------------------------------------
					XSSFRow row = sheet.getRow(rowNo);
					if (row != null) {
						int cells = row.getPhysicalNumberOfCells(); // 해당 Row에 사용자가 입력한 셀의 수를 가져온다
						for (cellIndex = 0; cellIndex <= cells; cellIndex++) {
							XSSFCell cell = row.getCell(cellIndex); // 셀의 값을 가져온다
							String value = "";
							if (cell == null) { // 빈 셀 체크
								continue;
							} else {
								// 타입 별로 내용을 읽는다
								switch (cell.getCellType()) {
								case XSSFCell.CELL_TYPE_FORMULA:
									value = cell.getCellFormula();
									break;
								case XSSFCell.CELL_TYPE_NUMERIC:
									value = cell.getNumericCellValue() + "";
									break;
								case XSSFCell.CELL_TYPE_STRING:
									value = cell.getStringCellValue() + "";
									break;
								case XSSFCell.CELL_TYPE_BLANK:
									value = cell.getBooleanCellValue() + "";
									break;
								case XSSFCell.CELL_TYPE_ERROR:
									value = cell.getErrorCellValue() + "";
									break;
								}
								
							}
							System.out.println(rowNo + "번 행 : " + cellIndex + "번 열 값은: " + value);	//check용
							list.add(value); //1행 완성 (열추가)
	//						System.out.println("innerlist : " + list.toString());	//check용
						} // 반복끝나면 전체 열이 완성됨.
		                excelList.add(list);			//(행추가)
		                
	//	                System.out.println("excelList : "+ excelList.toString());	//check용
					}
				} // row 반복
			}

			// DB로 보낼 객체 생성
			List<StudentVO> stuList = new ArrayList<StudentVO>();
			for(int i=1; i < excelList.size(); i++) {
				StudentVO vo = new StudentVO();
				stuList.add(vo);
			}
			
			// DB로 보낼 객체에 엑셀에서 읽은 데이터 넣어주기
			{
				String keyValue = "";
				String value = "";
				for(int i=1; i<excelList.size(); i++) {
					for(int j=1; j<excelList.get(0).size(); j++) {
						switch(excelList.get(0).get(j)) {
						case "학번" :	
							keyValue = "stuNum";
							value = excelList.get(i).get(j);
							stuList.get(i-1).setStuNum(Integer.parseInt(value+"")); 
							break;
						case "학과번호" :	
							keyValue = "stuDeptNum";
							value = excelList.get(i).get(j);
							stuList.get(i-1).setDeptNum(Integer.parseInt(value+""));
							break;
						case "학과" :	
							keyValue = "stuDeptNm";
							value = excelList.get(i).get(j);
							stuList.get(i-1).setDeptNm(value); 
							break;
						case "이름(한글)" :	
							keyValue = "stuNmKor";
							value = excelList.get(i).get(j);
							stuList.get(i-1).setStuNmKor(value); 
							break;
						case "이름(영문)" :	
							keyValue = "stuNmEng";
							value = excelList.get(i).get(j);
							stuList.get(i-1).setStuNmEng(value); 
							break;
						case "주민번호" :	
							keyValue = "stuReg"; 
							value = excelList.get(i).get(j);
							String[] reg = excelList.get(i).get(j).split("-");
							stuList.get(i-1).setStuReg1(Integer.parseInt(reg[0]+""));
							stuList.get(i-1).setStuReg2(Integer.parseInt(reg[1]+""));
							break;
						case "이메일" :	
							keyValue = "stuEmail";
							value = excelList.get(i).get(j);
							stuList.get(i-1).setStuEmail(value); 
							break;
						case "연락처" :	
							keyValue = "stuPn";
							value = excelList.get(i).get(j);
							stuList.get(i-1).setStuPn(value); 
							break;
						case "은행" :	
							keyValue = "stuBank";
							value = excelList.get(i).get(j);
							stuList.get(i-1).setStuBank(value); 
							break;
						case "계좌번호" :	
							keyValue = "stuAccount";
							value = excelList.get(i).get(j);
							stuList.get(i-1).setStuAccount(value); 
							break;
						case "병역여부" :	
							keyValue = "stuMs";
							value = excelList.get(i).get(j);
							stuList.get(i-1).setStuAccount(value); 
							break;		
						case "장애유무" :	
							keyValue = "stuHdc";
							value = excelList.get(i).get(j);
							stuList.get(i-1).setStuAccount(value); 
							break;
						case "국적" :	
							keyValue = "stuNation";
							value = excelList.get(i).get(j);
							stuList.get(i-1).setStuAccount(value); 
							break;
						}	
					}
				}
				log.info("stuList : " + stuList);
				res = stuService.insertMany(stuList);
				
			}//그룹 end
			
			// jsp로 엑셀데이터 보내기
			model.addAttribute("excel", excelList);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		if(res>0) {
			return excelList;
		}else {
			return null;
		}

	}

}
