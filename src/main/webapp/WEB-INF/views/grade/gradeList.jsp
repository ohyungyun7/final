<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style type="text/css">
.card{
	min-height: 100%;
}
/* .categoryBar{ */
/* 	color: gray; */
/* } */
.si_target{
	width: 50%;
	text-align: center;
}
thead{
	text-align: center;
}
.table > thead {
	vertical-align: middle;
}
th{
 	white-space: pre-line;
 	text-align: center;
 }
tr td {
  text-align: center;
}
.div-header{
	text-align: right;
	margin: 5px;
	padding-right: 1.625rem;
}
.innerCard{
	border: 1px solid lightgray;
	border-radius: 5px;
	margin: 5px;
	padding: 10px;
}
.search-sel{
	width: 20%;
	display: inline;
}
.border-box{
	border: 1px solid lightgray;
	border-radius: 5px;
}
.importantTr > td{
	background-color: lightgray;
	font-weight: bold;
}
</style>

<h4 class="title fw-bold py-3 mb-2 categoryBar">
	<i class="bx bxs-report page-icon"></i>
	<span style="font-weight: normal;">성적조회 / </span>전체학기 성적 조회
</h4>

<div class="card">
	<!--
		model.addAttribute("studentVO", studentVO);
		model.addAttribute("avgScore", avgScore);
		model.addAttribute("kyoYangScore", kyoYangScore);
	 -->
	<div class="card-header">
		<h5 class="title categoryBar">전체성적</h5>
		<div class="border-box">
			<table class="table table-bordered">
				<thead class="table-active">
					<tr class="text-nowrap">
						<th>제1전공</th>
						<th>제2전공</th>
						<th>교양</th>
						<th>제1부전공</th>
						<th>제2부전공</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>${avgScore.sbjRecode}</td>
						<c:if test="${studentVO.stuMinor eq null}">
							<td>해당없음</td>
						</c:if>
						<c:if test="${studentVO.stuMinor ne null}">
							<td>왈왈왈</td>
						</c:if>
						<c:if test="${kyoYangScore.sumRecode eq null}">
							<td>0</td>
						</c:if>
						<c:if test="${kyoYangScore.sumRecode ne null}">
							<td>${kyoYangScore.sumRecode}</td>
						</c:if>
						<c:if test="${studentVO.stuDmajor eq null }">
							<td>해당없음</td>
							<td>해당없음</td>
						</c:if>
						<c:if test="${studentVO.stuDmajor ne null }">
							<td>ㅋㅋㅋ</td>
							<td>ㅁㅈㄷㅎ</td>
						</c:if>
					</tr>
				</tbody>

				<thead class="table-active">
					<tr class="text-nowrap">
						<th>총신청학점</th>
						<th>총취득학점</th>
						<th>평점평균</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>${(avgScore.sbjRecode)+(kyoYangScore.sumRecode)}</td>
						<td>${(avgScore.sbjRecode)+(kyoYangScore.sumRecode)}</td>
						<td><fmt:formatNumber value="${totalAvg.avgClFscore}" pattern=".00"/></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div class="container">
		<h5 class="title categoryBar">전체과목이수현황</h5>
		<table class="table table-bordered">
			<thead class="table-active">
				<tr class="text-nowrap">
					<th>년도/학기</th>
					<th>이수구분</th>
					<th class="si_target">교과목명</th>
					<th>학점</th>
					<th>성적</th>
					<th>평점</th>
				</tr>
			</thead>
			<tbody>
					<c:forEach var="myCourse" items="${myCourseListtt}" varStatus="stat">
						<c:if test="${myCourse.sbjRs ne null}">
							<tr>
								<td>${myCourse.clSemester}</td>
								<td>${myCourse.sbjRs}</td>
								<td>${myCourse.sbjTitle}</td>
								<td>${myCourse.sbjRecode}</td>
								<td>${myCourse.agrade}</td>
								<td><fmt:formatNumber value="${myCourse.clFscore}" pattern=".0"/></td>
							</tr>
						</c:if>
						<c:if test="${myCourse.sbjRs eq null}">
							<tr>
								<th colspan="6" class="text-nowrap">
									취득학점/신청학점 ${myCourse.sumsbjRecode}/ ${myCourse.rslt} &nbsp; 평균학점 <fmt:formatNumber value="${myCourse.avgclFscoree}" pattern=".0"/>/4.5
								</th>
							</tr>
						</c:if>
					</c:forEach>
			</tbody>
		</table>
	</div>

	<br/>
	<div class="container"><hr/>
		<h5 class="title categoryBar">졸업 이수 학점</h5>
		<table class="table table-bordered">
			<thead class="table-active">
				<tr class="text-nowrap">
					<th>구분</th>
					<th>전공</th>
					<th>교양</th>
					<th>복수전공</th>
					<th>부전공</th>
					<th>합계</th>
					<th>비고</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>졸업기준</td>
					<td>100</td>
					<td>30</td>
					<td>0</td>
					<td>0</td>
					<td>130</td>
					<td></td>
				</tr>
				<tr>
					<td>이수완료학점</td>
					<td>${avgScore.sbjRecode}</td>
					<c:if test="${kyoYangScore.sumRecode eq null}">
						<td>0</td>
					</c:if>
					<c:if test="${kyoYangScore.sumRecode ne null}">
						<td>${kyoYangScore.sumRecode}</td>
					</c:if>
					<td>0</td>
					<td>0</td>
					<td>${avgScore.sbjRecode+kyoYangScore.sumRecode}</td>
					<td></td>
				</tr>
				<tr>
					<td>현학기 수강신청</td>
					<c:if test="${willMajor.sbjRecode eq null}">
						<td>0</td>
					</c:if>
					<c:if test="${willMajor.sbjRecode ne null}">
						<td>${willMajor.sbjRecode}</td>
					</c:if>
					<c:if test="${willKyoYang.sbjRecode eq null}">
						<td>0</td>
					</c:if>
					<c:if test="${willKyoYang.sbjRecode ne null}">
						<td>${willKyoYang.sbjRecode}</td>
					</c:if>
					<td>0</td>
					<td>0</td>
					<td>15</td>
					<td></td>
				</tr>
				<tr class="importantTr">
					<td>총이수예정학점</td>
					<td>${avgScore.sbjRecode+willMajor.sbjRecode}</td>
					<td>${kyoYangScore.sumRecode+willKyoYang.sbjRecode}</td>
					<td>0</td>
					<td>0</td>
					<td>${(avgScore.sbjRecode+willMajor.sbjRecode) + (kyoYangScore.sumRecode+willKyoYang.sbjRecode)}</td>
					<td></td>
				</tr>
				<tr class="importantTr">
					<td>부족학점</td>
					<c:if test="${avgScore.sbjRecode+willMajor.sbjRecode >99}">
						<td>+${ (avgScore.sbjRecode+willMajor.sbjRecode) - 100}</td>
					</c:if>
					<c:if test="${avgScore.sbjRecode+willMajor.sbjRecode < 100}">
						<td>-${100 - (avgScore.sbjRecode+willMajor.sbjRecode)}</td>
					</c:if>
						<c:if test="${kyoYangScore.sumRecode+willKyoYang.sbjRecode >29}">
						<td>+${ (kyoYangScore.sumRecode+willKyoYang.sbjRecode) - 30}</td>
					</c:if>
					<c:if test="${kyoYangScore.sumRecode+willKyoYang.sbjRecode < 30}">
						<td>-${30 - (kyoYangScore.sumRecode+willKyoYang.sbjRecode)}</td>
					</c:if>
					<td>0</td>
					<td>0</td>
					<td>0</td>
					<td></td>
				</tr>
			</tbody>
		</table>
	</div>

</div>
