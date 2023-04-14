<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="/resources/js/jquery-3.6.0.js"></script>
<script src="/resources/js/jquery-3.6.3.min.js"></script>
<style type="text/css">
.categoryBar {
	color: gray;
}

thead {
	text-align: center;
}

.card {
	min-height: 100%;
}

.input-box {
	width: 10%;
	display: inline;
}
</style>

<h4 class="title fw-bold py-3 mb-2 categoryBar">
	<i class="bx bx-wallet-alt page-icon"></i>
	등록금  ·  장학금 확인
</h4>

<div class="card">
	<div class="card-header">
		<h3 class="card-title">등록금 납부 내역</h3>
	</div>

	<div class="card-body">
		<div id="example1_wrapper" class="dataTables_wrapper dt-bootstrap4">

			<div class="row">
				<div class="col-sm-12">
					<table id="example1" class="table table-bordered table-striped dataTable dtr-inline" aria-describedby="example1_info">
						<thead class="table-active">
							<tr class="text-nowrap">
								<th onclick="event.cancelBubble=true" style="text-align: center">번호</th>
								<th onclick="event.cancelBubble=true" style="text-align: center">년도</th>
								<th onclick="event.cancelBubble=true" style="text-align: center">학기</th>
								<th onclick="event.cancelBubble=true" style="text-align: center">등록금</th>
								<th onclick="event.cancelBubble=true" style="text-align: center">장학금</th>
								<th onclick="event.cancelBubble=true" style="text-align: center">납부총액</th>
								<th onclick="event.cancelBubble=true" style="text-align: center">납부일자</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="TuitionVO" items="${stuTuitionList}"
								varStatus="stat">
								<tr>
									<td style="text-align: center">${stat.index+1}</td>
									<td style="text-align: center">${TuitionVO.tpYear}</td>
									<td style="text-align: center">${TuitionVO.tpSemester}</td>
									<td style="text-align: center"><fmt:formatNumber type="number" maxFractionDigits="3" value="${TuitionVO.tpAmt}" />원</td>
									<td style="text-align: center"><fmt:formatNumber type="number" maxFractionDigits="3" value="${TuitionVO.slAmt}" />원</td>
									<td style="text-align: center"><fmt:formatNumber type="number" maxFractionDigits="3" value="${TuitionVO.toTal}" />원</td>
									<td style="text-align: center"><fmt:parseDate value='${TuitionVO.tpDt}' var='tpDt' pattern='yyyy-mm-dd' />
										<fmt:formatDate value="${tpDt}" pattern="yyyy년 mm월 dd일" /></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
	$(function() {
		var lang_eng = {
			"info" : "Showing _START_ to _END_ of _TOTAL_ entries",
			"infoEmpty" : "Showing 0 to 0 of 0 entries",
			"search" : "Search : ",
			"zeroRecords" : "No matching records found",
			"paginate" : {
				"first" : "First",
				"last" : "Last",
				"next" : "Next",
				"previous" : "Previous"
			},
			"aria" : {
				"sortAscending" : " :  activate to sort column ascending",
				"sortDescending" : " :  activate to sort column descending"
			}
		};

		// Korean
		var lang_kor = {
			"info" : "",
			"infoEmpty" : "",
			"search" : "검색 : ",
			"zeroRecords" : "검색된 데이터가 없습니다.",
			"paginate" : {
				"first" : "첫 페이지",
				"last" : "마지막 페이지",
				"next" : "다음",
				"previous" : "이전"
			},
		};
		$("#example1").DataTable({
			"responsive" : true,
			"lengthChange" : false,
			"autoWidth" : false,
			language : lang_kor
		})

	});
</script>