<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<head>
<title>졸업증명서</title>
<meta http_quiv="content-type" content="text/html; charset=utf-8">
<link rel="stylesheet" type="text/css" href="/resources/certFile/AT001_style.css">
</head>
<body id="fileBody">
	<div class="hpa" style="width: 210mm; height: 297mm;">
		<div class="hsR"
			style="top: 78.61mm; left: 58.04mm; width: 95.58mm; height: 73.02mm; background-repeat: no-repeat; background-image: url('/resources/certFile/logo.png');"></div>
		<div class="hsR"
			style="top: 203.21mm; left: 137.62mm; width: 28.05mm; height: 28.05mm; background-repeat: no-repeat; background-image: url('/resources/certFile/stamp.png');"></div>
		<div class="hcD" style="left: 20mm; top: 26.99mm;">
			<div class="hcI">
				<div class="hls ps12"
					style="line-height: 224.94mm; white-space: nowrap; left: 0mm; top: 0mm; height: 224.94mm; width: 170.01mm;">
					<div class="htb"
						style="left: 0.49mm; width: 166.98mm; top: 0.49mm; height: 224.94mm; display: inline-block; position: relative; vertical-align: middle;">
						<svg class="hs" viewBox="-2.50 -2.50 171.98 229.94"
							style="left: -2.50mm; top: -2.50mm; width: 171.98mm; height: 229.94mm;">
							<path d="M0,0 L0,223.96"
								style="stroke:#000000;stroke-linecap:butt;stroke-width:0.40;"></path>
							<path d="M165.99,0 L165.99,223.96"
								style="stroke:#000000;stroke-linecap:butt;stroke-width:0.40;"></path>
							<path d="M0,0 L165.99,0"
								style="stroke:#000000;stroke-linecap:butt;stroke-width:0.40;"></path>
							<path d="M0,223.96 L165.99,223.96"
								style="stroke:#000000;stroke-linecap:butt;stroke-width:0.40;"></path>
							<path d="M165.99,0 L165.99,223.96"
								style="stroke:#000000;stroke-linecap:butt;stroke-width:0.40;"></path>
							<path d="M0,0 L0,223.96"
								style="stroke:#000000;stroke-linecap:butt;stroke-width:0.40;"></path>
							<path d="M0,223.96 L165.99,223.96"
								style="stroke:#000000;stroke-linecap:butt;stroke-width:0.40;"></path>
							<path d="M0,0 L165.99,0"
								style="stroke:#000000;stroke-linecap:butt;stroke-width:0.40;"></path></svg>
						<div class="hce"
							style="left: 0mm; top: 0mm; width: 165.99mm; height: 223.96mm;">
							<div class="hcD" style="left: 0.49mm; top: 0.49mm;">
								<div class="hcI">
									<div class="hls ps13"
										style="line-height: 2.79mm; white-space: nowrap; left: 5.29mm; top: -0.18mm; height: 3.53mm; width: 154.42mm;"></div>
									<div class="hls ps13"
										style="line-height: 2.79mm; white-space: nowrap; left: 5.29mm; top: 5.47mm; height: 3.53mm; width: 154.42mm;"></div>
									<div class="hls ps13"
										style="line-height: 4.80mm; white-space: nowrap; left: 5.29mm; top: 11.01mm; height: 5.64mm; width: 154.42mm;">
										<span class="hrt cs6">제 ${info.NO} 호</span>
									</div>
									<div class="hls ps13"
										style="line-height: 2.79mm; white-space: nowrap; left: 5.29mm; top: 20.14mm; height: 3.53mm; width: 154.42mm;"></div>
									<div class="hls ps13"
										style="line-height: 2.79mm; white-space: nowrap; left: 5.29mm; top: 25.79mm; height: 3.53mm; width: 154.42mm;"></div>
									<div class="hls ps14"
										style="line-height: 7.87mm; white-space: nowrap; left: 5.29mm; top: 31.19mm; height: 8.47mm; width: 154.42mm;">
										<span class="hrt cs7">재 학 증 명 서</span>
									</div>
									<div class="hls ps13"
										style="line-height: 4.10mm; white-space: nowrap; left: 5.29mm; top: 44.91mm; height: 4.94mm; width: 154.42mm;"></div>
									<div class="hls ps17"
										style="line-height: 4.10mm; white-space: nowrap; left: 5.29mm; top: 52.81mm; height: 4.94mm; width: 154.42mm;">
										<span class="hrt cs10">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;성&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;명 &nbsp;: ${info.STU_NM_KOR}</span>
									</div>
									<div class="hls ps18"
										style="line-height: 4.10mm; white-space: nowrap; left: 5.29mm; top: 68.12mm; height: 4.94mm; width: 154.42mm;">
										<span class="hrt cs10">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;생 년 월 일&nbsp;&nbsp;: ${info.BIRTH}</span>
									</div>
									<div class="hls ps18"
										style="line-height: 4.10mm; white-space: nowrap; left: 5.29mm; top: 83.43mm; height: 4.94mm; width: 154.42mm;">
										<span class="hrt cs10">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;대&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;학 &nbsp;: ${info.COLL_NM}</span>
									</div>
									<div class="hls ps17"
										style="line-height: 4.10mm; white-space: nowrap; left: 5.29mm; top: 98.74mm; height: 4.94mm; width: 154.42mm;">
										<span class="hrt cs10">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;학과(학 부)&nbsp;</span><span class="hrt cs11">&nbsp;</span><span
											class="hrt cs10">: ${info.DEPT_NM}</span>
									</div>
									<div class="hls ps17"
										style="line-height: 4.10mm; white-space: nowrap; left: 5.29mm; top: 114.05mm; height: 4.94mm; width: 154.42mm;">
										<span class="hrt cs10">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;학&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;년 &nbsp;: ${info.GRADE}</span>
									</div>
									<div class="hls ps16"
										style="line-height: 4.10mm; white-space: nowrap; left: 5.29mm; top: 129.36mm; height: 4.94mm; width: 154.42mm;">
										<span class="hrt cs10">&nbsp;&nbsp;&nbsp;&nbsp;</span>
									</div>
									<div class="hls ps13"
										style="line-height: 2.79mm; white-space: nowrap; left: 5.29mm; top: 139.31mm; height: 3.53mm; width: 154.42mm;"></div>
									<div class="hls ps13"
										style="line-height: 2.79mm; white-space: nowrap; left: 5.29mm; top: 144.96mm; height: 3.53mm; width: 154.42mm;"></div>
									<div class="hls ps15"
										style="line-height: 6.28mm; white-space: nowrap; left: 5.29mm; top: 150.42mm; height: 7.06mm; width: 154.42mm;">
										<span class="hrt cs0">&nbsp;</span><span class="hrt cs9">위의 사실을 증명합니다.</span>
									</div>
									<div class="hls ps14"
										style="line-height: 4.10mm; white-space: nowrap; left: 5.29mm; top: 163.23mm; height: 4.94mm; width: 154.42mm;">
										<span class="hrt cs8">${info.DATE}</span>
									</div>
									<div class="hls ps14"
										style="line-height: 2.79mm; white-space: nowrap; left: 5.29mm; top: 171.20mm; height: 3.53mm; width: 154.42mm;"></div>
									<div class="hls ps14"
										style="line-height: 2.79mm; white-space: nowrap; left: 5.29mm; top: 176.85mm; height: 3.53mm; width: 154.42mm;"></div>
									<div class="hls ps14"
										style="line-height: 2.79mm; white-space: nowrap; left: 5.29mm; top: 182.49mm; height: 3.53mm; width: 154.42mm;"></div>
									<div class="hls ps14"
										style="line-height: 7.87mm; white-space: nowrap; left: 5.29mm; top: 187.89mm; height: 8.47mm; width: 154.42mm;">
										<span class="hrt cs7">S I K S I K 대 학 교</span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

<script src="/resources/js/html2canvas.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.4/jspdf.min.js"></script>

<script>
function pdfPrint(){
    // 현재 document.body의 html을 A4 크기에 맞춰 PDF로 변환
    html2canvas(document.body, {
        onrendered: function (canvas) {

            // 캔버스를 이미지로 변환
            var imgData = canvas.toDataURL('image/png');

            var imgWidth = 210; // 이미지 가로 길이(mm) A4 기준
            var pageHeight = imgWidth * 1.414;  // 출력 페이지 세로 길이 계산 A4 기준
            var imgHeight = canvas.height * imgWidth / canvas.width;
            var heightLeft = imgHeight;

            var doc = new jsPDF('p', 'mm', 'a4');
            var position = 0;

            // 첫 페이지 출력
            doc.addImage(imgData, 'png', 0, position, imgWidth, imgHeight);
            heightLeft -= pageHeight;

            // 파일 저장
            doc.save('${info.STU_NM_KOR}_재학증명서.pdf');
        }
        
    });
    
}
window.onload = function() {
	pdfPrint();
}
</script>

</html>