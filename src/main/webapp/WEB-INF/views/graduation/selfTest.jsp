<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<style type="text/css">
body {
	font-family: 'Noto Sans KR', sans-serif;
}
td {
	border-color: #5f61e6;
    border-style: dashed;
    border-width: 1;
}
table{
	border-color: #787bff;
    border-style: soild;
    border-width: 1;
}
thead {
	background-color: #9496f382;
}
.pointA {
	 background-color: #9496f382;
	 font-weight: bold;
}

</style>

<h4 class="title fw-bold py-3 mb-2 categoryBar">
	<i class="bx bxs-graduation page-icon"></i>
	<span class="fw-light" >졸업 / </span>졸업 자가진단
</h4>

<div class="card">
	<div class="card-body">
		<table class="table table-hover text-center">
			<thead >
				<tr>
					<th rowspan="2">구분</th>
					<th colspan="2">전공</th>
					<th colspan="2">교양</th>
					<th rowspan="2">복수전공</th>
					<th rowspan="2">부전공</th>
					<th rowspan="2">합계</th>
					<th rowspan="2">비고</th>
				</tr>
				<tr>
					<th>필수</th>
					<th>선택</th>
					<th>필수</th>
					<th>선택</th>
				</tr>
			</thead>
			<tr>
				<td>이수조건</td>
				<td colspan="2">60</td>
				<td colspan="2">30</td>
				<td>-</td>
				<td>-</td>
				<td>130</td>
				<td></td>
			</tr>
			<tr>
				<td>이수완료학점</td>
				<td>${recordMap.sumMrRecode - recordMap.sumThisMrRecode}</td>
				<td>${recordMap.sumMsRecode - sumThisMsRecode}</td>
				<td>${recordMap.sumErRecode - sumThisErRecode}</td>
				<td>${recordMap.sumEsRecode - sumThisEsRecode}</td>
				<td>-</td>
				<td>-</td>
				<td>${(recordMap.sumMrRecode - recordMap.sumThisMrRecode)
					+ (recordMap.sumMsRecode - sumThisMsRecode)
					+ (recordMap.sumErRecode - sumThisErRecode)
					+ (recordMap.sumEsRecode - sumThisEsRecode)}</td>
				<td></td>
			</tr>
			<tr>
				<td>현학기 이수학점</td>
				<td>${recordMap.sumThisMrRecode}</td>
				<td>${recordMap.sumThisMsRecode}</td>
				<td>${recordMap.sumThisErRecode}</td>
				<td>${recordMap.sumThisEsRecode}</td>
				<td>-</td>
				<td>-</td>
				<td>${(recordMap.sumThisMrRecode)
					+ (recordMap.sumThisMsRecode)
					+ (recordMap.sumThisErRecode)
					+ (recordMap.sumThisEsRecode)}</td>
				<td></td>
			</tr>
			<tr>
				<td>총 이수예정학점</td>
				<td>${recordMap.sumMrRecode}</td>
				<td>${recordMap.sumMsRecode}</td>
				<td>${recordMap.sumErRecode}</td>
				<td>${recordMap.sumEsRecode}</td>
				<td>-</td>
				<td>-</td>
				<td>${(recordMap.sumMrRecode)
					+ (recordMap.sumMsRecode)
					+ (recordMap.sumErRecode)
					+ (recordMap.sumEsRecode)}</td>
				<td></td>
			</tr>
			<tr class="pointA">
				<td>부족학점</td>
				<td colspan="2">${ 60 - ((recordMap.sumMrRecode) + (recordMap.sumMsRecode)) }</td>
<!-- 				<td>12</td> -->
				<td colspan="2">${ 30 - ((recordMap.sumErRecode) + (recordMap.sumEsRecode)) }</td>
<!-- 				<td>10</td> -->
				<td>-</td>
				<td>-</td>
				<td>${130 - (	(recordMap.sumMrRecode)
							  + (recordMap.sumMsRecode)
							  + (recordMap.sumErRecode)
							  + (recordMap.sumEsRecode)		)}</td>
				<td></td>
			</tr>
		</table>

	</div>
</div>